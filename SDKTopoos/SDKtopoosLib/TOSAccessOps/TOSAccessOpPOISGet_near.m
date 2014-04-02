//
//  TOSAccessOpPOISGet_near.m
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

#import "TOSAccessOpPOISGet_near.h"

@implementation TOSAccessOpPOISGet_near

@synthesize Format,Categories,Lat,Lng,Method,Oauth_token,OperationName,Radius,Total,Version;

/**
 * Instantiates a new pOIS get_near.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @param categories the categories
 */
- (TOSAccessOpPOISGet_near *)init{
    self=[super init];
    return self;
}

- (TOSAccessOpPOISGet_near *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                               andOauth_token: (NSString*) oauth_token andLat: (float*) lat andLng: (float*) lng andRadius: (int*) radius
                                andCategories: (NSString*) categories 
                                      andTotal: (int *) total {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token=oauth_token;
        Lat=lat;
        Lng=lng;
        Radius=radius;
        Total=total;
        Categories=categories;

    }
    return self;
}


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValidFloat:Lat];
    validate = validate && [self isValidFloat:Lng];
    validate = validate && [self isValidInt:Radius];
    validate = validate && [self isValidorNullInt:Total];
    validate = validate && [self isValid:Categories];
    return validate;
}


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams{
    NSString * params;
    if ([self ValidateParams]) {
        
        /*string1 = @"This is ";
         string2 = @"my string.";
         
         result = [result stringByAppendingString:string1];
         result = [result stringByAppendingString:string2];
         */
        params = @"/";
        params = [params stringByAppendingString:[NSString stringWithFormat:@"%d",
                                                  *[self getVersion]]];
        params = [params stringByAppendingString: @"/pois/get_near."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&categories="];
        params = [params stringByAppendingString:[self stringToURLEncoded: Categories]];
        params = [params stringByAppendingString: @"&lat="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
        params = [params stringByAppendingString: @"&lng="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
        params = [params stringByAppendingString: @"&radius="];
        params = [params stringByAppendingString:[self intToURLEncoded: Radius]];
        if(Total!=nil){
            params = [params stringByAppendingString: @"&total="];
            params = [params stringByAppendingString:[self intToURLEncoded: Total]];
        }

    }
    return params;
}





@end
