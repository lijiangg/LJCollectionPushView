//
//  LJCurveView.h
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/9.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCurveView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWidthConstraint;


@property (assign, nonatomic) IBInspectable CGFloat curveInset;
@end
