//
//  TOS_POIWarning_Count.m
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
#import "TOS_POIWarning_Count.h"

@implementation TOS_POIWarning_Count
/** The closed. */
@synthesize Closed, Duplicated, WrongIndicator, WrongInfo;

/**
 * Instantiates a new pOI warning count.
 *
 * @param closed the closed
 * @param duplicated the duplicated
 * @param wrongIndicator the wrong indicator
 * @param wrongInfo the wrong info
 */
-(TOS_POIWarning_Count*) init{
    self=[super init];
    return self;
}
-(TOS_POIWarning_Count*) initWithClosed: (int ) closed andDuplicated: (int ) duplicated andWrongIndicator:(int ) wrongIndicator andWrongInfo: (int ) wrongInfo{
    self=[super init];
    if (self) {
        Closed=closed;
        Duplicated=duplicated;
        WrongIndicator=wrongIndicator;
        WrongInfo=wrongInfo;
    }
    return self;
}


/**
 * get the closed.
 *
 * @return the closed
 */
- (int ) getClosed{
    return Closed;
}

/**
 * Sets the closed.
 *
 * @param closed the closed to set
 */
- (void) setClosed: (int ) closed{
    Closed=closed;
}

/**
 * get the duplicated.
 *
 * @return the duplicated
 */
- (int ) getDuplicated{
    return Duplicated;
}

/**
 * Sets the duplicated.
 *
 * @param duplicated the duplicated to set
 */
- (void) setDuplicated:(int ) duplicated{
    Duplicated=duplicated;
}

/**
 * get the wrong indicator.
 *
 * @return the wrongIndicator
 */
- (int ) getWrongIndicator{
    return WrongIndicator;
}

/**
 * Sets the wrong indicator.
 *
 * @param wrongIndicator the wrongIndicator to set
 */
- (void) setWrongIndicator:(int ) wrongIndicator{
    WrongIndicator=wrongIndicator;
}

/**
 * get the wrong info.
 *
 * @return the wrongInfo
 */
- (int ) getWrongInfo{
    return WrongInfo;
}

/**
 * Sets the wrong info.
 *
 * @param wrongInfo the wrongInfo to set
 */
- (void) setWrongInfo:(int ) wrongInfo{
    WrongInfo=wrongInfo;
}

@end
