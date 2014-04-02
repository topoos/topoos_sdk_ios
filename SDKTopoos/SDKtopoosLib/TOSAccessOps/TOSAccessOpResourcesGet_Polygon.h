//
//  TOSAccessOpResourcesGet_Polygon.h
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

@interface TOSAccessOpResourcesGet_Polygon : TOSAccessOp

/** The Constant SHAPE_CIRCLE. */
#define SHAPE_CIRCLE = @"circle";

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The shape. */
@property (nonatomic,retain) NSString * Shape; // (obligatorio) forma del polÌgono (valor
// admitido "circle")
/** The resolution. */
@property (nonatomic,readwrite) int * Resolution; // (obligatorio) vÈrtices para un cÌrculo

/** The lat. */
@property (nonatomic,readwrite) float * Lat; // (obligatorio) latitud del centro del circulo

/** The lng. */
@property (nonatomic,readwrite) float * Lng; // (obligatorio)longitud del centro del cÌrculo

/** The radius. */
@property (nonatomic,readwrite) float * Radius; // (obligatorio)radio en metros

/**
 * Instantiates a new resources get_polygon.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param shape the shape
 * @param resolution the resolution
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 */
- (TOSAccessOpResourcesGet_Polygon*)init;

-(TOSAccessOpResourcesGet_Polygon*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                               andVersion: (int *) version andOauth_token: (NSString *) oauth_token andShape: (NSString *) shape andResolution:(int *) resolution
                                                   andLat: (float *) lat andLng: (float *) lng andRadius: (float *) radius ;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;
/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;

@end
