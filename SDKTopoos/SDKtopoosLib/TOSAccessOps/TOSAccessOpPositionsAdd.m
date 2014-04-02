//
//  TOSAccessOpPositionsAdd.m
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

#import "TOSAccessOpPositionsAdd.h"

@implementation TOSAccessOpPositionsAdd

@synthesize Oauth_token, Device, Lat, Lng, Accuracy, Vaccuracy, Elevation, Timestamp, Velocity, Postype, Bearing, Track;

- (TOSAccessOpPositionsAdd*)init{
    self=[super init];
    return self;
}

-(TOSAccessOpPositionsAdd*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                       andVersion: (int *) version andOauth_token: (NSString *) oauth_token andDevice: (NSString *) device
                                           andLat: (float *) lat andLng: (float *) lng andAccuracy: (float *) accuracy andVaccuracy: (float *) vaccuracy
                                     andElevation: (float *) elevation andTimestamp: (NSDate *) timestamp andVelocity: (float *) velocity
                                       andPostype: (int *) postype andBearing: (float *) bearing andTrack: (int *) track{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Device = device;
        Lat = lat;
        Lng = lng;
        Accuracy = accuracy;
        Vaccuracy = vaccuracy;
        Elevation = elevation;
        Timestamp = timestamp;
        Velocity = velocity;
        Postype = postype;
        Bearing = bearing;
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
    validate = validate && [self isValid: [NSString stringWithFormat:@"%f", *Lat]];
    validate = validate && [self isValid: [NSString stringWithFormat:@"%f", *Lng]];
    validate = validate && [self isValidorNull:Device];
    validate = validate && [self isValidorNullFloat:Accuracy];
    validate = validate && [self isValidorNullFloat:Vaccuracy];
    validate = validate && [self isValidorNullFloat:Elevation];
    validate = validate && [self isValidorNullFloat:Velocity];
    validate = validate && [self isValidorNullInt:Postype];
    validate = validate && [self isValidorNullFloat:Bearing];
    validate = validate && [self isValidorNullInt:Track];
   
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // (AAAA-MM-DDThh:mm:sszzzzzz)
    validate = validate && [self isValidorNull:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: Timestamp]]];
    
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
        params = [params stringByAppendingString: @"/positions/add."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&lat="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lat]];
        params = [params stringByAppendingString: @"&lng="];
        params = [params stringByAppendingString:[self doubleToURLEncoded: Lng]];
        if(Device!=nil){
            params = [params stringByAppendingString: @"&device="];
            params = [params stringByAppendingString:[self stringToURLEncoded: Device]];
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
        if(Timestamp!= nil){
            params = [params stringByAppendingString: @"&timestamp="];
            params = [params stringByAppendingString:[self dateToURLEncoded: Timestamp]];
        }
        if(Velocity!=nil){
            params = [params stringByAppendingString: @"&velocity="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Velocity]];
        }
        if(Postype!=nil){
            params = [params stringByAppendingString: @"&postype="];
            params = [params stringByAppendingString:[self intToURLEncoded: Postype]];
        }
        if(Bearing!=nil){
            params = [params stringByAppendingString: @"&bearing="];
            params = [params stringByAppendingString:[self doubleToURLEncoded: Bearing]];
        }
        if(Track!=nil){
            params = [params stringByAppendingString: @"&track="];
            params = [params stringByAppendingString:[self intToURLEncoded: Track]];
        }
    }
    return params;
}


@end
