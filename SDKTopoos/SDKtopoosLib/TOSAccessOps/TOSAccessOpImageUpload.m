//
//  TOSAccessOpImageUpload.m
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

#import "TOSAccessOpImageUpload.h"


@implementation TOSAccessOpImageUpload

@synthesize Format,Filename,Accuracy,Address,Categories,City,Country,Cross_street,Description,Elevation,File,Lat,Lng,Method,Name,Oauth_token,OperationName,Phone,Poi_id,Pos_id,Postal_code,Twitter,Vaccuracy,Version;

/**
 * Instantiates a new image upload.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param file the file
 * @param filename the filename
 * @param id the id
 * @param type_id the type_id
 */
- (TOSAccessOpImageUpload*)init{
    self=[super init];
    return self;
}

-(TOSAccessOpImageUpload*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                               andVersion: (int *) version andOauth_token: (NSString *) oauth_token andFile: (NSData *) file andFilename:(NSString *) filename
andIdentifier: (int *) identifier andType:(int) type{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        File =file;
        Filename = filename;
        if(type==TYPE_POI){
            Poi_id=identifier;
        }else if (type==TYPE_POS){
            Pos_id=identifier;
        }else{
            Pos_id=Poi_id=nil;
        }
    }
    return self;
}

/**
 * Instantiates a new image upload.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param file the file
 * @param filename the filename
 */
-(TOSAccessOpImageUpload*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token andFile: (NSData *) file andFilename:(NSString *) filename
                                   {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        File =file;
        Filename = filename;
    }
    return self;
}
/**
 * Instantiates a new image upload.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param file the file
 * @param filename the filename
 * @param lat the lat
 * @param lng the lng
 * @param name the name
 * @param description the description
 * @param elevation the elevation
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param address the address
 * @param cross_street the cross_street
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param phone the phone
 * @param twitter the twitter
 * @param categories the categories
 */
-(TOSAccessOpImageUpload*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                      andVersion: (int *) version andOauth_token: (NSString *) oauth_token andFile: (NSData *) file andFilename:(NSString *) filename
                                          andLat: (float*) lat andLng: (float*) lng andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
                                   andCategories: (NSString*) categories andName: (NSString *) name andDesc: (NSString *) description andAddress: (NSString *) address andCross_street: (NSString *) cross_street
                                         andCity: (NSString *) city andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone andTwitter: (NSString *) twitter {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Lat = lat;
        Lng = lng;
        
        File = file;
        Filename = filename;

        Name = name;
        Description = description;
        Elevation = elevation;
        Accuracy = accuracy;
        Vaccuracy = vaccuracy;
        Address = address;
        Cross_street = cross_street;
        City = city;
        Country = country;
        Postal_code = postal_code;
        Phone = phone;
        Twitter = twitter;
        Categories = categories;
    }
    return self;
}





/**
 * validate the params.
 *
 * @return Boolean
 */
- (bool) ValidateParams{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValid: Filename];
    validate = validate && [self isValidorNullInt:Poi_id];
    validate = validate && [self isValidorNullInt:Pos_id];
    validate = validate && File!=nil;
    validate = validate && [self isValidorNullFloat: Lat];
    validate = validate && [self isValidorNullFloat: Lng];
    validate = validate && [self isValidorNullFloat:Accuracy];
    validate = validate && [self isValidorNullFloat:Vaccuracy];
    validate = validate && [self isValidorNullFloat:Elevation];
    validate = validate && [self isValidorNull:Categories];
    validate = validate && [self isValidorNull:Name];
    validate = validate && [self isValidorNull:Description];
    validate = validate && [self isValidorNull:Address];
    validate = validate && [self isValidorNull:Cross_street];
    validate = validate && [self isValidorNull:City];
    validate = validate && [self isValidorNull:Country];
    validate = validate && [self isValidorNull:Postal_code];
    validate = validate && [self isValidorNull:Phone];
    validate = validate && [self isValidorNull:Twitter];
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
        params = [params stringByAppendingString: @"/image/upload"];
    }
    return params;
}


@end
