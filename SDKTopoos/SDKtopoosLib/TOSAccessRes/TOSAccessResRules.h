//
//  TOSAccessResRules.h
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
#import "TOS_Rule.h"

@interface TOSAccessResRules : TOSAccessRes

/** The rule. */
@property (nonatomic,retain) TOS_Rule * Rule;

/**
 * Instantiates a new rule result.
 */
- (TOSAccessResRules *) init;

/**
 * Instantiates a new rule result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResRules *) initWithError: (NSString*) error andResult: (NSString*) result;

/**
 * Instantiates a new rule result.
 *
 * @param error the error
 * @param result the result
 * @param rule the rule
 */
- (TOSAccessResRules *) initWithError: (NSString*) error andResult: (NSString*) result andRule: (TOS_Rule*) rule;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the rule.
 * @return the rule
 */
- (TOS_Rule *) getRule;

/**
 * Sets the rule.
 * @param rule the rule to set
 */
- (void) setRule: (TOS_Rule *) rule;

@end
