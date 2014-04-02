//
//  TOSAccessOp.h
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

@interface TOSAccessOp : NSObject

/**
 * Instantiates a new aPI operation.
 *
 * @param operationName name of the operation
 * @param method name of the method
 * @param format format
 * @param version version
 */
@property (nonatomic,readwrite) int* Version;
@property (nonatomic,retain) NSString *Method;
@property (nonatomic,retain) NSString *Format;
@property (nonatomic,retain) NSString *OperationName;


- (TOSAccessOp *)init;

- (TOSAccessOp *)initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version;

/**
 * get the operation name.
 *
 * @return Operation name
 */
-(NSString *) getOperationName;


/**
 * set the operation name.
 *
 * @param operationName set the operation name
 */
- (void) setOperationName:(NSString*) name;

/**
 * get the method.
 *
 * @return Method
 */
- (NSString*) getMethod;

/**
 * set the method.
 *
 * @param method set method
 */
- (void) setMethod:(NSString*) method;

/**
 * get the format.
 *
 * @return Format
 */
- (NSString *) getFormat;

/**
 * set the format.
 *
 * @param format set the format
 */
- (void) setFormat:(NSString *) format;

/**
 * get the version.
 *
 * @return Version
 */
- (int * ) getVersion;

/**
 * set the version.
 *
 * @param version set the version
 */
- (void) setVersion:(int * ) version;

/**
 * check if the version is not null or not empty.
 *
 * @param param the param
 * @return bool
 */
- (bool) isValid:(NSString *) param;

- (bool) isValidInt:(int *) param;
- (bool) isValidFloat:(float *) param;
- (bool) isValidBool:(bool *) param;

/**
 * check if is valid or null the param.
 *
 * @param param the param
 * @return bool
 */
-(bool) isValidorNull:(NSString *) param;
-(bool) isValidorNullInt:(int *) param;
-(bool) isValidorNullFloat:(float *) param;
- (bool) isValidorNullBool:(bool *) param;
/**
 *Validate strings
 *@return string
 */
-(NSString *) stringToURLEncoded: (NSString*) param;

/**
 *Validate Double
 *@return string
 */
-(NSString *) doubleToURLEncoded: (float *) param;

/**
 *Validate int
 *@return string
 */
-(NSString *) intToURLEncoded: (int *) param;

/**
 *Validate bool
 *@return string
 */
-(NSString *) boolToURLEncoded: (bool*) param;

/**
 *Validate Date
 *@return string
 */
-(NSString *) dateToURLEncoded: (NSDate *) param;


/**
 * validate the params.
 *
 * @return bool
 */
- (bool) ValidateParams;
/**
 * return the object¥s parameters concatenate.
 *
 * @return the string
 * string
 */
- (NSString *) ConcatParams;

/**
 * Body params.
 *
 * @return the multipart entity
 * @throws IOException Signals that an I/O exception has occurred.
 */

@end
