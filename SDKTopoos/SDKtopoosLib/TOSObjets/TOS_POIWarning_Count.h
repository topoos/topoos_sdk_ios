//
//  TOS_POIWarning_Count.h
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

#import <Foundation/Foundation.h>

@interface TOS_POIWarning_Count : NSObject


/** The closed. */
@property (nonatomic,readwrite) int  Closed;

/** The duplicated. */
@property (nonatomic,readwrite) int  Duplicated;

/** The wrong indicator. */
@property (nonatomic,readwrite) int  WrongIndicator;

/** The wrong info. */
@property (nonatomic,readwrite) int  WrongInfo;

/**
 * Instantiates a new pOI warning count.
 *
 * @param closed the closed
 * @param duplicated the duplicated
 * @param wrongIndicator the wrong indicator
 * @param wrongInfo the wrong info
 */
-(TOS_POIWarning_Count*) init;
-(TOS_POIWarning_Count*) initWithClosed: (int ) closed andDuplicated: (int ) duplicated andWrongIndicator:(int ) wrongIndicator andWrongInfo: (int ) wrongInfo;


/**
 * get the closed.
 *
 * @return the closed
 */
- (int ) getClosed;

/**
 * Sets the closed.
 *
 * @param closed the closed to set
 */
- (void) setClosed: (int ) closed;

/**
 * get the duplicated.
 *
 * @return the duplicated
 */
- (int ) getDuplicated;

/**
 * Sets the duplicated.
 *
 * @param duplicated the duplicated to set
 */
- (void) setDuplicated:(int ) duplicated;

/**
 * get the wrong indicator.
 *
 * @return the wrongIndicator
 */
- (int ) getWrongIndicator;

/**
 * Sets the wrong indicator.
 *
 * @param wrongIndicator the wrongIndicator to set
 */
- (void) setWrongIndicator:(int ) wrongIndicator;

/**
 * get the wrong info.
 *
 * @return the wrongInfo
 */
- (int ) getWrongInfo;

/**
 * Sets the wrong info.
 *
 * @param wrongInfo the wrongInfo to set
 */
- (void) setWrongInfo:(int ) wrongInfo;
@end
