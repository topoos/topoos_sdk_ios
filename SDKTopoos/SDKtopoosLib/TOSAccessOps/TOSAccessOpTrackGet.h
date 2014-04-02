//
//  TOSAccessResTrackGet.h
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

@interface TOSAccessOpTrackGet : TOSAccessOp
/** The Constant LAYER_DEFAULT. */
#define LAYER_DEFAULT = @"default";

/** The Constant LAYER_BEARING. */
#define  LAYER_BEARING = @"bearing";

/** The Constant LAYER_TRACKLINE. */
#define  LAYER_TRACKLINE = @"trackline";

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los
// recursos del usuario
/** The track. */
@property (nonatomic,readwrite) int * Track; // (obligatorio) identificador del Track
// solicitado
/** The total. */
@property (nonatomic,readwrite) int * Total; // (opcional) si se especifica un valor N,
// se obtendr·n las ˙ltimas N posiciones del
// Track
/** The initdate. */
@property (nonatomic,retain) NSDate * Initdate;

/** The endate. */
@property (nonatomic,retain) NSDate * Endate;
// : (opcional) fechas en formato UTC que permiten filtrar posiciones
// registradas dentro del rango especificado, seg˙n el est·ndar ISO 8601. No
// se incluyen las posiciones registradas en la fecha indicada.
/** The layer. */
@property (nonatomic,retain) NSMutableArray * Layers; // :(opcional) capas KML solicitadas,
// separadas por comas

// default (valor por defecto) marcadores de posiciÛn
// bearing flechas de rumbo
// trackline lÌnea de trayectoria


/**
 * Instantiates a new tracks get.
 *
 * @param operationName
 *            the operation name
 * @param method
 *            the method
 * @param format
 *            the format
 * @param version
 *            the version
 * @param oauth_token
 *            the oauth_token
 * @param track
 *            the track
 * @param total
 *            the total
 * @param initdate
 *            the initdate
 * @param endate
 *            the endate
 * @param layer
 *            the layer
 */
-(TOSAccessOpTrackGet *) init;

-(TOSAccessOpTrackGet *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                     andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                       andTrack: (int *) track andTotal: (int *) total andInitdate: (NSDate *) initdate andEnddate:(NSDate *) endddate andLayers:(NSMutableArray *) layers ;


/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;


/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;


@end
