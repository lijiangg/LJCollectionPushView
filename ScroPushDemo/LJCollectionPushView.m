//
//  LJCollectionPushView.m
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/9.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "LJCollectionPushView.h"
#import "LJCollectionViewCell.h"

static NSString *cellID = @"LJCollectionViewCell";

@implementation LJCollectionPushView {
    CGFloat pushViewWidth;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _view = [[UINib nibWithNibName:@"LJCollectionPushView" bundle:nil] instantiateWithOwner:self options:nil].firstObject;
        [self addSubview:_view];
        _view.translatesAutoresizingMaskIntoConstraints = NO;
        [self layout];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"LJCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.text = _dataArray[indexPath.row];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f %f",scrollView.contentSize.width,scrollView.contentOffset.x + pushViewWidth);
    _curveView.curveInset = scrollView.contentOffset.x + pushViewWidth  - scrollView.contentSize.width;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (_curveView.curveInset > 100 && [self.delegate respondsToSelector:@selector(turnToViewController)] && self.delegate) {
        [self.delegate turnToViewController];
    }
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    [_collectionView reloadData];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    pushViewWidth = self.frame.size.width;
}
@end
