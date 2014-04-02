//
//  TOSAccessOpTrackGetLast.m
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
#import "TOSAccessOpTrackGetLast.h"

@implementation TOSAccessOpTrackGetLast

@synthesize Version,OperationName,Method,Layers,Total,Oauth_token,Format,Device;

/**
 * Instantiates a new tracks get_last.
 *
 * @param operationName the operation name
 * @param method the method
 * @param format the format
 * @param version the version
 * @param oauth_token the oauth_token
 * @param device the device
 * @param total the total
 * @param layer the layer
 */
-(TOSAccessOpTrackGetLast *) init{
    self=[super init];
    return self;
}

-(TOSAccessOpTrackGetLast *) initWithOperationName: (NSString *) operationName andMethod: (NSString *) method andFormat:(NSString *) format
                                     andVersion: (int *) version andOauth_token: (NSString *) oauth_token
                                       andDevice: (NSString *) device andTotal: (int *) total
                                    andLayers:(NSMutableArray *) layers {
    self=[super initWithOperationName: operationName andMethod:method andFormat:format andVersion:version];
    if(self)
    {
        Oauth_token = oauth_token;
        Device=device;
        Total=total;
        Layers=layers;
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
    validate = validate && [self isValidorNull:Device];
    validate = validate && [self isValidorNullInt:Total];
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
        params = [params stringByAppendingString: @"/tracks/get_last."];
        params = [params stringByAppendingString: [self getFormat]];
        params = [params stringByAppendingString: @"?oauth_token="];
        params = [params stringByAppendingString: [self stringToURLEncoded: Oauth_token]];
        if(Total!=nil){
            params = [params stringByAppendingString: @"&total="];
            params = [params stringByAppendingString:[self intToURLEncoded: Total]];
        }
        if(Device!=nil){
            params = [params stringByAppendingString: @"&device="];
            params = [params stringByAppendingString:Device];
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
                    str_layers = [str_layers stringByAppendingString: [Layers objectAtIndex:[Layers count]-1] ];
                }
            }
            
        }
    }
    return params;
}

@end
