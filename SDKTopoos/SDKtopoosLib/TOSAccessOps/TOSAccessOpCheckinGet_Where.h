//
//  TOSAccessOpCheckinGet_Where.h
//  SDKtopoos
//
/**
 * Copyright 2014-present topoos
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "TOSAccessOp.h"

@interface TOSAccessOpCheckinGet_Where : TOSAccessOp

/** The oauth_token. */
@property (nonatomic,retain) NSString *  Oauth_token; // (obligatorio) access_token a los recursos del usuario

/** The poi. */
@property (nonatomic,readwrite) int * Poi; // (obligatorio)identificador del POI

/** The InitDate. */
@property (nonatomic,retain) NSDate *  InitDate; // (opcional) InitDate

/** The EndDate. */
@property (nonatomic,retain) NSDate *  EndDate; // (opcional) 


/**
 * Instantiates a new checkin get.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param checkin the checkin
 */
-(TOSAccessOpCheckinGet_Where *) init;
-(TOSAccessOpCheckinGet_Where *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                            andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                                andPoi: (int *) poi  andInitdate:(NSDate *) initDate andEnddate:(NSDate*) endDate;

/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */

- (bool) ValidateParams;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;

@end
