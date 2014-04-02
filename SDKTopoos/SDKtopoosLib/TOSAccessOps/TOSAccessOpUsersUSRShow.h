//
//  TOSAccessOpUsersUSRShow.h
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

@interface TOSAccessOpUsersUSRShow : TOSAccessOp


@property (nonatomic,retain) NSString * Oauth_token; 

@property (nonatomic,retain) NSString * USR;

- (TOSAccessOpUsersUSRShow *)init;

- (TOSAccessOpUsersUSRShow *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                    andOauth_token: (NSString*) oauth_token andUSR: (NSString *) user;

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
