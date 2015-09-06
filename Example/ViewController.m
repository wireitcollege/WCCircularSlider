//
//  ViewController.m
//  WCCircularSlider
//
//  Created by Rostyslav Kobizsky on 9/4/15.
//  Copyright (c) 2015 Wire IT College. All rights reserved.
//

#import "ViewController.h"
#import "WCCircularSlider.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didChangeValue:(WCCircularSlider *)sender {
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", sender.progress * 100.0f];
}

@end
