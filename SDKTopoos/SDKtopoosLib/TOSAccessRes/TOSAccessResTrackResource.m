//
//  TOSAccessResTrackResource.m
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

#import "TOSAccessResTrackResource.h"
#import "JSON.h"


@implementation TOSAccessResTrackResource

@synthesize TrackResource, Error, Result;

/**
 * Instantiates a new track resource result.
 */
- (TOSAccessResTrackResource *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new track resource result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResTrackResource *) initWithError: (NSString*) error andResult: (NSString*) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new track resource result.
 *
 * @param error the error
 * @param result the result
 * @param rule the rule
 */
- (TOSAccessResTrackResource *) initWithError: (NSString*) error andResult: (NSString*) result andRule: (TOS_TrackResource *) trackResource{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        TrackResource=trackResource;
    }
    return self;
}


/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    int identifier;
    NSString * type;
    NSString * format;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        TrackResource = [[TOS_TrackResource alloc] init];
        
        identifier = [[attributes valueForKeyPath:@"id"] integerValue];
        [TrackResource setIdentifier: identifier];
        type= [attributes valueForKeyPath:@"type"];
        [TrackResource setType: type];
        format= [attributes valueForKeyPath:@"format"];
        [TrackResource setFormat: format];
    }
}

/**
 * Gets the track resource.
 * @return the TrackResource
 */
- (TOS_TrackResource *) getTrackResource
{
    return TrackResource;
}

/**
 * Sets the track resource.
 * @param trackResource the Track Resource to set
 */
- (void) setTrackResource: (TOS_TrackResource *) trackResource
{
    TrackResource = trackResource;
}

@end
