//
//  TOSAccessOpTrackGetLast.h
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

@interface TOSAccessOpTrackGetLast : TOSAccessOp
/** The Constant LAYER_DEFAULT. */
#define LAYER_DEFAULT = @"default";

/** The Constant LAYER_BEARING. */
#define LAYER_BEARING = @"bearing";

/** The Constant LAYER_TRACKLINE. */
#define LAYER_TRACKLINE = @"trackline";


/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The device. */
@property (nonatomic,retain) NSString * Device; // (opcional) dispositivo del que vamos a
// recuperar el ˙ltimo Track, es obligatorio
// si la aplicaciÛn puede utilizar los
// dispositivos fÌsicos de un usuario,
// opciÛn que por defecto est·
// deshabilitada.
/** The total. */
@property (nonatomic,readwrite) int * Total; // (opcional) si se especifica un valor N, se
// obtendr·n las ˙ltimas N posiciones del
// Track
/** The layer. */
@property (nonatomic,retain) NSMutableArray * Layers; // (opcional) capas KML solicitadas,
// separadas por comas.

// default (valor por defecto) marcadores de posiciÛn
// bearing flechas de rumbo
// trackline lÌnea de trayectoria


-(TOSAccessOpTrackGetLast *) init;

-(TOSAccessOpTrackGetLast *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                        andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                         andDevice: (NSString *) device andTotal: (int *) total
                                         andLayers:(NSMutableArray *) layers ;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;



@end
