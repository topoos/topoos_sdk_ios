//
//  TOSAccessOpCheckinGet_Where.m
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

#import "TOSAccessOpCheckinGet_Where.h"

@implementation TOSAccessOpCheckinGet_Where

@synthesize Format,Method,OperationName,Version, Oauth_token,Poi,EndDate,InitDate;
/**
 * Instantiates a new checkin get.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param checkin the checkin
 */
-(TOSAccessOpCheckinGet_Where *) init{
    self=[super init];
    return self;
}

-(TOSAccessOpCheckinGet_Where *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                            andVersion: (int *) version andOauth_token: (NSString *) oauth_token
andPoi: (int *) poi andInitdate:(NSDate *) initDate andEnddate:(NSDate*) endDate {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Poi=poi;
        EndDate=endDate;
        InitDate=initDate;
    }
    return self;
}

/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */

- (bool) ValidateParams
{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValidInt:Poi];
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
        params = [params stringByAppendingString: @"/checkin/get_where."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&poi="];
        params = [params stringByAppendingString:[self stringToURLEncoded: [NSString stringWithFormat:@"%d", *Poi]]];
        if(InitDate!=nil){
            params = [params stringByAppendingString: @"&initdate="];
            params = [params stringByAppendingString:[self dateToURLEncoded:InitDate]];
        }
        if(EndDate!=nil){
            params = [params stringByAppendingString: @"&enddate="];
            params = [params stringByAppendingString:[self dateToURLEncoded:EndDate]];
        }
        
    }
    return params;
}

@end
