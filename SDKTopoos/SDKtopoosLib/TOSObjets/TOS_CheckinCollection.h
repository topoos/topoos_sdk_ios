//
//  TOS_CheckinCollection.h
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

@interface TOS_CheckinCollection : NSObject


/** The categories. #POICategory */
@property (nonatomic,retain) NSMutableArray * Checkins ;

/**
 * Instantiates a new pOI category collection.
 *
 * @param categories the categories
 */
-(TOS_CheckinCollection*) init;

-(TOS_CheckinCollection*) initWithCategories: (NSMutableArray *) Checkins;

/**
 * get a list of the categories.
 *
 * @return the categories
 */
- (NSMutableArray *) getCheckins ;

/**
 * Sets the categories.
 *
 * @param categories the categories to set
 */
- (void) setCheckins:(NSMutableArray *) checkins;

@end
