//
//  NSString+time.h
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (time)

+ (NSString *)timeByTimestamp:(CGFloat)timestamp;

@end
