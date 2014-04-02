//
//  TOSAccessOpExportLayerTrack.h
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

@interface TOSAccessOpExportLayerTrack : TOSAccessOp


// The Constant DATA_TRACK.
#define TOS_ACCESS_OP_TRACK_DATA_TRACK @"Track"
// The Constant TYPE_LAYER.
#define TOS_ACCESS_OP_TRACK_TYPE_LAYER @"layer"
// The Constant EXPORT_FORMAT_KML.
#define TOS_ACCESS_OP_TRACK_EXPORT_FORMAT_KML @"kml"
// The Constant EXPORT_FORMAT_JSON.
#define TOS_ACCESS_OP_TRACK_EXPORT_FORMAT_JSON @"json"

/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio)access_token de Acceso a recursos

/** The type. */
@property (nonatomic,retain) NSString * Type; // (obligatorio) este fragmento determina el tipo de recurso que se desea generar.
// Por ejemplo para generar un recurso de tipo capa KML, su valor es layer. Valores permitidos: layer.

/** The data. */
@property (nonatomic,retain) NSString * Data; // (obligatorio) este fragmento especifica los datos que se almacenarán en el recurso
// exportado. Por ejemplo, es posible almacenar un Track. Valores permitidos: Track.

// Parámetros de TracksGet

/** The export_format. */
@property (nonatomic,retain) NSString * ExportFormat; // (obligatorio) este fragmento establece el formato de la respuesta de esta operación
// (no el formato del recurso). Valores disponibles: json.

/** The track. */
@property (nonatomic,readwrite) int * Track; // Identificador del track solicitado

/** The total. */
@property (nonatomic,readwrite) int * Total; // (opcional) si se especifica un valor N, se obtendrán las últimas N posiciones del Track

/** The InitDate. */
@property (nonatomic,retain) NSDate * InitDate;
/** The EndDate. */
@property (nonatomic,retain) NSDate * EndDate;
// : (opcional) fechas en formato UTC que permiten filtrar posiciones
// registradas dentro del rango especificado, seg˙n el est·ndar ISO 8601. No
// se incluyen las posiciones registradas en la fecha indicada.

/**
 * Instantiates a new export layer track.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param type the type
 * @param data the data
 * @param export_format the export_format
 * @param track the track
 * @param total the total
 * @param initdate the initdate
 * @param endate the endate
 */
-(TOSAccessOpExportLayerTrack*) init;
-(TOSAccessOpExportLayerTrack*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                           andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                              andType: (NSString *) type andData: (NSString *) data andExportFormat: (NSString *) exportFormat
                                             andTrack: (int *) track andTotal: (int *) total
                                          andInitDate: (NSDate *) initDate andEndDate: (NSDate *) endDate;

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
