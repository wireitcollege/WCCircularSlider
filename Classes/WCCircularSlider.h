//
//  WCCircularSlider.h
//  WCCircularSlider
//
//  Created by Rostyslav Kobizsky on 9/4/15.
//  Copyright (c) 2015 Wire IT College. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface WCCircularSlider : UIControl

/*
 The value in degrees
 The angle from circular slider will starts
 Default value is -90
 */
@property (nonatomic) IBInspectable CGFloat startAngle;

/*
 The value in degrees
 The angle between start end finish positions
 Default value is 90
 */
@property (nonatomic) IBInspectable CGFloat cutoutAngle;

@property (nonatomic) IBInspectable CGFloat progress;
@property (nonatomic) IBInspectable CGFloat lineWidth;

@property (nonatomic, strong) IBInspectable UIColor *guideLineColor;

@property (nonatomic) IBInspectable BOOL enableRoundCap;


/*
 Scale of headerCircle related to lineWidth
 
 Default value is 0.f, No headerCircle
 Default range is (0,4]
 */
@property (nonatomic) IBInspectable CGFloat headerCircleScale;

@end
