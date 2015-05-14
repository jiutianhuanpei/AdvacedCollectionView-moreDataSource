//
//  SHBComposedDataSource.m
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBComposedDataSource.h"
#import "SHBFirstDataSource.h"
#import "SHBSecondDataSource.h"
#import "SHBFourthDataSource.h"
#import <AAPLSectionHeaderView.h>
#import "SHBThirdDataSource.h"
#import "SHBSegmentedDataSource.h"

@implementation SHBComposedDataSource {
    SHBFirstDataSource *_firstDataSource;
    SHBFourthDataSource *_sectionDataSource;
    SHBSecondDataSource *_secondDataSource;
    SHBThirdDataSource *_thirdDataSource;
    SHBSegmentedDataSource  *kkDataSource;
}

- (id)initWithKK {
    self = [super init];
    if (self) {
        
        _firstDataSource = [[SHBFirstDataSource alloc] init];
        _firstDataSource.defaultMetrics.rowHeight = AAPLRowHeightVariable;
        [self addDataSource:_firstDataSource];
        
        CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
        

        
        kkDataSource  = [[SHBSegmentedDataSource alloc] init];
        kkDataSource.defaultMetrics.rowHeight = AAPLRowHeightVariable;
        kkDataSource.shouldDisplayDefaultHeader = NO;
        
        AAPLLayoutSupplementaryMetrics *toolMetrics = [kkDataSource newHeaderForKey:NSStringFromClass([AAPLSectionHeaderView class])];
        toolMetrics.visibleWhileShowingPlaceholder = NO;
        toolMetrics.height = 60;
        toolMetrics.shouldPin = YES;
        toolMetrics.selectedBackgroundColor = [UIColor orangeColor];
        toolMetrics.supplementaryViewClass = [AAPLSectionHeaderView class];
        toolMetrics.configureView = ^(UICollectionReusableView *view, AAPLDataSource *dataSource, NSIndexPath *indexPath) {
            AAPLSectionHeaderView *headerView = (AAPLSectionHeaderView *)view;
            headerView.backgroundColor = [UIColor clearColor];
            
            headerView.bottomBorderColor = [UIColor blackColor];
            headerView.backgroundColorWhenPinned = [UIColor whiteColor];
            headerView.bottomBorderColorWhenPinned = [UIColor orangeColor];
            headerView.highlighted = NO;
            
            NSArray *btnTitles = @[@"第一个", @"第二个", @"第三个", @"第四个"];
            for (int i = 0; i < 4; i++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
                btn.tag = 100 + i;
                btn.backgroundColor = [UIColor clearColor];
                [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
                btn.frame = CGRectMake(maxWidth / 4. * i, 0, maxWidth / 4., 60);
                [btn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
                [headerView addSubview:btn];
            }
            
            
        };
        
        [self addDataSource:kkDataSource];
        
        
    }
    return self;
}



- (void)clickedBtn:(UIButton *)btn {
    
    kkDataSource.selectedDataSourceIndex = btn.tag - 100;
    
}

@end
