//
//  TOSAccessOpResourcesGeocode.m
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

#import "TOSAccessOpResourcesGeocode.h"

@implementation TOSAccessOpResourcesGeocode

@synthesize Version,OperationName,Method,Format,Address,Lat,Lng,Oauth_token;



-(TOSAccessOpResourcesGeocode*) init
{
    self=[super init];
    return self;
}
/**
 * Instantiates a new resources geocode.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param lat the lat
 * @param lng the lng
 */
-(TOSAccessOpResourcesGeocode*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                           andVersion: (int *) version andOauth_token: (NSString *) oauth_token andLatitude: (float *) lat
                                         andLongitude: (float *) lng {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Lat = lat;
        Lng = lng;
        Address=nil;
    }
    return self;
}



/**
 * Instantiates a new resources geocode.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param address the address
 */
-(TOSAccessOpResourcesGeocode*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
andVersion: (int *) version andOauth_token: (NSString *) oauth_token andAddress:(NSString*) address {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Lat = nil;
        Lng = nil;
        Address=address;
    }
    return self;
}


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams
{
    bool validate = [super ValidateParams];
    validate = validate && (([self isValid: [ self doubleToURLEncoded:Lat]] && [self isValid: [ self doubleToURLEncoded:Lng]])||([self isValid: Address]));
    validate = validate && [self isValid: Oauth_token];
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
        params = [params stringByAppendingString: @"/resources/geocode."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        if(Address!=nil){
            params = [params stringByAppendingString: @"&Address="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Address]];
        }else{
            params = [params stringByAppendingString: @"&lat="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
            params = [params stringByAppendingString: @"&lng="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
        }
    }
    return params;
}




@end
