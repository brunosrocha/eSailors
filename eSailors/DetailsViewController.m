//
//  DetailsViewController.m
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "DetailsViewController.h"
#import "Helper.h"

@interface DetailsViewController ()

@property(nonatomic, weak) IBOutlet UILabel *sunsetLabel;
@property(nonatomic, weak) IBOutlet UILabel *sunriseLabel;
@property(nonatomic, weak) IBOutlet UILabel *opacityLabel;
@property(nonatomic, weak) IBOutlet UILabel *maxTempLabel;
@property(nonatomic, weak) IBOutlet UILabel *seasonLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Details";
    
    _maxTempLabel.text = [NSString stringWithFormat: @"%ld C", _report.max_temp];
    _opacityLabel.text = [NSString stringWithFormat: @"Opacity: %@", _report.atmo_opacity];
    _seasonLabel.text = [NSString stringWithFormat: @"Season: %@", _report.season];
    
    NSDate *sunriseDate = [Helper dateFromString: _report.sunrise format: @"yyyy-MM-dd'T'HH:mm:ssZ"];
    
    _sunriseLabel.text = [NSString stringWithFormat: @"Sunrise: %@ at %@", [Helper dayMonth: sunriseDate], [Helper time24String: sunriseDate]];
    
    NSDate *sunsetDate = [Helper dateFromString: _report.sunset format: @"yyyy-MM-dd'T'HH:mm:ssZ"];
    
    _sunsetLabel.text = [NSString stringWithFormat: @"Sunset: %@ at %@", [Helper dayMonth: sunsetDate], [Helper time24String: sunsetDate]];

    
}

@end
