//
//  TOSAccessOpResourcesGeocode.h
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

@interface TOSAccessOpResourcesGeocode : TOSAccessOp

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The lat. */
@property (nonatomic,readwrite) float * Lat; // (opcional) latitud en grados decimales,
// obligatorio si se especifica lng.
/** The lng. */
@property (nonatomic,readwrite) float * Lng; // (opcional) longitud en grados decimales,
// obligatorio si se especifica lat.
/** The Address. */
@property (nonatomic,retain) NSString * Address; // (opcional) direcciÛn normalizada de la
// cual se desea realizar la GeocodificaciÛn
// regular, obligatorio si no se especifica
// lat o lng.



-(TOSAccessOpResourcesGeocode*) init;



/**
 * Instantiates a new resources geocode.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param lat the lat
 * @param lng the lng
 */
-(TOSAccessOpResourcesGeocode*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                           andVersion: (int *) version andOauth_token: (NSString *) oauth_token andLatitude: (float *) lat
                                         andLongitude: (float *) lng ;



/**
 * Instantiates a new resources geocode.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param address the address
 */
-(TOSAccessOpResourcesGeocode*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                           andVersion: (int *) version andOauth_token: (NSString *) oauth_token andAddress:(NSString*) address ;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;

@end
