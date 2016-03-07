//
//  Report.h
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Report : JSONModel

@property(nonatomic, strong) NSString *terrestrial_date;
@property(nonatomic) NSInteger sol;
@property(nonatomic) NSInteger ls;
@property(nonatomic) NSInteger min_temp;
@property(nonatomic) NSInteger min_temp_fahrenheit;
@property(nonatomic) NSInteger max_temp;
@property(nonatomic) NSInteger max_temp_fahrenheit;
@property(nonatomic) NSInteger pressure;
@property(nonatomic, strong) NSString *pressure_string;
@property(nonatomic, strong) NSString<Optional> *abs_humidity;
@property(nonatomic, strong) NSString<Optional> *wind_speed;
@property(nonatomic, strong) NSString<Optional> *wind_direction;
@property(nonatomic, strong) NSString<Optional> *atmo_opacity;
@property(nonatomic, strong) NSString<Optional> *season;
@property(nonatomic, strong) NSString<Optional> *sunrise;
@property(nonatomic, strong) NSString<Optional> *sunset;


@end
