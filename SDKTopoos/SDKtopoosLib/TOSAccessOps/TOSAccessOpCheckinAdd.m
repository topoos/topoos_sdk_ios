//
//  TOSAccessOpCheckinAdd.m
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

#import "TOSAccessOpCheckinAdd.h"

@implementation TOSAccessOpCheckinAdd

@synthesize Format,Method,OperationName,Version,Device,Oauth_token,Poi,Timestamp;


/**
 * Instantiates a new checkin add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param device the device
 * @param timestamp the timestamp
 */
-(TOSAccessOpCheckinAdd *) init{
    self=[super init];
    return self;
}

-(TOSAccessOpCheckinAdd *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                        andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                         andPoi: (int *) poi andDevice: (NSString *) device
                                         andTimestamp:(NSDate *) timestamp {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Device=device;
        Poi=poi;
        Timestamp=timestamp;
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
    validate = validate && [self isValidorNull:Device];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // (AAAA-MM-DDThh:mm:sszzzzzz)
    validate = validate && [self isValidorNull:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: Timestamp]]];
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
        params = [params stringByAppendingString: @"/checkin/add."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&poi="];
        params = [params stringByAppendingString:[self intToURLEncoded: Poi]];
        
        if(Device!=nil){
            params = [params stringByAppendingString: @"&device="];
            params = [params stringByAppendingString:Device];
        }
        if(Timestamp!=nil){
            params = [params stringByAppendingString: @"&timestamp="];
            params = [params stringByAppendingString:[self dateToURLEncoded:Timestamp]];
        }
    }
    return params;
}






@end
