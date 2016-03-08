//
//  APIServiceTestCase.m
//  eSailors
//
//  Created by Bruno Rocha on 3/8/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APIService+Latest.h"
#import "Report.h"

@interface APIServiceTestCase : XCTestCase

@end

@implementation APIServiceTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark -
#pragma mark - Helper Methods

- (APIService *)createUniqueInstance {
    
    return [[APIService alloc] init];
    
}

- (APIService *)getSharedInstance {
    
    return [APIService instance];
    
}

#pragma mark -
#pragma mark - Tests

- (void)testSingletonSharedInstanceCreated {
    
    XCTAssertNotNil([self getSharedInstance]);
    
}

- (void)testSingletonUniqueInstanceCreated {
    
    XCTAssertNotNil([self createUniqueInstance]);
    
}

- (void)testSingletonReturnsSameSharedInstanceTwice {
    
    APIService *sharedInstance = [self getSharedInstance];
    XCTAssertEqual(sharedInstance, [self getSharedInstance]);
    
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {
    
    APIService *sharedInstance = [self getSharedInstance];
    XCTAssertNotEqual(sharedInstance, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {
    
    APIService *uniqueInstance = [self createUniqueInstance];
    XCTAssertNotEqual(uniqueInstance, [self createUniqueInstance]);
}

- (void)testRequest {
    
    __block BOOL waitingForBlock = YES;
    
    
    [[APIService instance] latestWeatherInfo:^(NSURLSessionDataTask *task, id object) {
        waitingForBlock = NO;
        XCTAssertTrue([object isKindOfClass: [Report class]] , @"result is kind of class Report");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    

    while(waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}


@end
