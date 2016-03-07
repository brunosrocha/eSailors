//
//  APIService+Archive.h
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "APIService.h"

@interface APIService (Archive)

- (void)marsArchive:(Success)success
            failure:(Failure)failure;

@end
