//
//  TOSAccessResRules.m
//  SDKtopoos
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
#import "TOSAccessResRules.h"
#import "JSON.h"

@implementation TOSAccessResRules

@synthesize Rule, Error, Result;

/**
 * Instantiates a new rule result.
 */
- (TOSAccessResRules *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new rule result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResRules *) initWithError: (NSString*) error andResult: (NSString*) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new rule result.
 *
 * @param error the error
 * @param result the result
 * @param rule the rule
 */
- (TOSAccessResRules *) initWithError: (NSString*) error andResult: (NSString*) result andRule: (TOS_Rule*) rule{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Rule=rule;
    }
    return self;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    int identifier;
    NSString * type;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        Rule = [[TOS_Rule alloc] init];
        
        identifier = [[attributes valueForKeyPath:@"id"] integerValue];
        [Rule setIdentifier: identifier];
        type= [attributes valueForKeyPath:@"type"];
        [Rule setType: type];
    }
}

/**
 * Gets the rule.
 * @return the rule
 */
- (TOS_Rule *) getRule
{
    return Rule;
}

/**
 * Sets the rule.
 * @param rule the rule to set
 */
- (void) setRule: (TOS_Rule *) rule
{
    Rule = rule;
}


@end
