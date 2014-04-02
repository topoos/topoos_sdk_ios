//
//  TOSAccessOpPOISWarningAdd.m
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
#import "TOSAccessOpPOISWarningAdd.h"

@implementation TOSAccessOpPOISWarningAdd


@synthesize Oauth_token, Poi, Type, Lat, Lng, Accuracy, Vaccuracy, Elevation, Categories, Name, Desc, Address, Cross_street, City, Country, Postal_code, Phone, Twitter;

/**
 * Instantiates a new pOIS warning add.
 */
-(TOSAccessOpPOISWarningAdd*) init;
{
    self=[super init];
    return self;
}

/**
 * Instantiates a new pOIS warning add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param type the type
 */
-(TOSAccessOpPOISWarningAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                         andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                             andPoi: (int *) poi andType: (NSString *) type
{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token = oauth_token;
        Poi = poi;
        Type = type;
    }
    return self;
}

/**
 * Instantiates a new pOIS warning add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param type the type
 * @param lat the lat
 * @param lng the lng
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param elevation the elevation
 */
-(TOSAccessOpPOISWarningAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                         andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                             andPoi: (int *) poi andType: (NSString *) type
                                             andLat: (float*) lat andLng: (float*) lng
                                        andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token=oauth_token;
        Poi = poi;
        Type = type;
        Lat=lat;
        Lng=lng;
        Accuracy=accuracy;
        Vaccuracy=vaccuracy;
        Elevation=elevation;
    }
    return self;
    
}

/**
 * Instantiates a new pOIS warning add.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param poi the poi
 * @param type the type
 * @param categories the categories
 * @param name the name
 * @param desc the desc
 * @param address the address
 * @param cross_street the cross_street
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param phone the phone
 * @param twitter the twitter
 */
-(TOSAccessOpPOISWarningAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                         andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                             andPoi: (int *) poi andType: (NSString *) type
                                      andCategories: (NSString*) categories andName: (NSString *) name andDesc: (NSString *) desc
                                         andAddress: (NSString *) address andCross_street: (NSString *) cross_street andCity: (NSString *) city
                                         andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone
                                         andTwitter: (NSString *) twitter
{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token=oauth_token;
        Poi = poi;
        Type = type;
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
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams
{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValid: [self intToURLEncoded: Poi]];
    validate = validate && [self isValid: Type];
    
    if ([Type isEqual: TOS_ACCESS_OP_POISWARNING_ADD_TYPE_WRONG_INDICATOR])
    {
        validate = validate && [self isValidFloat:Lat];
        validate = validate && [self isValidFloat: Lng];
        validate = validate && [self isValidorNullFloat:Accuracy];
        validate = validate && [self isValidorNullFloat:Vaccuracy];
        validate = validate && [self isValidorNullFloat:Elevation];
    }
    else if ([Type isEqual: TOS_ACCESS_OP_POISWARNING_ADD_TYPE_WRONG_INFO])
    {
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
    }
    return validate;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams
{
    NSString * params;
    if ([self ValidateParams]) {
        params = @"/";
        params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *[self getVersion]]];
        params = [params stringByAppendingString: @"/pois/warnings/add."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&poi="];
        params = [params stringByAppendingString:[self intToURLEncoded: Poi]];
        params = [params stringByAppendingString: @"&type="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Type]];
        
        if ([Type isEqual: (NSString *) TOS_ACCESS_OP_POISWARNING_ADD_TYPE_WRONG_INDICATOR])
        {
            params = [params stringByAppendingString: @"&lat="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
            params = [params stringByAppendingString: @"&lng="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
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
        }
        else if ([Type isEqual: TOS_ACCESS_OP_POISWARNING_ADD_TYPE_WRONG_INFO])
        {
            params = [params stringByAppendingString: @"&categories="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Categories]];
            params = [params stringByAppendingString: @"&name="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Name]];
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
    }
    return params;
}

@end
