//
//  TOSAccessOpTrackAdd.h
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

@interface TOSAccessOpTrackAdd : TOSAccessOp

@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The device. */
@property (nonatomic,retain) NSString * Device; // (opcional) dispositivo que crea el Track.
// Es un par·metro obligatorio cuando la
// aplicaciÛn puede utilizar los
// dispositivos fÌsicos de un usuario,
// opciÛn que por defecto est·
// deshabilitada.
/** The name. */
@property (nonatomic,retain) NSString * Name; // (opcional) descripciÛn del Track, m·x. 100
// caracteres.



/**
 * Instantiates a new tracks add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param device the device
 * @param name the name
 */
-(TOSAccessOpTrackAdd *) init;

-(TOSAccessOpTrackAdd *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                    andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                     andDevice: (NSString *) device andDeviceName: (NSString *) name ;

/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;

/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;




@end
