//
//  TOSAccessOpRulesAdd.m
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

#import "TOSAccessOpRulesAdd.h"

@implementation TOSAccessOpRulesAdd

@synthesize Oauth_token, Lat, Lng, Radius, Type, Track;


/**
 * Instantiates a new rules add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @param type the type
 * @param track the track
 */
-(TOSAccessOpRulesAdd*) init{
    self=[super init];
    return self;
}

-(TOSAccessOpRulesAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                   andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                       andLat: (float *) lat andLng: (float *) lng andRadius: (int *) radius
                                      andType: (NSString *) type andTrack: (int *) track{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Lat = lat;
        Lng = lng;
        Radius = radius;
        Type = type;
        Track = track;
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
    validate = validate && [self isValidFloat: Lat];
    validate = validate && [self isValidFloat:Lng];
    validate = validate && [self isValidorNull: Type];
    validate = validate && [self isValidorNullInt: Radius];
    validate = validate && [self isValidorNullInt: Track];
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
        params = [params stringByAppendingString: @"/rules/add."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&lat="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
        params = [params stringByAppendingString: @"&lng="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
        if(Radius!=nil){
            params = [params stringByAppendingString: @"&radius="];
            params = [params stringByAppendingString:[self intToURLEncoded: Radius]];
        }
        if(Track!=nil){
            params = [params stringByAppendingString: @"&track="];
            params = [params stringByAppendingString:[self intToURLEncoded: Track]];
        }
        if(Type!=nil){
            params = [params stringByAppendingString: @"&type="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Type]];
            
        }
    }
    return params;
}

@end
