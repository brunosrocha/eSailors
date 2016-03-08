//
//  Helper.m
//  eSailors
//
//  Created by Bruno Rocha on 3/8/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (NSString *)time24String:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dayMonth:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"dd.MMM"];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)date format:(NSString *)format {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: format];
    return [formatter dateFromString: date];
}

@end
