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
    [self.needle setTransform:CGAffineTransformMakeRotation(2.37)];
//    [self.needle setTransform:CGAffineTransformMakeRotation(7.07)];
    self.velocityRecognizer.maximumNumberOfTouches = 1;
    [self.velocityRecognizer translationInView:self.topView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)velocityTranslator {
}

@end
