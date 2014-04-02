//
//  TOSAccessResPositions.m
//  SDKtopoos
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

#import "TOSAccessResPositions.h"
#import "JSON.h"

@implementation TOSAccessResPositions

@synthesize position, Error, Result;

/**
 * Instantiates a new position result.
 */
- (TOSAccessResPositions *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new position result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResPositions *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new position result.
 *
 * @param error the error
 * @param result the result
 * @param pos the position
 */
-(TOSAccessResPositions *) initWithError: (NSString*) error andResult: (id) result andPosition: (TOS_Position*) pos{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        position=pos;
    }
    return self;
}

/**
 * Gets the position.
 * @return the position
 */
- (TOS_Position *) getPosition{
    return position;
}

/**
 * Sets the position.
 * @param position the position to set
 */
- (void) setPosition: (TOS_Position *) pos{
    position=pos;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters{
    
    int identifier;
    NSString * device;
    NSDate * timestamp;
    NSDate * registerTime;
    float latitude;
    float longitude;
    float elevation;
    float accuracy;
    float vaccuracy;
    float bearing;
    float velocity;
    NSString * trackId;
    TOS_PositionType * positionType;

    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        position = [[TOS_Position alloc] init];
        identifier = [[attributes valueForKeyPath:@"id"] intValue];
        [position setIdentifier: identifier];
        device= [attributes valueForKeyPath:@"device"];
        [position setDevice: device];
        latitude = [[attributes valueForKeyPath:@"latitude"] floatValue];
        [position setLatitude: latitude];
        longitude = [[attributes valueForKeyPath:@"longitude"] floatValue];
        [position setLongitude: longitude];
        elevation = [[attributes valueForKeyPath:@"elevation"] floatValue];
        [position setElevation: elevation];
        accuracy = [[attributes valueForKeyPath:@"accuracy"] floatValue];
        [position setAccuracy: accuracy];
        vaccuracy = [[attributes valueForKeyPath:@"vaccuracy"] floatValue];
        [position setVaccuracy: vaccuracy];
        bearing = [[attributes valueForKeyPath:@"bearing"] floatValue];
        [position setBearing: bearing];
        velocity = [[attributes valueForKeyPath:@"velocity"] floatValue];
        [position setVelocity: velocity];
        trackId= [attributes valueForKeyPath:@"trackid"];
        [position setTrackId: trackId];
                
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        registerTime = [formatter dateFromString:[attributes valueForKeyPath:@"registerTime"]];
        [position setRegisterTime: registerTime];
        
        timestamp = [formatter dateFromString:[attributes valueForKeyPath:@"timestamp"]];
        [position setTimestamp: timestamp];

        positionType = [[TOS_PositionType alloc]init];
        NSString * identifierPositionType=[attributes valueForKeyPath:@"identifierPositionType"];
        [positionType setIdentifier:identifierPositionType];
        NSString * descriptionPositionType=[attributes valueForKeyPath:@"descriptionPositionType"];
        [positionType setDescription:descriptionPositionType];
    }
}

@end
