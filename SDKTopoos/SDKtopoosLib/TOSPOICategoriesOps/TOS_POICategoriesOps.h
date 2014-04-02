//
//  TOS_POICategoriesOps.h
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

#import <Foundation/Foundation.h>
#import "TOS_POICategory.h"
#import "TOS_AccessTokenOAuth.h"

@interface TOS_POICategoriesOps : NSObject

/**
 * Gets the all.
 *
 * @param accessTokenPregenerated the access token pregenerated
 * @return the list
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (NSMutableArray *) GetAll: (TOS_AccessTokenOAuth *) accessTokenPregenerated;

/**
 * Adds the.
 *
 * @param description the description
 * @param accessTokenPregenerated the access token pregenerated
 * @return the pOI category
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_POICategory *) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated andDescription: (NSString *) description;

/**
 * Update.
 *
 * @param categoryID the category id
 * @param description the description
 * @param accessTokenPregenerated the access token pregenerated
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (bool *) Update: (TOS_AccessTokenOAuth *) accessTokenPregenerated
    andCategoryID: (int *) categoryID andDescription: (NSString *) description;
                    
/**
 * Delete.
 *
 * @param categoryID the category id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (bool ) Delete: (TOS_AccessTokenOAuth *) accessTokenPregenerated andCategoryID: (int *) categoryID;


// Los mismos métodos pero sin el AccessToken
/**
 * Gets the all.
 *
 * @return the list
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
//+ (NSMutableArray *) GetAll;

/**
 * Adds the.
 *
 * @param name the name
 * @return the pOI category
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
//+ (TOS_POICategory *) Add: (NSString *) name;

/**
 * Update.
 *
 * @param categoryID the category id
 * @param description the description
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
//+ (bool *) Update: (int *) categoryID andDescription: (NSString *) description;

/**
 * Delete.
 *
 * @param categoryID the category id
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
//+ (bool ) Delete: (int *) categoryID;

@end
