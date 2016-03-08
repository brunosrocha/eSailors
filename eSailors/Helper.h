//
//  Helper.h
//  eSailors
//
//  Created by Bruno Rocha on 3/8/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

+ (NSString *)time24String:(NSDate *)date;

+ (NSString *)dayMonth:(NSDate *)date;

+ (NSDate *)dateFromString:(NSString *)date format:(NSString *)format;


@end
