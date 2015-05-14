//
//  SHBkkDataSource.m
//  coll
//
//  Created by 沈红榜 on 15/5/14.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBSegmentedDataSource.h"
#import "SHBFirstDataSource.h"
#import "SHBSecondDataSource.h"
#import "SHBThirdDataSource.h"
#import "SHBFourthDataSource.h"

@implementation SHBSegmentedDataSource {
    SHBFirstDataSource *_firstDataSource;
    SHBFourthDataSource *_sectionDataSource;
    SHBSecondDataSource *_secondDataSource;
    SHBThirdDataSource *_thirdDataSource;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _firstDataSource = [[SHBFirstDataSource alloc] init];
        [self addDataSource:_firstDataSource];
        
        _secondDataSource = [[SHBSecondDataSource alloc] init];
        [self addDataSource:_secondDataSource];
        
        _thirdDataSource = [[SHBThirdDataSource alloc] init];
        _thirdDataSource.defaultMetrics.numberOfColumns = 4;
        _thirdDataSource.defaultMetrics.separatorColor = [UIColor grayColor];
        [self addDataSource:_thirdDataSource];
        
        _sectionDataSource = [[SHBFourthDataSource alloc] init];
        [self addDataSource:_sectionDataSource];
        
    }
    return self;
}


@end
