//
//  TOS_POICollection.h
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

@interface TOS_POICollection : NSObject

@property (nonatomic,retain) NSMutableArray * PoiList ;

/**
 * Instantiates a new pOI collection.
 *
 * @param poiList the poi list
 */
-(TOS_POICollection*) init;

-(TOS_POICollection*) initWithCategories: (NSMutableArray *) poiList;

/**
 * get the poiList.
 *
 * @return the poiList
 */
- (NSMutableArray *) getPoiList;

/**
 * Sets the poi list.
 *
 * @param poiList the poiList to set
 */
- (void) setPoiList:(NSMutableArray *) poiList;

@end
