//
//  TOSAccessOpWebmap.h
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

@interface TOSAccessOpWebmap : TOSAccessOp

/** The Constant TYPE_LAYER. */
#define TOS_ACCESS_OP_WEBMAP_TYPE_LAYER @"layer"

/** The api_key. */
@property (nonatomic,retain) NSString * Api_key; // (obligatorio)

/** The type. */
@property (nonatomic,retain) NSString * Type; // (obligatorio) el nombre del par·metro type
// determina el tipo de recurso que se desea
// obtener. Por ejemplo para obtener un recurso
// previamente exportado de tipo capa KML, su
// valor es layer. Valores permitidos: layer.

/** The id. */
@property (nonatomic,retain) NSString * Identifier; // (obligatorio) el valor del par·metro type
// indica el identificador del recurso que se
// desea visualizar, este se obtuvo como
// respuesta de la operaciÛn de exportaciÛn de
// recurso.

/**
 * Instantiates a new resource webmap.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param api_key the api_key
 * @param type the type
 * @param identifier the identifier
 */
-(TOSAccessOpWebmap*) init;
-(TOSAccessOpWebmap*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method
                                  andFormat:(NSString *) format andVersion: (int *) version
                                  andApiKey: (NSString *) api_key andType: (NSString *) type andId: (NSString *) identifier;

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
