//
//  WeatherTableViewCell.h
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Report.h"

@interface WeatherTableViewCell : UITableViewCell

@property(nonatomic, strong) Report *report;

@end
