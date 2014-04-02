//
//  TOSAccessOpPositionsAdd.h
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

@interface TOSAccessOpPositionsAdd : TOSAccessOp

// The Constant TRACK_END.
#define TOS_ACCESS_OP_POSITIONS_ADD_TRACK_END 2

// The Constant POS.
#define TOS_ACCESS_OP_POSITIONS_ADD_POS 3

// The Constant ALARM_INIT.
#define TOS_ACCESS_OP_POSITIONS_ADD_ALARM_INIT 6

// The Constant ALARM_END.
#define TOS_ACCESS_OP_POSITIONS_ADD_ALARM_END 7

// The Constant GPS_OK.
#define TOS_ACCESS_OP_POSITIONS_ADD_GPS_OK 8

// The Constant GPS_NO.
#define TOS_ACCESS_OP_POSITIONS_ADD_GPS_NO 9


/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio)access_token de Acceso a recursos

/** The device. */
@property (nonatomic,retain) NSString * Device; // (opcional) dispositivo que capturó la posición. Se trata de un parámetro obligatorio cuando la aplicación puede manejar los dispositivos físicos de un usuario, opción que por defecto está deshabilitada.

/** The lat. */
@property (nonatomic,readwrite) float * Lat; // (obligatorio) latitud en grados decimales de la nueva posición

/** The lng. */
@property (nonatomic,readwrite) float * Lng; // (obligatorio) longitud en grados decimales de la nueva posición

/** The accuracy. */
@property (nonatomic,readwrite) float * Accuracy; // (opcional) precisión de la posición (latitud, longitud)

/** The vaccuracy. */
@property (nonatomic,readwrite) float * Vaccuracy; // (opcional) precisión de la elevación

/** The elevation. */
@property (nonatomic,readwrite) float * Elevation; // (opcional) elevación respecto al nivel del mar

/** The timestamp. */
@property (nonatomic,retain) NSDate * Timestamp; // (opcional) hora local con offset de conversión UTC de captura de la posición, según el estándar ISO 8601.
//(AAAA-MM-DDThh:mm:sszzzzzz) en UTC
//ejemplo: 1997-07-16T10:30:15.342+03:00

/** The velocity. */
@property (nonatomic,readwrite) float * Velocity; // (opcional) velocidad de movimiento en el instante en que se capturó la posición, en metros por segundo

/** The postype. */
@property (nonatomic,readwrite) int * Postype; //(opcional) tipo de posición a registrar

/** The bearing. */
@property (nonatomic,readwrite) float * Bearing; // (opcional) rumbo de movimiento (valor entre 0 y 360)

/** The track. */
@property (nonatomic,readwrite) int * Track; // (opcional) identificador del Track al que pertenece la posición (excepto cuando es TRACK_INIT)

/**
 * Instantiates a new positions add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param device the device
 * @param lat the lat
 * @param lng the lng
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param elevation the elevation
 * @param timestamp the timestamp
 * @param velocity the velocity
 * @param postype the postype
 * @param bearing the bearing
 * @param track the track
 */
-(TOSAccessOpPositionsAdd*) init;
-(TOSAccessOpPositionsAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                       andVersion: (int *) version andOauth_token: (NSString *) oauth_token andDevice: (NSString *) device
                                           andLat: (float *) lat andLng: (float *) lng andAccuracy: (float *) accuracy andVaccuracy: (float *) vaccuracy
                                     andElevation: (float *) elevation andTimestamp: (NSDate *) timestamp andVelocity: (float *) velocity
                                       andPostype: (int *) postype andBearing: (float *) bearing andTrack: (int *) track;

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
