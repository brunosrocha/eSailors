//
//  APIService+Latest.h
//  eSailors
//
//  Created by Bruno Rocha on 3/8/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "APIService.h"

@interface APIService (Latest)

- (void)latestWeatherInfo:(Success)success
                  failure:(Failure)failure;
@end
