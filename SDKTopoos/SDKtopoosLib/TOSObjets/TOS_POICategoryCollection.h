//
//  TOS_POICategoryCollection.h
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

@interface TOS_POICategoryCollection : NSObject

//#define serialVersionUID 1 --> ya está definida

/** The categories. #POICategory */
@property (nonatomic,retain) NSMutableArray * Categories ;

/**
 * Instantiates a new pOI category collection.
 *
 * @param categories the categories
 */
-(TOS_POICategoryCollection*) init;

-(TOS_POICategoryCollection*) initWithCategories: (NSMutableArray *) categories;

/**
 * get a list of the categories.
 *
 * @return the categories
 */
- (NSMutableArray *) getCategories ;

/**
 * Sets the categories.
 *
 * @param categories the categories to set
 */
- (void) setCategories:(NSMutableArray *) categories;


@end
