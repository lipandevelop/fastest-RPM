//
//  ViewController.m
//  Fastest-RPM
//
//  Created by Li Pan on 2016-01-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.angle = (self.speedCoefficient * self.speed) + 2.37;
    self.speedCoefficient = 0.002;
//    self.angle = (0.004 * self.speed) + 4.72;

    [self.needle setTransform:CGAffineTransformMakeRotation(self.angle)];
//  [self.needle setTransform:CGAffineTransformMakeRotation(7.07)];
    self.velocityRecognizer.maximumNumberOfTouches = 1;
    [self.velocityRecognizer translationInView:self.view];
}

- (IBAction)velocityTranslator:(UIPanGestureRecognizer *)sender {
    
    CGPoint velocity = [sender velocityInView:self.view];
    
    [self translateVelocityToSpeedViaPythagoreanXIntercept:velocity.x yIntercept:velocity.y];
    if (self.angle > 7.07) {
        self.angle = 7.07;
    }
    if (self.angle < 2.37) {
        self.angle = 2.37;
    }
    
    
    NSLog(@"Coordinates: %f %f", velocity.x, velocity.y);
    NSLog(@"Speed: %f", self.speed);
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        self.angle = (self.speedCoefficient * self.speed) + 2.37;
        [UIView animateWithDuration:0.5 animations:^{
            [self.needle setTransform:CGAffineTransformMakeRotation(self.angle)];
        }];
        
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {

        [UIView animateWithDuration:0.5 animations:^{
            if (self.angle > 4.72) {
                [UIView animateWithDuration:0.10 animations:^{
                    [self.needle setTransform:CGAffineTransformMakeRotation(4.72)];

                }];
            }
            [self.needle setTransform:CGAffineTransformMakeRotation(2.37)];
        }];
    }
    
    
}

- (void)translateVelocityToSpeedViaPythagoreanXIntercept: (double)x yIntercept: (double)y {
    double square = pow(x, 2.0) + pow(y, 2.0);
    double result = sqrt(square);
    self.speed = result;
}

@end
