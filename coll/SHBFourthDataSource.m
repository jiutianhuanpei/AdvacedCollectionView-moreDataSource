//
//  SHBSectionDataSource.m
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBFourthDataSource.h"
#import <AAPLCollectionViewCell.h>
#import "SHBCell.h"

@implementation SHBFourthDataSource {
    NSArray *_array;
}

- (void)registerReusableViewsWithCollectionView:(UICollectionView *)collectionView {
    [super registerReusableViewsWithCollectionView:collectionView];
    
    _array = @[@"1", @"2", @"3", @"4"];
    
    [collectionView registerClass:[SHBCell class] forCellWithReuseIdentifier:NSStringFromClass([SHBCell class])];
}

- (CGSize)collectionView:(UICollectionView *)collectionView sizeFittingSize:(CGSize)size forItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cSize = CGSizeZero;
    AAPLCollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SHBCell class]) forIndexPath:indexPath];
    cSize = [(SHBCell *)cell getSize:_array[indexPath.row]];
    [cell removeFromSuperview];
    return cSize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AAPLCollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SHBCell class]) forIndexPath:indexPath];
    [(SHBCell *)cell getSize:_array[indexPath.row]];
    
    return cell;
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
                [loading updateWithContent:^(SHBFourthDataSource *object) {
                    object.items = data;
                }];
            } else {
                [loading updateWithNoContent:^(SHBFourthDataSource *object) {
                    object.items = @[];
                }];
            }
        };
        
        
        handler(_array, nil);
    }];
}

@end
