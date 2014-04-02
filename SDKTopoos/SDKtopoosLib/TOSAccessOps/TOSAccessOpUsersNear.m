//
//  TOSAccessOpUsersNear.m
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

#import "TOSAccessOpUsersNear.h"

@implementation TOSAccessOpUsersNear


@synthesize Active,Count,Format,Lat,Lng,Method,Oauth_token,OperationName,Poi,Radius,Ugroup,Version;


- (TOSAccessOpUsersNear *)init{
    self=[super init];
    return self;
}


-(TOSAccessOpUsersNear *) initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version
                                 andOauth_token: (NSString*) oauth_token  andLatitude: (float *) lat andLongitude: (float *) lng andPOI:(int*) poi andRadius:(int *)
radius andIsActive: (bool *) active andUgroup:(int *) ugroup andCount: (int*)  count{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self){
        Oauth_token=oauth_token;
        Lat=lat;
        Lng=lng;
        Radius=radius;
        Active=active;
        Count=count;
        Poi=poi;
        Ugroup=ugroup;
        
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
    if(Poi==nil && Lat!=nil && Lng!=nil){
        validate = validate && [self isValidorNullFloat: Lat];
        validate = validate && [self isValidorNullFloat: Lng];
    }
    else if (Poi!=nil){
        validate = validate && [self isValidorNullInt:Poi];
    }else{
        validate = false;
    }
    validate = validate && [self isValidorNullInt:Ugroup];
    validate = validate && [self isValidorNullInt:Radius];
    validate = validate && [self isValidorNullBool:Active];
    validate = validate && [self isValidorNullInt:Count];
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
        if(Poi==nil){
            params = @"/";
            params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *[self getVersion]]];
            params = [params stringByAppendingString: @"/users/get_near."];
            params = [params stringByAppendingString: [self getFormat]];
            params = [params stringByAppendingString: @"?oauth_token="];
            params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
            params = [params stringByAppendingString: @"&lat="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
            params = [params stringByAppendingString: @"&lng="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
            if(Ugroup!=nil){
                params = [params stringByAppendingString: @"&ugroup="];
                params = [params stringByAppendingString:[self intToURLEncoded: Ugroup]];
            }
            if(Radius!=nil){
                params = [params stringByAppendingString: @"&radius="];
                params = [params stringByAppendingString:[self intToURLEncoded: Radius]];
            }
            if(Active!=nil){
                params = [params stringByAppendingString: @"&active="];
                params = [params stringByAppendingString:[self boolToURLEncoded: Active]];
            }
            if(Count!=nil){
                params = [params stringByAppendingString: @"&Count="];
                params = [params stringByAppendingString:[self intToURLEncoded: Count]];
            }
        }
        else{
            params = @"/";
            params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *[self getVersion]]];
            params = [params stringByAppendingString: @"/users/get_near."];
            params = [params stringByAppendingString: [self getFormat]];
            params = [params stringByAppendingString: @"?oauth_token="];
            params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
            params = [params stringByAppendingString: @"&poi="];
            params = [params stringByAppendingString:[self intToURLEncoded: Poi]];
            if(Ugroup!=nil){
                params = [params stringByAppendingString: @"&ugroup="];
                params = [params stringByAppendingString:[self intToURLEncoded: Ugroup]];
            }
            if(Radius!=nil){
                params = [params stringByAppendingString: @"&radius="];
                params = [params stringByAppendingString:[self intToURLEncoded: Radius]];
            }
            if(Active!=nil){
                params = [params stringByAppendingString: @"&active="];
                params = [params stringByAppendingString:[self boolToURLEncoded: Active]];
            }
            if(Count!=nil){
                params = [params stringByAppendingString: @"&Count="];
                params = [params stringByAppendingString:[self intToURLEncoded: Count]];
            }
        }
        
    }
    return params;
}


@end
