//
//  TOSAccessOpTrackAdd.m
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

#import "TOSAccessOpTrackAdd.h"

@implementation TOSAccessOpTrackAdd

/** The oauth_token. */

@synthesize Device,Name,Format,Method,Oauth_token,OperationName,Version;

/**
 * Instantiates a new tracks add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param device the device
 * @param name the name
 */
-(TOSAccessOpTrackAdd *) init{
    self=[super init];
    return self;
}

-(TOSAccessOpTrackAdd *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                   andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                       andDevice: (NSString *) device andDeviceName: (NSString *) name {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Device=device;
        Name=name;
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
    validate = validate && [self isValidorNull: Name];
    validate = validate && [self isValidorNull: Device];
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
        params = [params stringByAppendingString: @"/tracks/add."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        if(Name!=nil){
            params = [params stringByAppendingString: @"&Name="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Name]];
        }
        if(Device!=nil){
            params = [params stringByAppendingString: @"&Device="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Device]];
        }
    }
    return params;
}


@end
