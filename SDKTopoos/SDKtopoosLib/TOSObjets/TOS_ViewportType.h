//
//  TOS_ViewportType.h
//  SDKtopoos
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

#import <Foundation/Foundation.h>
#import "TOS_Location.h"

@interface TOS_ViewportType : NSObject

/** The southwest. */
@property (nonatomic,retain) TOS_Location * Southwest;

/** The northeast. */
@property (nonatomic,retain) TOS_Location * Northeast;

/**
 * Instantiates a new viewport type.
 *
 * @param southwest the southwest
 * @param northeast the northeast
 */
-(TOS_ViewportType*) init;

-(TOS_ViewportType*) initWithSouthWest: (TOS_Location *) southWest andNorthEast:(TOS_Location *) northEast;

/**
 * get the northeast.
 *
 * @return the northeast
 */
- (TOS_Location *) getNortheast ;

/**
 * Sets the northeast.
 *
 * @param northeast the northeast to set
 */
- (void) setNortheast:(TOS_Location *) northeast;
/**
 * get the southwest.
 *
 * @return the southwest
 */
- (TOS_Location *) getSouthwest ;

/**
 * Sets the southwest.
 *
 * @param southwest the southwest to set
 */
- (void) setSouthwest:(TOS_Location *) southwest;



@end
