//
//  SHBSectionHeaderView.m
//  coll
//
//  Created by 沈红榜 on 15/5/15.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBSectionHeaderView.h"

@implementation SHBSectionHeaderView {
    UILabel *_rightLabel;
    
    CGRect _frame;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _frame = frame;
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_rightLabel];
        
    }
    return self;
}

- (void)setRightText:(NSString *)rightText {
    _rightLabel.text = rightText;

}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    CGSize size = [_rightText sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    _rightLabel.frame = CGRectMake(0, 0, size.width, _frame.size.height);
    _rightLabel.backgroundColor = [UIColor redColor];
    
}

- (void)updateConstraints {
    [super updateConstraints];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_rightLabel);
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_rightLabel]-|" options:0 metrics:nil views:views]];
    [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_rightLabel]-|" options:0 metrics:nil views:views]];
    
    [self addConstraints:array];
    
    
    
}

@end
