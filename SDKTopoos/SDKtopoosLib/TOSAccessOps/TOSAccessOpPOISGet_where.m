//
//  TOSAccessOpPOISGet_where.m
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
#import "TOSAccessOpPOISGet_where.h"

@implementation TOSAccessOpPOISGet_where

@synthesize Total,Version,OperationName,Oauth_token,Method,Categories,Format,City,Country,Pois,Postal_code,Q;

/**
 * Instantiates a new pOIS get_where.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param pois the pois
 * @param categories the categories
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param q the q
 * @param total the total pois
 */
- (TOSAccessOpPOISGet_where *)init{
    self=[super init];
    return self;
}

- (TOSAccessOpPOISGet_where *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                     andOauth_token: (NSString*) oauth_token andPois: (NSString*) pois  andCategories: (NSString*) categories andCity: (NSString*) city andCountry: (NSString*) country
                                       andPostalCode: (NSString*) postal_code andQ:(NSString*) q 
                                           andTotal: (int *) total {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token=oauth_token;
        Total=total;
        Categories=categories;
        Country=country;
        Pois=pois;
        Postal_code=postal_code;
        Q=q;
        City=city;
    }
    return self;
}


/* (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValidorNullInt:Total];
    validate = validate && [self isValid:Categories];
    validate = validate && [self isValidorNull:Q];
    validate = validate && [self isValidorNull:Pois];
    validate = validate && [self isValidorNull:City];
    validate = validate && [self isValidorNull:Country];
    validate = validate && [self isValidorNull:Postal_code];
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
        params = [params stringByAppendingString: @"/pois/get_where."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&categories="];
        params = [params stringByAppendingString:[self stringToURLEncoded: Categories]];
        if(Q!=nil){
            params = [params stringByAppendingString: @"&q="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Q]];
        }
        if(Total!=nil){
            params = [params stringByAppendingString: @"&total="];
            params = [params stringByAppendingString:[self intToURLEncoded: Total]];
        }
        if(Pois!=nil){
            params = [params stringByAppendingString: @"&pois="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Pois]];
        }
        if(City!=nil){
            params = [params stringByAppendingString: @"&city="];
            params = [params stringByAppendingString:[self stringToURLEncoded: City]];
        }
        if(Country!=nil){
            params = [params stringByAppendingString: @"&country="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Country]];
        }
        if(Postal_code!=nil){
            params = [params stringByAppendingString: @"&postal_code="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Postal_code]];
        }
    }
    return params;
}



@end
