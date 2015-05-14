//
//  SHBController.m
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBController.h"
#import "SHBComposedDataSource.h"


@implementation SHBController {
    SHBComposedDataSource *_composedDataSource;
}

- (void)viewDidLoad {
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    _composedDataSource = [[SHBComposedDataSource alloc] initWithKK];
    _composedDataSource.defaultMetrics.rowHeight = AAPLRowHeightVariable;
    _composedDataSource.defaultMetrics.sectionSeparatorColor = [UIColor blackColor];
//    _composedDataSource.defaultMetrics.separatorColor = [UIColor blackColor];
    
    self.collectionView.dataSource = _composedDataSource;
    [super viewDidLoad];
    
    
}

@end
