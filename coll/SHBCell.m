//
//  SHBCell.m
//  coll
//
//  Created by 沈红榜 on 15/5/14.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBCell.h"

@implementation SHBCell {
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
    }
    return self;
}

- (CGSize)getSize:(NSString *)title {
    _label.text = title;
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    _label.frame = CGRectMake(0, 0, size.width + 20, size.height + 10);
    return CGSizeMake(size.width + 20, size.height + 10);
}

@end
