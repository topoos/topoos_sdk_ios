//
//  TOSAccessOpPOISGet_near.h
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

@interface TOSAccessOpPOISGet_near : TOSAccessOp

/** The oauth_token. */
@property (nonatomic,retain) NSString *  Oauth_token; // (obligatorio) access_token a los recursos del usuario

/** The lat. */
@property (nonatomic,readwrite) float *  Lat; // (obligatorio) latitud del punto central de b˙squeda

/** The lng. */
@property (nonatomic,readwrite) float *  Lng; // (obligatorio) longitud del punto central de b˙squeda

/** The radius. */
@property (nonatomic,readwrite) int *  Radius; // (obligatorio) radio de b˙squeda en metros

/** The categories. */
@property (nonatomic,retain) NSString *  Categories; // (obligatorio) identificadores de las categorÌas de filtrado, los POI obtenidos pertenecer·n a todas las especificadas, separadas por comas

/** The total. */
@property (nonatomic,readwrite) int * Total; // (opcional) obtiene un n˙mero determinado de pois

/**
 * Instantiates a new pOIS get_near.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @param categories the categories
 */
- (TOSAccessOpPOISGet_near *)init;

- (TOSAccessOpPOISGet_near *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                     andOauth_token: (NSString*) oauth_token andLat: (float*) lat andLng: (float*) lng andRadius: (int*) radius
                                      andCategories: (NSString*) categories
                                           andTotal: (int *) total ;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;


@end
