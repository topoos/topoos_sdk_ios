//
//  TOSAccessResTrackGet.m
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

#import "TOSAccessOpTrackGet.h"

@implementation TOSAccessOpTrackGet

@synthesize Track,Format,Oauth_token,Endate,Initdate,Layers,Total,Method,OperationName,Version;


/**
 * Instantiates a new tracks get.
 *
 * @param operationName
 *            the operation name
 * @param method
 *            the method
 * @param format
 *            the format
 * @param version
 *            the version
 * @param oauth_token
 *            the oauth_token
 * @param track
 *            the track
 * @param total
 *            the total
 * @param initdate
 *            the initdate
 * @param endate
 *            the endate
 * @param layer
 *            the layer
 */
-(TOSAccessOpTrackGet *) init{
    self=[super init];
    return self;
}

-(TOSAccessOpTrackGet *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                    andVersion: (int *) version andOauth_token: (NSString *) oauth_token
andTrack: (int *) track andTotal: (int *) total andInitdate: (NSDate *) initdate andEnddate:(NSDate *) endddate andLayers:(NSMutableArray *) layers {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Track=track;
        Total=total;
        Initdate=initdate;
        Endate=endddate;
        Layers=layers;
    }
    return self;
}


/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Operations.APIOperation#ValidateParams()
 */
- (bool) ValidateParams
{
    bool validate = [super ValidateParams];
    validate = validate && [self isValid: Oauth_token];
    validate = validate && [self isValidorNullInt:Track];
    validate = validate && [self isValidorNullInt:Total];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // (AAAA-MM-DDThh:mm:sszzzzzz)
    validate = validate && [self isValidorNull:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: Initdate]]];
    validate = validate && [self isValidorNull:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: Endate]]];
    return validate;
}


/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Operations.APIOperation#ConcatParams()
 */
- (NSString *) ConcatParams
{
    NSString * params;
    if ([self ValidateParams])
    {
        params = @"/";
        params = [params stringByAppendingString:[NSString stringWithFormat:@"%d", *[self getVersion]]];
        params = [params stringByAppendingString: @"/tracks/get."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        params = [params stringByAppendingString: @"&track="];
        params = [params stringByAppendingString: [self intToURLEncoded: Track]];
        if(Total!=nil){
            params = [params stringByAppendingString: @"&total="];
            params = [params stringByAppendingString:[self intToURLEncoded: Total]];
        }
        if(Initdate!=nil){
            params = [params stringByAppendingString: @"&initdate="];
            params = [params stringByAppendingString:[self dateToURLEncoded: Initdate]];
        }
        if(Endate!=nil){
            params = [params stringByAppendingString: @"&endate="];
            params = [params stringByAppendingString:[self dateToURLEncoded: Endate]];
        }
        if(Layers!=nil){
            params = [params stringByAppendingString: @"&layer="];
            NSString * str_layers = @"";
            for(int i=0;i<[Layers count];i++){
                if(i<[Layers count]-1){
                    str_layers = [str_layers stringByAppendingString: [Layers objectAtIndex:i]];
                    str_layers = [str_layers stringByAppendingString:@","];
                }
                else{
                    str_layers = [str_layers stringByAppendingString: [Layers objectAtIndex:[Layers count]-1]];
                }
            }
            
            
        }
    }
    return params;
}






@end
