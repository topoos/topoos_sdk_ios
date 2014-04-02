//
//  TOSAccessOpPOISUpdate.h
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

@interface TOSAccessOpPOISUpdate : TOSAccessOp
/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The poi. */
@property (nonatomic,readwrite) int* Poi; //  (Required)  POI identifier we want Update. Integer.

/** The lat. */
@property (nonatomic,readwrite) float* Lat; // (obligatorio) latitud de la nueva posiciÛn.
// Decimal.
/** The lng. */
@property (nonatomic,readwrite) float* Lng; // (obligatorio) longitud de la nueva posiciÛn.
/** The accuracy. */
@property (nonatomic,readwrite) float* Accuracy; // (opcional)
// Decimal.
/** The accuracy. */
@property (nonatomic,readwrite) bool* Geocode; // (opcional) precisiÛn de la posiciÛn
// (latitud, longitud). Decimal.
/** The vaccuracy. */
@property (nonatomic,readwrite) float* Vaccuracy; // (opcional) precisiÛn de la elevaciÛn.
// Decimal.
/** The elevation. */
@property (nonatomic,readwrite) float* Elevation; // (opcional) elevaciÛn respecto al nivel
// del mar. Decimal.
/** The categories. */
@property (nonatomic,retain) NSString * Categories; // (obligatorio) identificadores de las
// categorÌas a las que pertenece este
// POI, separados por comas
/** The name. */
@property (nonatomic,retain) NSString * Name; // (obligatorio) nombre del punto de interÈs.
// Cadena de texto. M·ximo 255 caracteres.
/** The desc. */
@property (nonatomic,retain) NSString * Desc; // (opcional) descripciÛn del punto de interÈs.
// Cadena de texto. M·ximo 500 caracteres.
/** The address. */
@property (nonatomic,retain) NSString * Address; // (opcional) direcciÛn del punto del
// interÈs. Cadena de texto. M·ximo 50
// caracteres.
/** The cross_street. */
@property (nonatomic,retain) NSString * Cross_street; // (opcional) calle transversal. Cadena
// de texto. M·ximo 50 caracteres.
/** The city. */
@property (nonatomic,retain) NSString * City; // (opcional) ciudad del punto de interÈs.
// Cadena de texto. M·ximo 50 caracteres.
/** The country. */
@property (nonatomic,retain) NSString * Country; // (opcional) estado. Cadena de texto. M·ximo
// 30 caracteres.
/** The postal_code. */
@property (nonatomic,retain) NSString * Postal_code; // (opcional) cÛdigo postal. Cadena de
// texto. M·ximo 12 caracteres.
/** The phone. */
@property (nonatomic,retain) NSString * Phone; // (opcional) telÈfono de contacto. Cadena de
// texto. M·ximo 20 caracteres.
/** The twitter. */
@property (nonatomic,retain) NSString * Twitter; // (opcional) identificador de usuario o



/**
 * Instantiates a new pOIS update.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param name the name
 * @param desc the desc
 * @param lat the lat
 * @param lng the lng
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param elevation the elevation
 * @param categories the categories
 * @param address the address
 * @param cross_street the cross_street
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param phone the phone
 * @param twitter the twitter
 */
- (TOSAccessOpPOISUpdate *)init;

-(TOSAccessOpPOISUpdate *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                  andOauth_token: (NSString*) oauth_token andPoi: (int*) poi andLat: (float*) lat andLng: (float*) lng
                                     andGeocode:(bool*) geocode andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
                                   andCategories: (NSString*) categories andName: (NSString *) name andDesc: (NSString *) desc andAddress: (NSString *) address andCross_street: (NSString *) cross_street
                                         andCity: (NSString *) city andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone andTwitter: (NSString *) twitter;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;


@end
