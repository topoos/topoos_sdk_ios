//
//  TOSAccessOpImageUpload.h
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

#import "TOSAccessOp.h"

@interface TOSAccessOpImageUpload : TOSAccessOp
/** The Constant TYPE_POI. */
#define TYPE_POI  0

/** The Constant TYPE_POS. */
#define TYPE_POS 1

/** The Constant TYPE_NONE. */
#define TYPE_NONE  -1

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The file. */
@property (nonatomic,retain) NSData * File; // (obligatorio) Imagen serializada y codificada
// en Base64.
/** The filename. */
@property (nonatomic,retain) NSString * Filename;

/** The pos_id. */
@property (nonatomic,readwrite) int*  Pos_id;

/** The poi_id. */
@property (nonatomic,readwrite) int* Poi_id;

/** The lat. */
@property (nonatomic,readwrite) float* Lat; // latitud de la posiciÛn en grados decimales.

/** The lng. */
@property (nonatomic,readwrite) float* Lng; // longitud de la posiciÛn en grados decimales.

/** The name. */
@property (nonatomic,retain) NSString * Name; // (obligatorio): nombre del punto de interÈs.

/** The description. */
@property (nonatomic,retain) NSString * Description; // (opcional): descripciÛn del punto de
// interÈs.
/** The elevation. */
@property (nonatomic,readwrite) float* Elevation; // (opcional): elevaciÛn de la posiciÛn
// respecto al nivel del mar, en metros.
/** The accuracy. */
@property (nonatomic,readwrite) float* Accuracy; // (opcional): precisiÛn de la latitud y
// lontigud en metros.
/** The vaccuracy. */
@property (nonatomic,readwrite) float* Vaccuracy; // (opcional): precisiÛn de la elevaciÛn
// en metros.
/** The address. */
@property (nonatomic,retain) NSString * Address; // (opcional): direcciÛn del punto de interÈs

/** The cross_street. */
@property (nonatomic,retain) NSString * Cross_street; // (opcional): transversal a la
// direcciÛn del punto de interÈs.
/** The city. */
@property (nonatomic,retain) NSString * City; // (opcional): ciudad del punto de interÈs

/** The country. */
@property (nonatomic,retain) NSString * Country; // (opcional): estado al que pertenece la
// ciudad
/** The postal_code. */
@property (nonatomic,retain) NSString * Postal_code; // (opcional): cÛdigo postal

/** The phone. */
@property (nonatomic,retain) NSString * Phone; // (opcional): n˙mero de telÈfono

/** The twitter. */
@property (nonatomic,retain) NSString * Twitter; // (opcional): identificador de usuario en
// twitter o hashtag
/** The categories. */
@property (nonatomic,retain) NSString * Categories; // (obligatorio): identificadores de
// categorÌas a las que pertenece el
// punto de interÈs, separadas por comas

/**
 * Instantiates a new image upload.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param file the file
 * @param filename the filename
 * @param id the id
 * @param type_id the type_id
 */
- (TOSAccessOpImageUpload*)init;


- (TOSAccessOpImageUpload*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token andFile: (NSData *) file andFilename:(NSString *) filename
                                   andIdentifier: (int *) identifier andType:(int) type;

/**
 * Instantiates a new image upload.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param file the file
 * @param filename the filename
 */
-(TOSAccessOpImageUpload*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token andFile: (NSData *) file andFilename:(NSString *) filename;
/**
 * Instantiates a new image upload.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
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
 */
-(TOSAccessOpImageUpload*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token andFile: (NSData *) file andFilename:(NSString *) filename
                                          andLat: (float*) lat andLng: (float*) lng andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
                                   andCategories: (NSString*) categories andName: (NSString *) name andDesc: (NSString *) description andAddress: (NSString *) address andCross_street: (NSString *) cross_street
                                         andCity: (NSString *) city andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone andTwitter: (NSString *) twitter;





/**
 * validate the params.
 *
 * @return Boolean
 */
- (bool) ValidateParams;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;


@end
