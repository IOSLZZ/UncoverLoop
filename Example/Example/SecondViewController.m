//
//  SecondViewController.m
//  UncoverLoop
//
//  Created by WzxJiang on 16/10/24.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "SecondViewController.h"
#import "BaseView.h"
#import "ThirdViewController.h"
#import "UncoverLoop.h"
@interface SecondViewController () <UncoverLoop>

@end

@implementation SecondViewController {
//    BaseView * _redView;
}

+ (NSArray<NSString *> *)ul_loopPrivatelyKeys {
    return @[@"_redView"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _redView = [BaseView new];
    _redView.backgroundColor = [UIColor redColor];
    _redView.frame = CGRectMake(0, 64, 50, 50);
    [self.view addSubview:_redView];
    
    [_redView setBlock:^{
        self.view.backgroundColor = [UIColor redColor];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[ThirdViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
