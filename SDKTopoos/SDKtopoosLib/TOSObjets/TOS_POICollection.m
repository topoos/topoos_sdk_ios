//
//  TOS_POICollection.m
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

#import "TOS_POICollection.h"

@implementation TOS_POICollection


/** The poi list. */
@synthesize PoiList;

/**
 * Instantiates a new pOI collection.
 *
 * @param poiList the poi list
 */
-(TOS_POICollection*) init
{
    self=[super init];
    return self;
}

-(TOS_POICollection*) initWithCategories: (NSMutableArray *) poiList
{
    self=[super init];
    if(self)
        PoiList=poiList;
        return self;
}

/**
 * get the poiList.
 *
 * @return the poiList
 */
- (NSMutableArray *) getPoiList
{
    return PoiList;
}

/**
 * Sets the poi list.
 *
 * @param poiList the poiList to set
 */
- (void) setPoiList:(NSMutableArray *) poiList{
    PoiList = poiList;
}


@end
