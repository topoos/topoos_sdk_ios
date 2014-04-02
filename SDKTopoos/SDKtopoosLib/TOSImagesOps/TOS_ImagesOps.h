//
//  TOS_ImagesOps.h
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
#import "TOS_Image.h"
#import "TOS_AccessTokenOAuth.h"

@interface TOS_ImagesOps : NSObject

/** The Constant SIZE_XXXSMALL. */
extern int const SIZE_XXXSMALL_ ;
/** The Constant SIZE_XXSMALL. */
extern int  const SIZE_XXSMALL_ ;
/** The Constant SIZE_XSMALL. */
extern int const SIZE_XSMALL_ ;
/** The Constant SIZE_SMALL. */
extern int const SIZE_SMALL_ ;
/** The Constant SIZE_LARGE. */
extern int const SIZE_LARGE_ ;
/** The Constant SIZE_XLARGE. */
extern int const SIZE_XLARGE_ ;
/** The Constant SIZE_XXLARGE. */
extern int const SIZE_XXLARGE_ ;
/** The Constant SIZE_XXXLARGE. */
extern int const SIZE_XXXLARGE_ ;

/**
 * Image upload.
 *
 * @param file the file
 * @param filename the filename
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Image *) ImageUpload: (TOS_AccessTokenOAuth* ) accessTokenPregenerated andFile:(NSData *) file andFilename:(NSString*) filename ;



/**
 * Image upload position.
 *
 * @param file the file
 * @param filename the filename
 * @param pos_id the pos_id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Image *) ImageUploadPosition: (TOS_AccessTokenOAuth* ) accessTokenPregenerated  andFile:(NSData *) file andFilename:(NSString*) filename andPosition_id: (int *) position_id ;

/**
 * Image upload poi.
 *
 * @param file the file
 * @param filename the filename
 * @param poi_id the poi_id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */

+(TOS_Image *) ImageUploadPOI: (TOS_AccessTokenOAuth* ) accessTokenPregenerated  andFile:(NSData *) file andFilename:(NSString*) filename andPoi_id: (int *) poi_id ;

/**
 * Image upload new poi.
 *
 * @param file the file
 * @param filename the filename
 * @param lat the lat
 * @param lng the lng
 * @param name the name
 * @param description the description
 * @param elevation the elevation
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param address the address
 * @param cross_street the cross_street
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param phone the phone
 * @param twitter the twitter
 * @param categories the categories
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Image *) ImageUploadNew_POI: (TOS_AccessTokenOAuth* ) accessTokenPregenerated  andFile:(NSData *) file andFilename:(NSString*) filename
                           andLat: (float*) lat andLng: (float*) lng andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
                    andCategories: (NSMutableArray *) categories andName: (NSString *) name andDesc: (NSString *) desc andAddress: (NSString *) address andCross_street: (NSString *) cross_street
                          andCity: (NSString *) city andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone andTwitter: (NSString *) twitter ;


/**
 * Gets the image uri.
 *
 * @param filename_unique the filename_unique
 * @return the string
 */


+(NSString *) GetImageURI:(NSString *) filename_unique ;

/**
 * Gets the image uri thumb.
 *
 * @param filename_unique the filename_unique
 * @param size the size
 * @return the string
 */
+ (NSString *)  GetImageURIThumb: (NSString *) filename_unique  andSize:(int) size ;

@end
