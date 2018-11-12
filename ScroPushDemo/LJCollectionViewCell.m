//
//  LJCollectionViewCell.m
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/12.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "LJCollectionViewCell.h"

@implementation LJCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setText:(NSString *)text {
    _text = text;
    _label.text = text;
}
@end
