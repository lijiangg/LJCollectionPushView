//
//  ViewController.m
//  ScroPushDemo
//
//  Created by lijiang on 2018/11/9.
//  Copyright © 2018年 lijiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<LJCollectionPushViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pushView.dataArray = @[@"dd",@"dssaf",@"fjjhjfk",@"dsada",
                            @"dd",@"dssaf",@"fjjhjfk",@"dsada",
                            @"dd",@"dssaf",@"fjjhjfk",@"dsada"];
}

- (void)turnToViewController {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
