//
//  TOS_POICategoriesOps.m
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

#import "TOS_POICategoriesOps.h"
#import "TOSAccessCaller.h"
#import "TOS_POICategory.h"
#import "TOSAccessOpPOISCategories.h"
#import "TOSAccessOpPOISCategoriesAdd.h"
#import "TOSAccessOpPOISCategoriesUpdate.h"
#import "TOSAccessOpPOISCategoriesDelete.h"
#import "TOSAccessResPOICategoryCollection.h"
#import "TOSAccessResPOICategory.h"
#import "TOSAccessResGeneric.h"


@implementation TOS_POICategoriesOps

/**
 * Gets the all.
 *
 * @param accessTokenPregenerated the access token pregenerated
 * @return the list
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (NSMutableArray *) GetAll: (TOS_AccessTokenOAuth *) accessTokenPregenerated
{
    NSMutableArray * getAll = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil)
    {
        // OPERATIONS
        int ver=1;
        bool system=true;
        TOSAccessOpPOISCategories * poisCategories =
        [[TOSAccessOpPOISCategories alloc] initWithOperationName: @"POISCategories_GetAll" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                  andOauth_token: accessTokenPregenerated.getAccessToken
                                      andIncludeSystemCategories: &system];
        
        // RESULTS
        TOSAccessResPOICategoryCollection * poisResult = [[TOSAccessResPOICategoryCollection alloc] init];
        [TOSAccessCaller ExecuteOperation: poisCategories withResult: poisResult];
        getAll = poisResult.getPoiCategoryCollection.getCategories;
    }
    else
    {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return getAll;
}

/**
 * Adds the.
 *
 * @param description the description
 * @param accessTokenPregenerated the access token pregenerated
 * @return the pOI category
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_POICategory *) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated andDescription: (NSString *) description
{
    TOS_POICategory * pOICategory = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpPOISCategoriesAdd * poisCategoriesAdd =
        [[TOSAccessOpPOISCategoriesAdd alloc] initWithOperationName: @"POISCategories_Add" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                andOauth_token: accessTokenPregenerated.getAccessToken andDesc: description];
        
        
        // RESULTS
        TOSAccessResPOICategory * poiCategoryResult = [[TOSAccessResPOICategory alloc] init];
        [TOSAccessCaller ExecuteOperation: poisCategoriesAdd withResult: poiCategoryResult];
        pOICategory = poiCategoryResult.getPoiCategory;
        
    }
    else {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return pOICategory;
}

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
    andCategoryID: (int *) categoryID andDescription: (NSString *) description
{
    TOS_POICategory * pOICategory = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpPOISCategoriesUpdate * pOISCategoriesUpdate =        
        [[TOSAccessOpPOISCategoriesUpdate alloc] initWithOperationName: @"POISCategories_Update" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                        andOauth_token: accessTokenPregenerated.getAccessToken
                                                        andDesc: description andCategory: categoryID];
        
        
        // RESULTS
        TOSAccessResPOICategory * poiCategoryResult = [[TOSAccessResPOICategory alloc] init];
        [TOSAccessCaller ExecuteOperation: pOISCategoriesUpdate withResult: poiCategoryResult];
        pOICategory = poiCategoryResult.getPoiCategory;
        
    }
    else {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    
    return (bool *) (pOICategory != nil);
}

/**
 * Delete.
 *
 * @param categoryID the category id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (bool ) Delete: (TOS_AccessTokenOAuth *) accessTokenPregenerated andCategoryID: (int *) categoryID
{
    bool  delete = false;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpPOISCategoriesDelete * pOISCategoriesDelete =
        [[TOSAccessOpPOISCategoriesDelete alloc] initWithOperationName: @"POISCategories_Delete" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                        andOauth_token: accessTokenPregenerated.getAccessToken andCategory: categoryID];
        
        
        // RESULTS
        TOSAccessResGeneric * genericResult = [[TOSAccessResGeneric alloc] init];
        [TOSAccessCaller ExecuteOperation: pOISCategoriesDelete withResult: genericResult];
        delete = ([genericResult getCode] == 200);
        
    }
    else {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return delete;
}

// .....................................................................................................................................
// NOTA ................................................................................................................................
// PARA ESTOS SIGUIENTES MÉTODOS HAY QUE RECOGER EL TOS_AccessTokenOAuth PORQUE NO VIENE POR PARÁMETRO Y SE ESTÁ PASANDO nil
/**
 * Gets the all.
 *
 * @return the list
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (NSMutableArray *) GetAll
{
    return [[self class] GetAll: nil];
}

/**
 * Adds the.
 *
 * @param name the name
 * @return the pOI category
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_POICategory *) Add: (NSString *) name
{
    return [[self class] Add: nil andDescription: name];
}

/**
 * Update.
 *
 * @param categoryID the category id
 * @param description the description
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (bool *) Update: (int *) categoryID andDescription: (NSString *) description
{
    return [[self class] Update: nil andCategoryID: categoryID andDescription: description];
}

/**
 * Delete.
 *
 * @param categoryID the category id
 * @return the boolean
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (bool ) Delete: (int *) categoryID
{
    return [[self class] Delete: nil andCategoryID: categoryID];
}

@end
