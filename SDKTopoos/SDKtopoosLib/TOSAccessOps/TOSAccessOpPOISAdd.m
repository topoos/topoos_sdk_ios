//
//  TOSAccessOpPOISAdd.m
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

#import "TOSAccessOpPOISAdd.h"

@implementation TOSAccessOpPOISAdd

@synthesize Oauth_token,Lat,Lng, Accuracy, Vaccuracy, Elevation, Geocode, Categories, Name, Desc, Address, Cross_street, City, Country, Postal_code, Phone, Twitter;

- (TOSAccessOpPOISAdd *)init{
    self=[super init];
    return self;
}

-(TOSAccessOpPOISAdd *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                               andOauth_token: (NSString*) oauth_token andLat: (float*) lat andLng: (float*) lng andGeocode:(bool*) geocode andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
                        andCategories: (NSString*) categories andName: (NSString *) name andDesc: (NSString *) desc andAddress: (NSString *) address andCross_street: (NSString *) cross_street
                                     andCity: (NSString *) city andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone andTwitter: (NSString *) twitter{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token=oauth_token;
        Lat=lat;
        Lng=lng;
        Geocode=geocode;
        Accuracy=accuracy;
        Vaccuracy=vaccuracy;
        Elevation=elevation;
        Categories=categories;
        Name=name;
        Desc=desc;
        Address=address;
        Cross_street=cross_street;
        City=city;
        Country=country;
        Postal_code=postal_code;
        Phone=phone;
        Twitter=twitter;
    }
    return self;
}



/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValidFloat:Lat];
    validate = validate && [self isValidorNullFloat:Lng];
    validate = validate && [self isValidBool:Geocode];
    validate = validate && [self isValidorNullFloat:Accuracy];
    validate = validate && [self isValidorNullFloat:Vaccuracy];
    validate = validate && [self isValidorNullFloat:Elevation];
    validate = validate && [self isValidorNull:Categories];
    validate = validate && [self isValid:Name];
    validate = validate && [self isValidorNull:Desc];
    validate = validate && [self isValidorNull:Address];
    validate = validate && [self isValidorNull:Cross_street];
    validate = validate && [self isValidorNull:City];
    validate = validate && [self isValidorNull:Country];
    validate = validate && [self isValidorNull:Postal_code];
    validate = validate && [self isValidorNull:Phone];
    validate = validate && [self isValidorNull:Twitter];
    return validate;
}


/*
 * (non-Javadoc)
 *
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
        params = [params stringByAppendingString: @"/pois/add."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&lat="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
        params = [params stringByAppendingString: @"&lng="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
        if(Geocode!=nil){
            params = [params stringByAppendingString: @"&geocode="];
            if(Geocode){
                params = [params stringByAppendingString:@"true"];
            }else{
                params = [params stringByAppendingString:@"false"];
            }
        }
        if(Accuracy!=nil){
            params = [params stringByAppendingString: @"&accuracy="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Accuracy]];
        }
        if(Vaccuracy!=nil){
            params = [params stringByAppendingString: @"&vaccuracy="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Vaccuracy]];
        }
        if(Elevation!=nil){
            params = [params stringByAppendingString: @"&elevation="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Elevation]];
        }
        if(Categories!=nil){
            params = [params stringByAppendingString: @"&categories="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Categories]];
        }
        if(Name!=nil){
            params = [params stringByAppendingString: @"&name="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Name]];
        }
        if(Desc!=nil){
            params = [params stringByAppendingString: @"&desc="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Desc]];
        }
        if(Address!=nil){
            params = [params stringByAppendingString: @"&address="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Address]];
        }
        if(Cross_street!=nil){
            params = [params stringByAppendingString: @"&cross_street="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Cross_street]];
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
        if(Phone!=nil){
            params = [params stringByAppendingString: @"&phone="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Phone]];
        }
        if(Twitter!=nil){
            params = [params stringByAppendingString: @"&twitter="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Twitter]];
        }
    }
    return params;
}





@end
