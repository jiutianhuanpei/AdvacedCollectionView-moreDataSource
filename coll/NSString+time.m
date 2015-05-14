//
//  NSString+time.m
//  coll
//
//  Created by 沈红榜 on 15/5/13.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "NSString+time.h"

@implementation NSString (time)
+ (NSString *)timeByTimestamp:(CGFloat)timestamp {
    
    NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"Asia/Chita"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd aa h:mm"];
    [formatter setTimeZone:zone];
    
    CGFloat thatTime = timestamp;
    NSDate *thatDate = [NSDate dateWithTimeIntervalSince1970:thatTime];
    NSString *thatString = [formatter stringFromDate:thatDate];
    NSDate *nowDate = [NSDate date];
    CGFloat nowTime = [nowDate timeIntervalSince1970];
    
    CGFloat spaceTime = nowTime - thatTime;
    
    if (spaceTime / 60 < 5) {
        return @"刚刚";
    } else if (spaceTime < 60 * 60 * 24) {
        NSString *time = [thatString substringFromIndex:11];
        if ([time hasPrefix:@"PM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"PM" withString:@"下午"];
        }
        if ([time hasPrefix:@"AM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"AM" withString:@"上午"];
        }
        return time;
    } else if (spaceTime < 60 * 60 * 24 * 2) {
        NSString *time = [thatString substringFromIndex:11];
        if ([time hasPrefix:@"PM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"PM" withString:@"昨天下午"];
        }
        if ([time hasPrefix:@"AM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"AM" withString:@"昨天上午"];
        }
        return time;
    } else if (spaceTime < 60 * 60 * 24 * 3) {
        NSString *time = [thatString substringFromIndex:11];
        if ([time hasPrefix:@"PM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"PM" withString:@"前天下午"];
        }
        if ([time hasPrefix:@"AM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"AM" withString:@"前天上午"];
        }
        return time;
    } else if (spaceTime < 60 * 60 * 24 * 4) {
        NSString *time = [thatString substringFromIndex:11];
        if ([time hasPrefix:@"PM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"PM" withString:@"大前天下午"];
        }
        if ([time hasPrefix:@"AM"]) {
            time = [time stringByReplacingOccurrencesOfString:@"AM" withString:@"大前天上午"];
        }
        return time;
    } else if (spaceTime < 60 * 60 * 24 * 365) {
        NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
        [dateFor setDateFormat:@"M月d日 aa h:mm"];
        [dateFor setTimeZone:zone];
        NSString *time = [dateFor stringFromDate:thatDate];
        time = [time stringByReplacingOccurrencesOfString:@"PM" withString:@"下午"];
        time = [time stringByReplacingOccurrencesOfString:@"AM" withString:@"上午"];
        return time;
    } else {
        NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
        [dateFor setDateFormat:@"yyyy年M月d日 aa h:mm"];
        [dateFor setTimeZone:zone];
        NSString *time = [dateFor stringFromDate:thatDate];
        time = [time stringByReplacingOccurrencesOfString:@"PM" withString:@"下午"];
        time = [time stringByReplacingOccurrencesOfString:@"AM" withString:@"上午"];
        return time;
    }
}

@end
