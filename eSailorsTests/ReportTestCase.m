//
//  ReportTestCase.m
//  eSailors
//
//  Created by Bruno Rocha on 3/8/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Report.h"

@interface ReportTestCase : XCTestCase

@property (strong) Report *report;

@end

@implementation ReportTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.report = [[Report alloc] initWithDictionary: @{@"terrestrial_date": @"2016-03-03",
                   @"sol": @(1270),
                   @"ls": @(116.0),
                   @"min_temp": @(-82.0),
                   @"min_temp_fahrenheit": @(-115.6),
                   @"max_temp": @(-18.0),
                   @"max_temp_fahrenheit": @(-0.4),
                   @"pressure": @(782.0),
                   @"pressure_string": @"Higher",
                   @"abs_humidity": @"",
                   @"wind_speed": @"",
                   @"wind_direction": @"--",
                   @"atmo_opacity": @"Sunny",
                   @"season": @"Month 4",
                   @"sunrise": @"2016-03-03T11:44:00Z",
                   @"sunset": @"2016-03-03T23:29:00Z"} error: nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
     self.report = nil;
    [super tearDown];
}

- (void)testTerrestrialIsNotNil {
    XCTAssertNotNil(self.report.terrestrial_date, @"Report should have a terrestrial_date");
}

- (void)testSunriseDate {
    XCTAssertNotNil(self.report.sunrise, @"Report should have a sunrise date");
}


- (void)testSunsetDate {
    XCTAssertNotNil(self.report.sunset, @"Report should have a sunset date");
}


@end
