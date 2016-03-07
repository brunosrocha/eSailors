//
//  APIService.h
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/*!
 * @brief Block that handles success
 */
typedef void (^Success)(NSURLSessionDataTask *task, id object);

/*!
 * @brief Block that handles success
 */
typedef void (^Failure)(NSURLSessionDataTask *task, NSError *error);

/*!
 * @brief Network methods that are accepted by the back-end
 */
static NSString *const GET = @"GET";
static NSString *const POST = @"POST";
static NSString *const DELETE = @"DELETE";
static NSString *const PUT = @"PUT";

@interface APIService : NSObject

/*!
 * @discussion APIService single instance
 *
 */

+ (id)instance;

/*!
 * @discussion Method that basically perform a network request
 * @param params an NSDictionary with parameters if there is one.
 * @param success The success block
 * @param failure The failure block
 */

- (void)requestWith:(NSDictionary *)params
                url:(NSString *)url
             method:(NSString *)method
            success:(Success)success
            failure:(Failure)failure;

@end
