//
//  TOSAccessOpWebmap.m
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

#import "TOSAccessOpWebmap.h"

@implementation TOSAccessOpWebmap

@synthesize Api_key, Identifier, Type;

/**
 * Instantiates a new resource webmap.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param api_key the api_key
 * @param type the type
 * @param identifier the identifier
 */
-(TOSAccessOpWebmap*) init
{
    self=[super init];
    return self;
}

-(TOSAccessOpWebmap*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method
                                  andFormat:(NSString *) format andVersion: (int *) version
                                  andApiKey: (NSString *) api_key andType: (NSString *) type andId: (NSString *) identifier
{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Api_key = api_key;
        Identifier = identifier;
        Type = type;
    }
    return self;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams
{
    bool validate = true;
    validate = validate && [self isValid:Api_key];
    validate = validate && [self isValid:Identifier];
    validate = validate && [self isValid:Type];
    return validate;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams
{
    NSString * params;
    if ([self ValidateParams])
    {
        params = @"/";
        params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *[self getVersion]]];
        params = [params stringByAppendingString: @"/webmap"];
        params = [params stringByAppendingString: @"?"];
        params = [params stringByAppendingString: [self stringToURLEncoded: Type]];
        params = [params stringByAppendingString: @"="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Identifier]];
        params = [params stringByAppendingString: @"&api_key="];
        params = [params stringByAppendingString:[self stringToURLEncoded: Api_key]];
    }
    return params;
}

@end
