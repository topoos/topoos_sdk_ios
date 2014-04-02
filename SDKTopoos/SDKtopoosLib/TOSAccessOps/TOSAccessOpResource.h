//
//  TOSAccessOpResource.h
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

@interface TOSAccessOpResource : TOSAccessOp
/** The type of resource (layer). */
@property (nonatomic,retain) NSString *   Type;
/** The api_key . */
@property (nonatomic,retain) NSString *  Api_key;
/** The id of resource. */
@property (nonatomic,readwrite) int * Identifier;

/**
 *
 * @param operationName
 * @param method
 * @param format
 * @param version
 * @param type
 * @param api_key
 * @param id
 */
-(TOSAccessOpResource *) init;

-(TOSAccessOpResource *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                    andVersion: (int *) version andType: (NSString *) type andApi_Key: (NSString *) api_key
                                 andIdentifier: (int *) identifier;


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams;

/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams;


@end
