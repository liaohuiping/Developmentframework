//
//  ViewController.m
//  kaifakuangjia
//
//  Created by lhp on 2018/4/9.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "ViewController.h"

#import "MJRefresh.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, WG(100))];
    [imageview sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:nil];
    LogInfoLevel(@"");
    NSLog(@"%ld,%ld",AppLanguageChina,AppLanguageDefault);

}


@end
