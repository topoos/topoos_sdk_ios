//
//  TOSAccessCaller.h
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
#import <Foundation/Foundation.h>
#import "TOSAccessOp.h"
#import "TOSAccessRes.h"
#import "Constants.h"

@interface TOSAccessCaller : NSObject

//public static final int SERVICE_API = 0;
//public static final int SERVICE_LOGIN = 1;
//public static final int SERVICE_PIC = 2;

/**
 * Returns the url for the object operation.
 *
 * @param operation
 * @return URL
 */
+ (NSString *) GetUriAPIOperation: (TOSAccessOp *) operation;

/**
 * Returns the url for topoos api service
 *
 * @return URL
 */
+ (NSString *) GetURLAPItopoos;
/**
 * Returns the url for topoos pic service
 *
 * @return String
 */
+ (NSString *) GetURLPICAPItopoos;

/**
 * Initiates an operation on topoos API.
 *
 * @param operation
 *            Represents the operation to be executed
 * @param result
 *            Represents a result returned from a query to API topoos
 * @throws IOException
 * @throws TopoosException
 */
+ (void) ExecuteOperation: (TOSAccessOp*) operation withResult: (TOSAccessRes*) result;



@end
