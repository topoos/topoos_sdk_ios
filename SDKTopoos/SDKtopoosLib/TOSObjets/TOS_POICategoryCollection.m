//
//  TOS_POICategoryCollection.m
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
#import "TOS_POICategoryCollection.h"

@implementation TOS_POICategoryCollection

@synthesize Categories;

/**
 * Instantiates a new pOI category collection.
 *
 * @param categories the categories
 */
-(TOS_POICategoryCollection*) init
{
    self=[super init];
    return self;
}

-(TOS_POICategoryCollection*) initWithCategories: (NSMutableArray *) categories
{
    self=[super init];
    if(self)
        Categories=categories;
    return self;
}

/**
 * get a list of the categories.
 *
 * @return the categories
 */
- (NSMutableArray *) getCategories
{
    return Categories;
}

/**
 * Sets the categories.
 *
 * @param categories the categories to set
 */
- (void) setCategories:(NSMutableArray *) categories
{
    Categories = categories;
}



@end
