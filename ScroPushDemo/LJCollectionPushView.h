//
//  LJCollectionPushView.h
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/9.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJCurveView.h"
@protocol LJCollectionPushViewDelegate <NSObject>

- (void)turnToViewController;

@end
@interface LJCollectionPushView : UIView <UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet LJCurveView *curveView;
@property (weak, nonatomic) IBOutlet id<LJCollectionPushViewDelegate> delegate;

@property (copy, nonatomic) NSArray *dataArray;


@end
