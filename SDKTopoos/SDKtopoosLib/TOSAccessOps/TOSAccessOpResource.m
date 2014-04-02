//
//  TOSAccessOpResource.m
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
#import "TOSAccessOpResource.h"

@implementation TOSAccessOpResource

@synthesize Api_key,Format,Identifier,Method,OperationName,Type,Version;


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
-(TOSAccessOpResource *) init
{
    self=[super init];
    return self;
}

-(TOSAccessOpResource *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                               andVersion: (int *) version andType: (NSString *) type andApi_Key: (NSString *) api_key
                                              andIdentifier: (int *) identifier{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Type=type;
        Api_key=api_key;
        Identifier=identifier;
    }
    return self;
}


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams
{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Type];
    validate = validate && [self isValid: Api_key];
    validate = validate && [self isValid: [self intToURLEncoded: Identifier]];
    return validate;
}


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams
{
    NSString * params;
    if ([self ValidateParams])
    {
        params = @"/";
        params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *[self getVersion]]];
        params = [params stringByAppendingString: @"/resource/"];
        params = [params stringByAppendingString:[self Type]];
        params = [params stringByAppendingString: @"/"];
        params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *Identifier]];
        params = [params stringByAppendingString: @"."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?api_key="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Api_key]];
    }
    return params;
}


@end
