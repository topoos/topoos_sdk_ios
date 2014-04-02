//
//  TOSAccessOpPOISWarningDelete.h
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

@interface TOSAccessOpPOISWarningDelete : TOSAccessOp

/** The Constant TYPE_CLOSED. */
#define TOS_ACCESS_OP_POISWARNING_DELETE_TYPE_CLOSED @"CLOSED"

/** The Constant TYPE_DUPLICATED. */
#define TOS_ACCESS_OP_POISWARNING_DELETE_TYPE_DUPLICATED @"DUPLICATED"

/** The Constant TYPE_WRONG_INDICATOR. */
#define TOS_ACCESS_OP_POISWARNING_DELETE_TYPE_WRONG_INDICATOR @"WRONG_INDICATOR"

/** The Constant TYPE_WRONG_INFO. */
#define TOS_ACCESS_OP_POISWARNING_DELETE_TYPE_WRONG_INFO @"WRONG_INFO"


/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token; // (obligatorio) access_token a los recursos del usuario

/** The poi. */
@property (nonatomic,retain) NSString * Poi; // (opcional) lista de identificadores de POI cuyos warnings deseamos recuperar, separados por comas

/** The type. */
@property (nonatomic,retain) NSString * Type; // (opcional) lista de tipos de warning que deseamos recuperar, los valores pueden ser:
// CLOSED: Marcados como cerrado o inexistente
// DUPLICATED: Marcados como duplicado
// WRONG_INDICATOR: La marca de posición es incorrecta o inexacta
// WRONG_INFO: La información del punto de interÈs es incorrecta o incompleta

/**
 * Instantiates a new pOIS warning delete.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param type the type
 */
-(TOSAccessOpPOISWarningDelete*) init;
-(TOSAccessOpPOISWarningDelete*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                          andPoi: (NSString *) poi andType: (NSString *) type;

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
