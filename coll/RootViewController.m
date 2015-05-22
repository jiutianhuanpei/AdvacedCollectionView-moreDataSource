//
//  RootViewController.m
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "RootViewController.h"
#import "NSString+time.h"
#import "SHBController.h"

#import <AAPLCollectionViewController.h>
#import <AAPLCollectionViewGridLayout.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 100, 40);
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
    NSString *time = [NSString timeByTimestamp:1431588574];

    
}

- (void)clickBtn {
    
    SHBController *shbVC = [[SHBController alloc] initWithCollectionViewLayout:[AAPLCollectionViewGridLayout new]];
    [self.navigationController pushViewController:shbVC animated:YES];
    
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
