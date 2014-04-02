//
//  TOS_PositionCollection.m
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

#import "TOS_PositionCollection.h"

@implementation TOS_PositionCollection

@synthesize PositionCollection;

/**
 * Instantiates a new position collection.
 * @param positionCollection the position collection
 */
-(TOS_PositionCollection*) init
{
    self=[super init];
    return self;
}

-(TOS_PositionCollection*) initWithPositionCollection: (NSMutableArray *) posCollection
{
    self=[super init];
    return self;
}

/**
 * get the position collection.
 * @return the positionCollection
 */
- (NSMutableArray *) getPositionCollection
{
    return PositionCollection;
}

/**
 * Sets the position collection.
 * @param positionCollection the positionCollection to set
 */
- (void) setPositionCollection: (NSMutableArray *) posCollection
{
    PositionCollection = posCollection;
}

@end
