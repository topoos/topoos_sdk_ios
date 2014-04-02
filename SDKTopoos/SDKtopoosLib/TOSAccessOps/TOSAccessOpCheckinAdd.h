//
//  TOSAccessOpCheckinAdd.h
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

@interface TOSAccessOpCheckinAdd : TOSAccessOp

/** The oauth_token. */
@property (nonatomic,retain) NSString *  Oauth_token; // (obligatorio) access_token a los recursos del usuario

/** The poi. */
@property (nonatomic,readwrite) int *	Poi; // (obligatorio) identificador del POI sobre el que se hace CheckIn

/** The device. */
@property (nonatomic,retain) NSString *	Device; // (opcional) identificador del dispositivo con el que se hace CheckIn. Se trata de un par·metro obligatorio si la aplicaciÛn puede manejar los dispositivos fÌsicos de un usuario, opciÛn que por defecto est· deshabilitada.

/** The timestamp. */
@property (nonatomic,retain) NSDate *	Timestamp; // (opcional) fecha de captura del CheckIn, hora local con offset de conversiÛn UTC de captura de la posiciÛn.

/**
 * Instantiates a new checkin add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param device the device
 * @param timestamp the timestamp
 */
-(TOSAccessOpCheckinAdd *) init;

-(TOSAccessOpCheckinAdd *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                          andPoi: (int *) poi andDevice: (NSString *) device
                                    andTimestamp:(NSDate *) timestamp ;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */

- (bool) ValidateParams;



/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;




@end
