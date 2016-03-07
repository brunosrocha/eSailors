//
//  APIService+Archive.m
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "APIService+Archive.h"
#import "Report.h"

@implementation APIService (Archive)

- (void)marsArchive:(Success)success failure:(Failure)failure {
    
    [self requestWith: nil url: @"archive/" method: GET success:^(NSURLSessionDataTask *task, id object) {
        
        NSArray *array = object[@"results"];
        NSMutableArray *mArray = [NSMutableArray array];
        
        for (NSDictionary *dictionary in array) {
            Report *report = [[Report alloc] initWithDictionary: dictionary error: nil];
            [mArray addObject: report];
        }
        
        success(task, mArray);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
        failure(task, error);
        
    }];
}

@end
