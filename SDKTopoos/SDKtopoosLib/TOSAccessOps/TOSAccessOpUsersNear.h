//
//  TOSAccessOpUsersNear.h
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

@interface TOSAccessOpUsersNear : TOSAccessOp


/** The oauth_token. */
@property (nonatomic,retain) NSString * Oauth_token;// (obligatorio) access_token a los recursos del usuario

/** The lat. */
@property (nonatomic,readwrite) float* Lat;// (opcional) latitud del punto central de b˙squeda. Es un par·metro obligatorio si no se especifica poi.

/** The lng. */
@property (nonatomic,readwrite) float* Lng;// (opcional) longitud del punto central de b˙squeda. Es un par·metro obligatorio si no se especifica poi.

/** The poi. */
@property (nonatomic,readwrite) int* Poi;// (opcional) identificador del punto de interÈs alrededor del cual se realiza la b˙squeda. Es un par·metro obligatorio si no se especifican lat y lng.

/** The radius. */
@property (nonatomic,readwrite) int* Radius;// (obligatorio) radio de b˙squeda en metros > 0

/** The active. */
@property (nonatomic,readwrite) bool* Active;// (opcional) true|false la b˙squeda se realiza ˙nicamente entre aquellos usuarios que tengan Track activos en este momento. Valores permitidos ìtrueî. Por defecto ìtrueî

/** The ugroup. */
@property (nonatomic,readwrite) int* Ugroup;// (opcional) identificador de grupo de usuario. Si se especifica, los resultados solo incluir·n usuarios que pertenezcan a dicho grupo.

/** The Count. */
@property (nonatomic,readwrite) int* Count;// (opcional) n˙mero de usuarios devueltos. Los devueltos siempre ser·n los m·s cercanos al punto. Valor por defecto 1.

- (TOSAccessOpUsersNear *)init;

-(TOSAccessOpUsersNear *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                 andOauth_token: (NSString*) oauth_token  andLatitude: (float *) lat andLongitude: (float *) lng andPOI:(int*) poi andRadius:(int *)
radius andIsActive: (bool *) active andUgroup:(int *) ugroup andCount: (int*)  count;

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
