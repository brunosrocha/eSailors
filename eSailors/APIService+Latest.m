//
//  APIService+Latest.m
//  eSailors
//
//  Created by Bruno Rocha on 3/8/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "APIService+Latest.h"
#import "Report.h"

@implementation APIService (Latest)

- (void)latestWeatherInfo:(Success)success
                  failure:(Failure)failure {
    
    [self requestWith: nil url: @"latest/" method: GET success:^(NSURLSessionDataTask *task, id object) {
        
        NSError *error;
        
        Report *report = [[Report alloc] initWithDictionary: object[@"report"] error: &error];
        
        if (!error)
            success(task, report);
        else
            failure(task, error);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

@end
