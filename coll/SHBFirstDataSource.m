//
//  SHBFirstDataSource.m
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBFirstDataSource.h"
#import <AAPLCollectionViewCell.h>
#import "SHBCell.h"

@implementation SHBFirstDataSource

- (void)registerReusableViewsWithCollectionView:(UICollectionView *)collectionView {
    [super registerReusableViewsWithCollectionView:collectionView];
    
    [collectionView registerClass:[SHBCell class] forCellWithReuseIdentifier:NSStringFromClass([SHBCell class])];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AAPLCollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SHBCell class]) forIndexPath:indexPath];
    [(SHBCell *)cell getSize:@"一二三"];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView sizeFittingSize:(CGSize)size forItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cSize = CGSizeZero;
    AAPLCollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SHBCell class]) forIndexPath:indexPath];
    cSize = [(SHBCell *)cell getSize:@"一二三"];
    [cell removeFromSuperview];
    return cSize;
}

- (void)loadContent {
    [self loadContentWithBlock:^(AAPLLoading *loading) {
        void(^handler)(NSArray *, NSError *) = ^(NSArray *data, NSError *error) {
            if (!loading.current) {
                [loading ignore];
                return ;
            }
            if (error) {
                [loading doneWithError:error];
            }
            if (data.count) {
                [loading updateWithContent:^(SHBFirstDataSource *object) {
                    object.items = data;
                }];
            } else {
                [loading updateWithNoContent:^(SHBFirstDataSource *object) {
                    object.items = @[];
                }];
            }
        };
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i < 10; i++) {
            NSString *title = [NSString stringWithFormat:@"%d", i * 10];
            [array addObject:title];
        }
        
        
        handler(array, nil);
    }];
}

@end
