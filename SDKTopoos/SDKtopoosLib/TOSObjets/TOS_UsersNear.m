//
//  TOS_UsersNear.m
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
#import "TOS_UsersNear.h"

@implementation TOS_UsersNear


/** The userid positions. */
//private ArrayList<UserIdPosition> useridPositions=null;
@synthesize  UseridPositions ;

/**
 * Instantiates a new users near.
 *
 * @param userPositions the user positions
 */

-(TOS_UsersNear*) init{
    self=[super init];
    return self;
}

-(TOS_UsersNear*) initWithUseridPositions: (NSMutableArray *) userPositions {
    self=[super init];
    if(self){
        UseridPositions=userPositions;
    }
        
    return self;
}

/**
 * get the user positions.
 *
 * @return the userPositions
 */
- (NSMutableArray *) getUserPosition {
    return UseridPositions;
}

/**
 * Sets the user positions.
 *
 * @param userPositions the userPositions to set
 */
- (void) setUserPositions:(NSMutableArray *) userPositions {
    UseridPositions = userPositions;
}

@end
