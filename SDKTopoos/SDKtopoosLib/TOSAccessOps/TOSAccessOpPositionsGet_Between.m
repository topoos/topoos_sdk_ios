//
//  TOSAccessOpPositionsGet_Between.m
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

#import "TOSAccessOpPositionsGet_Between.h"

@implementation TOSAccessOpPositionsGet_Between

@synthesize Oauth_token, Initdate, Enddate, Device;

/**
 * Instantiates a new positions get_between.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param initdate the initdate
 * @param enddate the enddate
 * @param device the device
 */

-(TOSAccessOpPositionsGet_Between*) init{
    self=[super init];
    return self;
}

-(TOSAccessOpPositionsGet_Between*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                       andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                              andInitdate: (NSDate *) initdate andEnddate: (NSDate *) enddate
                                                andDevice: (NSString *) device{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token = oauth_token;
        Initdate = initdate;
        Enddate = enddate;
        Device = device;
    }
    return self;
}




/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams
{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // (AAAA-MM-DDThh:mm:sszzzzzz)
    validate = validate && [self isValid:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: Initdate]]];
    validate = validate && [self isValid:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: Enddate]]];
    
    validate = validate && [self isValidorNull:Device];
    
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
        params = [params stringByAppendingString: @"/positions/get_between."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&initdate="];
        params = [params stringByAppendingString:[self dateToURLEncoded: Initdate]];
        params = [params stringByAppendingString: @"&enddate="];
        params = [params stringByAppendingString:[self dateToURLEncoded: Enddate]];

        if(Device!=nil){
            params = [params stringByAppendingString: @"&device="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Device]];
        }
    }
    return params;
}

    
@end
