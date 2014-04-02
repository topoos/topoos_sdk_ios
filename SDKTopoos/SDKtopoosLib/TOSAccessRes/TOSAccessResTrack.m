//
//  TOSAccessResTrack.m
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

#import "TOSAccessResTrack.h"
#import "TOS_Position.h"
#import "SBJSON.h"

@implementation TOSAccessResTrack

@synthesize Format,Error,Result,Track;




/**
 * Instantiates a new user result.
 */
-(TOSAccessResTrack *) init{
    self=[super init];
    return self;
}
/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResTrack *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param user
 *            the user
 */
-(TOSAccessResTrack *) initWithError: (NSString*) error andResult: (id) result andUser: (TOS_Track*) track{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Track=track;
    }
    return self;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters{
    // TODO Auto-generated method stub
    int identifier;
    NSString * name = nil;
    int device;
    NSMutableArray * positions = nil;
    TOS_Position * position = nil;
    SBJSON *parser = [[SBJSON alloc] init];
    
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        Track= [[TOS_Track alloc] init];
        identifier=[[attributes valueForKeyPath:@"id"] intValue];
        [Track setIdentifier:identifier];
        name= [attributes valueForKeyPath:@"name"];
        [Track setName:name];
        device= [[attributes valueForKeyPath:@"device"] intValue];
        [Track setDevice:device];
        positions = [[NSMutableArray alloc]init];
        [attributes valueForKeyPath:@"profile"];
        for (NSDictionary * jposition in [attributes valueForKeyPath:@"positions"]){
            position = [[TOS_Position alloc] init];
            int identifierpos;
            NSString * devicepos;
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
            
            identifierpos = [[jposition valueForKeyPath:@"id"] integerValue];
            [position setIdentifier: identifierpos];
            devicepos= [jposition valueForKeyPath:@"device"];
            [position setDevice: devicepos];
            latitude = [[jposition valueForKeyPath:@"latitude"] floatValue];
            [position setLatitude: latitude];
            longitude = [[jposition valueForKeyPath:@"longitude"] floatValue];
            [position setLongitude: longitude];
            elevation = [[jposition valueForKeyPath:@"elevation"] floatValue];
            [position setElevation: elevation];
            accuracy = [[jposition valueForKeyPath:@"accuracy"] floatValue];
            [position setAccuracy: accuracy];
            vaccuracy = [[jposition valueForKeyPath:@"vaccuracy"] floatValue];
            [position setVaccuracy: vaccuracy];
            bearing = [[jposition valueForKeyPath:@"bearing"] floatValue];
            [position setBearing: bearing];
            velocity = [[jposition valueForKeyPath:@"velocity"] floatValue];
            [position setVelocity: velocity];
            trackId= [jposition valueForKeyPath:@"trackid"];
            [position setTrackId: trackId];
            
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

            registerTime = [formatter dateFromString:[jposition valueForKeyPath:@"registertime"]];
            [position setRegisterTime: registerTime];
            timestamp = [formatter dateFromString:[jposition valueForKeyPath:@"timestamp"]];
            [position setTimestamp: timestamp];
            
            positionType = [[TOS_PositionType alloc]init];
            NSString * identifierPositionType=[jposition valueForKeyPath:@"identifierPositionType"];
            [positionType setIdentifier:identifierPositionType];
            NSString * descriptionPositionType=[jposition valueForKeyPath:@"descriptionPositionType"];
            [positionType setDescription:descriptionPositionType];
            [positions addObject:position];
        }
        [Track setPositions:positions];
    }
    
     
}


/**
 * Gets the track.
 * 
 * @return the track
 */
- (TOS_Track *) getTrack {
    return Track;
}

/**
 * Sets the track.
 * 
 * @param track
 *            the track to set
 */
- (void) setTrack: (TOS_Track*) track {
    Track = track;
}

@end
