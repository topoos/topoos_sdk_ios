//
//  TOS_ViewPort.m
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
#import "TOS_ViewportType.h"

@implementation TOS_ViewportType

@synthesize Northeast,Southwest;

/**
 * Instantiates a new viewport type.
 *
 * @param southwest the southwest
 * @param northeast the northeast
 */
-(TOS_ViewportType*) init
{
    self=[super init];
    return self;
}

-(TOS_ViewportType*) initWithSouthWest: (TOS_Location *) southWest andNorthEast:(TOS_Location *) northEast{
    self=[super init];
    if (self){
        Northeast=northEast;
        Southwest=southWest;
    }
    return self;
}

/**
 * get the northeast.
 *
 * @return the northeast
 */
- (TOS_Location *) getNortheast {
    return Northeast;
}

/**
 * Sets the northeast.
 *
 * @param northeast the northeast to set
 */
- (void) setNortheast:(TOS_Location *) northeast{
    Northeast = northeast;
}

/**
 * get the southwest.
 *
 * @return the southwest
 */
- (TOS_Location *) getSouthwest {
    return Southwest;
}

/**
 * Sets the southwest.
 *
 * @param southwest the southwest to set
 */
- (void) setSouthwest:(TOS_Location *) southwest{
    Southwest = southwest;
}



@end
