//
//  WeatherTableViewCell.m
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "WeatherTableViewCell.h"

@interface WeatherTableViewCell ()

@property(nonatomic, weak) IBOutlet UILabel *dateLabel;
@property(nonatomic, weak) IBOutlet UILabel *maxTempLabel;
@property(nonatomic, weak) IBOutlet UILabel *minTempLabel;

@end

@implementation WeatherTableViewCell

- (void)setReport:(Report *)report {

    _report = report;
    
    _dateLabel.text = [NSString stringWithFormat: @"Date: %@", _report.terrestrial_date];
    _maxTempLabel.text = [NSString stringWithFormat: @"Max temp: %ld", _report.max_temp];
    _minTempLabel.text = [NSString stringWithFormat: @"Min temp: %ld", _report.min_temp];
    
}

@end
