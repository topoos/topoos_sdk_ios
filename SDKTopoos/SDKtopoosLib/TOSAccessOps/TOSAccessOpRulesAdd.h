//
//  TOSAccessOpRulesAdd.h
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

@interface TOSAccessOpRulesAdd : TOSAccessOp

// The Constant TYPE_TRACK_OUT_OF_BOUNDS.
#define TOS_ACCESS_OP_RULES_TYPE_TRACK_OUT_OF_BOUNDS @"TRACK_OUT_OF_BOUNDS"

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio)access_token de Acceso a recursos

/** The lat. */
@property (nonatomic,readwrite) float * Lat; // (obligatorio) latitud del centro del círculo del área permitida, en grados decimales

/** The lng. */
@property (nonatomic,readwrite) float * Lng; // (obligatorio) longitud del centro del círculo del área permitida, en grados decimales

/** The radius. */
@property (nonatomic,readwrite) int * Radius; // (obligatorio) radio del círculo del área permitida, en grados decimales.

/** The type. */
@property (nonatomic,retain) NSString * Type; // TRACK_OUT_OF_BOUNDS

/** The track. */
@property (nonatomic,readwrite) int * Track; // Identificador del track que vamos a añadir


/**
 * Instantiates a new rules add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @param type the type
 * @param track the track
 */
-(TOSAccessOpRulesAdd*) init;
-(TOSAccessOpRulesAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                   andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                       andLat: (float *) lat andLng: (float *) lng andRadius: (int *) radius
                                      andType: (NSString *) type andTrack: (int *) track;


/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;


@end
