//
//  TOSAccessOpPositionsGet_Between.h
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

@interface TOSAccessOpPositionsGet_Between : TOSAccessOp

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los recursos del usuario

/** The initdate. */
@property (nonatomic,retain) NSDate * Initdate; // (obligatorio) fecha de inicio, según el estándar ISO 8601

/** The enddate. */
@property (nonatomic,retain) NSDate * Enddate; // (obligatorio) fecha de fin, según el estándar ISO 8601

/** The device. */
@property (nonatomic,retain) NSString * Device; // (opcional) obtiene solo las posiciones del dispositivo indicado. Si no se especifica, se obtienen las posiciones del dispositivo por defecto. Es un parámetro obligatorio cuando la aplicación puede acceder a los dispositivos físicos de un usuario, opción que por defecto está deshabilitada.

/**
 * Instantiates a new positions get_between.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param initdate the initdate
 * @param enddate the enddate
 * @param device the device
 */

-(TOSAccessOpPositionsGet_Between*) init;
-(TOSAccessOpPositionsGet_Between*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                       andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                              andInitdate: (NSDate *) initdate andEnddate: (NSDate *) enddate
                                                andDevice: (NSString *) device;


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
