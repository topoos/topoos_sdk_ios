//
//  TOSAccessResCheckin.m
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

#import "TOSAccessResCheckin.h"
#import "SBJSON.h"

@implementation TOSAccessResCheckin

@synthesize Format,Checkin,Error,Result;

/**
 * Instantiates a new user result.
 */
-(TOSAccessResCheckin *) init{
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
-(TOSAccessResCheckin *) initWithError: (NSString*) error andResult: (id) result{
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
-(TOSAccessResCheckin *) initWithError: (NSString*) error andResult: (id) result andCheckin: (TOS_Checkin*) checkin{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Checkin=checkin;
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
    int poi_id;
    int device;
    NSDate * registerTime;
    NSDate * timestamp;
    TOS_Checkin * checkin = nil;
    SBJSON *parser = [[SBJSON alloc] init];
    
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        checkin= [[TOS_Checkin alloc] init];
        identifier=[[attributes valueForKeyPath:@"id"] intValue];
        [checkin setIdentifier:identifier];
        [checkin setUser_id:[attributes valueForKeyPath:@"user_id"]];
        poi_id=[[attributes valueForKeyPath:@"poi_id"] intValue];
        [checkin setPoi_id:poi_id];
        device= [[attributes valueForKeyPath:@"device_id"] intValue];
        [checkin setDevice_id:device];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        registerTime = [formatter dateFromString:[attributes valueForKeyPath:@"register_time"]];
        [checkin setRegister_time: registerTime];
        timestamp = [formatter dateFromString:[attributes valueForKeyPath:@"timestamp"]];
        [checkin setTimestamp: timestamp];
        Checkin=checkin;
    }
    
}


/**
 * Gets the track.
 *
 * @return the track
 */
- (TOS_Checkin *) getCheckin {
    return Checkin;
}

/**
 * Sets the track.
 *
 * @param track
 *            the track to set
 */
- (void) setCheckin:(TOS_Checkin *)checkin {
    Checkin = checkin;
}


@end
