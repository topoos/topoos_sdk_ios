//
//  TOSAccessOpPOISGet_where.h
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

@interface TOSAccessOpPOISGet_where : TOSAccessOp

/** The oauth_token. */
@property (nonatomic,retain) NSString *  Oauth_token; // (obligatorio) access_token a los recursos del usuario

/** The pois. */
@property (nonatomic,retain) NSString *  Pois; // (opcional) lista de identificadores de POI que deseamos recuperar, separados por comas

/** The categories. */
@property (nonatomic,retain) NSString *  Categories; // (obligatorio) identificadores de las categorÌas de filtrado, los POI obtenidos pertenecer·n a todas las especificadas, separadas por comas

/** The city. */
@property (nonatomic,retain) NSString *  City; // (opcional) obtiene los POI en la ciudad especificada

/** The country. */
@property (nonatomic,retain) NSString *  Country; // (opcional) obtiene los POI en la provincia especificada

/** The postal_code. */
@property (nonatomic,retain) NSString *  Postal_code; //(opcional) obtiene los POI cuyo cÛdigo postal coincida con el especificado

/** The q. */
@property (nonatomic,retain) NSString *  Q; // (opcional) obtiene los POI cuyo nombre o descripciÛn coincida con el patrÛn
/** The total. */
@property (nonatomic,readwrite) int *  Total; // (opcional) obtiene un n˙mero determinado de pois

/**
 * Instantiates a new pOIS get_where.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param pois the pois
 * @param categories the categories
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param q the q
 * @param total the total pois
 */
- (TOSAccessOpPOISGet_where *)init;

- (TOSAccessOpPOISGet_where *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                      andOauth_token: (NSString*) oauth_token andPois: (NSString*) pois  andCategories: (NSString*) categories andCity: (NSString*) city andCountry: (NSString*) country
                                       andPostalCode: (NSString*) postal_code andQ:(NSString*) q
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
