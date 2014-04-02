//
//  TOSAccessRes.h
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

@interface TOSAccessRes : NSObject
/** The Format. */
@property (nonatomic,retain) NSString * Format;

/** The Error. */
@property (nonatomic,retain) NSString * Error;

/** The Result. */
@property (nonatomic,retain) id Result;



/**
 * Instantiates a new aPI call result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessRes *) init;
-(TOSAccessRes *) initWithFormat: (NSString*) format andError: (NSString*) error andResult:(id) result;


/**
 * Sets the parameters.
 *
 * @throws TopoosException the topoos exception
 */
- (void) setParameters;

/**
 * set the parameter.
 *
 * @return the format
 */
- (NSString *) getFormat;

/**
 * set the format that received as a parameter.
 *
 * @param format the format to set
 */
- (void) setFormat:(NSString*) format;

/**
 * get the error.
 *
 * @return the error
 */
- (NSString *) getError;

/**
 * Sets the error.
 *
 * @param error the error to set
 */
- (void) setError:(NSString *) error;

/**
 * get the result.
 *
 * @return the result
 */
- (id) getResult;

/**
 * Sets the result.
 *
 * @param result the result to set
 */
- (void) setResult: (id) result;
@end
