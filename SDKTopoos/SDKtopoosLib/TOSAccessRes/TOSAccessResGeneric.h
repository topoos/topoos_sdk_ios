//
//  TOSAccessResGeneric.h
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

#import "TOSAccessRes.h"

@interface TOSAccessResGeneric : TOSAccessRes

/** The code. */
@property (nonatomic,readwrite) int Code;

/** The description. */
@property (nonatomic,retain) NSString * Description;

/**
 * Instantiates a new generic result.
 */
-(TOSAccessResGeneric *) init;

/**
 * Instantiates a new generic result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResGeneric *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new generic result.
 *
 * @param error the error
 * @param result the result
 * @param poiCategory the poi category
 */
-(TOSAccessResGeneric *) initWithError: (NSString*) error andResult: (id) result
                               andCode: (int ) cod andDescription: (NSString *) desc;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the code.
 * @return the code
 */
- (int ) getCode;

/**
 * Sets the code.
 * @param code the code to set
 */
- (void) setCode: (int ) code;

/**
 * Gets the Description.
 * @return the Description
 */
- (NSString *) getDescription;

/**
 * Sets the Description.
 * @param desc the Description to set
 */
- (void) setDescription: (NSString *) desc;

@end
