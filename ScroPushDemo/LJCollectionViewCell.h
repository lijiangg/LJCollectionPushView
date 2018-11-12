//
//  LJCollectionViewCell.h
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/12.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (copy, nonatomic) NSString *text;
@end

NS_ASSUME_NONNULL_END
