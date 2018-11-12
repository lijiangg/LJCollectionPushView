//
//  LJCurveView.m
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/9.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "LJCurveView.h"
#import <Masonry.h>
@implementation LJCurveView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
       
        _view = [[UINib nibWithNibName:@"LJCurveView" bundle:nil] instantiateWithOwner:self options:nil].firstObject;
        [self addSubview:_view];
        _view.translatesAutoresizingMaskIntoConstraints = NO;
    
        [self layout];
        
    }
    return self;
}

- (void)layout {
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self addConstraint:top];
    [self addConstraint:left];
    [self addConstraint:right];
    [self addConstraint:bottom];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    //重绘贝塞尔曲线
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor clearColor]setFill];
    CGContextFillRect(context, rect);
    
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGContextMoveToPoint(context, width, 0);
    CGContextAddCurveToPoint(context, width, 0, width - _curveInset * 1.5, height/2, width, height);
    [[UIColor grayColor]setFill];
    CGContextDrawPath(context, kCGPathFill);
    
    //改变label宽度
    _labelWidthConstraint.constant = _curveInset;
}

- (void)setCurveInset:(CGFloat)curveInset {
    _curveInset = curveInset;
    
    
    
    [self setNeedsDisplay];
}
@end
