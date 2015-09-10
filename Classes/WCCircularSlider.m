//
//  WCCircularSlider.m
//  WCCircularSlider
//
//  Created by Rostyslav Kobizsky on 9/4/15.
//  Copyright (c) 2015 Wire IT College. All rights reserved.
//

#import "WCCircularSlider.h"

static inline double DegreesToRadians(double angle) { return M_PI * angle / 180.0; }
static inline double RadiansToDegrees(double angle) { return angle * 180.0 / M_PI; }

static inline CGPoint CGPointCenterRadiusAngle(CGPoint c, double r, double a) {
    return CGPointMake(c.x + r * cos(a), c.y + r * sin(a));
}

static inline CGFloat AngleBetweenPoints(CGPoint a, CGPoint b, CGPoint c) {
    return atan2(a.y - c.y, a.x - c.x) - atan2(b.y - c.y, b.x - c.x);
}

@implementation WCCircularSlider

- (instancetype)init
{
    return [self initWithFrame:CGRectZero] ;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _startAngle = -90.f;
        _cutoutAngle = 90.f;
        _lineWidth = 40.f;
        _guideLineColor = [UIColor clearColor];
        _progress = 0.f;
    }
    [self configureSlider];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self configureSlider];
    return self;
}

- (void)configureSlider {
    UIGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self addGestureRecognizer:panRecognizer];
    [self addGestureRecognizer:tapRecognizer];
}

- (void)handleGesture:(UIGestureRecognizer *)gesture {
    CGPoint location = [gesture locationInView:self];
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = CGRectGetMidX(self.bounds) - self.lineWidth / 2;
    CGFloat startAngle = _startAngle - _cutoutAngle / 2.f;
    if (startAngle < 0) startAngle = fabs(startAngle);
    else startAngle = 360.f - startAngle;
    CGPoint startPoint = CGPointCenterRadiusAngle(center, radius, DegreesToRadians(startAngle));
    CGFloat angle = RadiansToDegrees(AngleBetweenPoints(location, startPoint, center));

    if (angle < 0) angle += 360.f;

    if ((angle > 360.f - _cutoutAngle) && (angle < 360.f - _cutoutAngle/2)) {
        self.progress = 1.0; // upper limit
    } else if (angle > 360.f - _cutoutAngle/2) {
        self.progress = 0.0; // lower limit
    } else {
        self.progress = angle / (360.f - _cutoutAngle);
    }
}

- (void)setStartAngle:(CGFloat)startAngle {
    _startAngle = startAngle;
    [self setNeedsDisplay];
}

- (void)setCutoutAngle:(CGFloat)cutoutAngle {
    _cutoutAngle = cutoutAngle;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetLineWidth(context, self.lineWidth);
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = CGRectGetMidX(self.bounds) - self.lineWidth / 2;
    CGFloat arcStartAngle = DegreesToRadians(self.startAngle + 360.0 - self.cutoutAngle / 2.0);
    CGFloat arcEndAngle = DegreesToRadians(self.startAngle + self.cutoutAngle / 2.0);
    CGFloat progressAngle = DegreesToRadians(360.f - self.cutoutAngle) * self.progress;
    
    [self.guideLineColor set];
    CGContextAddArc(context, center.x, center.y, radius, arcStartAngle, arcEndAngle, 1);
    CGContextStrokePath(context);
    
    [self.tintColor set];
    CGContextAddArc(context, center.x, center.y, radius, arcStartAngle, arcStartAngle - progressAngle, 1);
    CGContextStrokePath(context);
}

@end
