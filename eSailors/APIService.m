//
//  APIService.m
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "APIService.h"

@interface APIService ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation APIService

+ (id)instance {
    static APIService *sharedMyManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init{
    
    if (self = [super init]) {
        
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL: [NSURL URLWithString: @"http://marsweather.ingenology.com/v1/"]];
        
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (void)requestWith:(NSDictionary *)params
                url:(NSString *)url
             method:(NSString *)method
            success:(Success)success
            failure:(Failure)failure {
    
    if ([method isEqualToString: GET]) {
        
        [_manager GET: url parameters: params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(task,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(task,error);
        }];
    } else if ([method isEqualToString: POST]) {
        
        [_manager POST: url  parameters:params progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(task,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(task,error);
        }];
        
    } else if ([method isEqualToString: DELETE]) {
        
        [_manager DELETE: url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(task,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(task,error);
        }];
    } else {
        [_manager PUT: url parameters: params success:^(NSURLSessionDataTask *task, id responseObject) {
            success(task,responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            failure(task,error);
        }];
    }
}




@end
