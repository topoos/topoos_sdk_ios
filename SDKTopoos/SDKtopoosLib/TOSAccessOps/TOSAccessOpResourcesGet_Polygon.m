//
//  TOSAccessOpResourcesGet_Polygon.m
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
#import "TOSAccessOpResourcesGet_Polygon.h"

@implementation TOSAccessOpResourcesGet_Polygon

@synthesize Lng,Lat,Oauth_token,Format,Method,OperationName,Version,Radius,Resolution,Shape;


/**
 * Instantiates a new resources get_polygon.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param shape the shape
 * @param resolution the resolution
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 */
- (TOSAccessOpResourcesGet_Polygon*)init{
    self=[super init];
    return self;
}

-(TOSAccessOpResourcesGet_Polygon*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                               andVersion: (int *) version andOauth_token: (NSString *) oauth_token andShape: (NSString *) shape andResolution:(int *) resolution
                                           andLat: (float *) lat andLng: (float *) lng andRadius: (float *) radius {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Shape = shape;
        Lat = lat;
        Lng = lng;
        Radius = radius;
        Resolution = resolution;
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
    validate = validate && [self isValidFloat:Lat];
    validate = validate && [self isValidFloat:Lng];
    validate = validate && [self isValidInt:Resolution];
    validate = validate && [self isValidFloat:Radius];
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
        params = [params stringByAppendingString: @"/resources/get_polygon."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&lat="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
        params = [params stringByAppendingString: @"&lng="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
        params = [params stringByAppendingString: @"&resolution="];
        params = [params stringByAppendingString:[self intToURLEncoded: Resolution]];
        params = [params stringByAppendingString: @"&radius="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Radius]];     
        params = [params stringByAppendingString: @"&shape="];
        params = [params stringByAppendingString:[self stringToURLEncoded: Shape]];
    }
    return params;
}

@end
