//
//  ViewController.h
//  Fastest-RPM
//
//  Created by Li Pan on 2016-01-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *needle;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *velocityRecognizer;
@property (strong, nonatomic) UIView *topView;


@end

