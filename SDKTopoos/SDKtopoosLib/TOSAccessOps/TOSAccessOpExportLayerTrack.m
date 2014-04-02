//
//  TOSAccessOpExportLayerTrack.m
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

#import "TOSAccessOpExportLayerTrack.h"

@implementation TOSAccessOpExportLayerTrack

@synthesize Oauth_token, Type, Data, ExportFormat, Track, Total, InitDate, EndDate;

/**
 * Instantiates a new export layer track.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param type the type
 * @param data the data
 * @param export_format the export_format
 * @param track the track
 * @param total the total
 * @param initdate the initdate
 * @param endate the endate
 */
-(TOSAccessOpExportLayerTrack*) init
{
    self=[super init];
    return self;
}

-(TOSAccessOpExportLayerTrack*) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                           andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                              andType: (NSString *) type andData: (NSString *) data andExportFormat: (NSString *) exportFormat
                                             andTrack: (int *) track andTotal: (int *) total
                                          andInitDate: (NSDate *) initDate andEndDate: (NSDate *) endDate
{
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Type = type;
        Data = data;
        ExportFormat = exportFormat;
        Track = track;
        Total = total;
        InitDate = initDate;
        EndDate = endDate;
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
    validate = validate && [self isValidorNull: Data];
    validate = validate && [self isValidorNull: Type];
    validate = validate && [self isValidorNull: ExportFormat];
    validate = validate && [self isValidInt: Track];
    validate = validate && [self isValidorNullInt: Total];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // (AAAA-MM-DDThh:mm:sszzzzzz)
    validate = validate && [self isValidorNull:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: InitDate]]];
    validate = validate && [self isValidorNull:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: EndDate]]];
    
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
        params = [params stringByAppendingString: @"/export/"];
        params = [params stringByAppendingString: TOS_ACCESS_OP_TRACK_TYPE_LAYER];
        params = [params stringByAppendingString: TOS_ACCESS_OP_TRACK_DATA_TRACK];
        params = [params stringByAppendingString: @"."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        if(Track!=nil){
            params = [params stringByAppendingString: @"&track="];
            params = [params stringByAppendingString:[self intToURLEncoded: Track]];
        }
        if(ExportFormat!=nil){
            params = [params stringByAppendingString: @"&format="];
            params = [params stringByAppendingString:[self stringToURLEncoded: ExportFormat]];
    
        }
        if(Total!=nil){
            params = [params stringByAppendingString: @"&total="];
            params = [params stringByAppendingString:[self intToURLEncoded: Total]];
        }
        if(InitDate!= nil){
            params = [params stringByAppendingString: @"&initdate="];
            params = [params stringByAppendingString:[self dateToURLEncoded: InitDate]];
        }
        if(EndDate!= nil){
            params = [params stringByAppendingString: @"&endate="];
            params = [params stringByAppendingString:[self dateToURLEncoded: EndDate]];
        }
    }
    return params;
}

@end
