//
//  TOSAccessResPositionsCollection.m
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

#import "TOSAccessResPositionsCollection.h"
#import "JSON.h"

@implementation TOSAccessResPositionsCollection

@synthesize positions, Error, Result;

/**
 * Instantiates a new position collection result.
 */
- (TOSAccessResPositionsCollection *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new position collection result.
 * @param error the error
 * @param result the result
 */
- (TOSAccessResPositionsCollection *) initWithError: (NSString*) error andResult: (NSString*) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new position collection result.
 * @param error the error
 * @param result the result
 * @param positions the positions
 */
- (TOSAccessResPositionsCollection *) initWithError: (NSString*) error andResult: (NSString*) result andPosition: (NSMutableArray*) pos{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        positions=pos;
    }
    return self;
}

/**
 * Gets the positions.
 * @return the positions
 */
- (NSMutableArray *) getPositions{
    return positions;
}

/**
 * Sets the positions.
 * @param positions the positions to set
 */
- (void) setPositions: (NSMutableArray *) pos{
    positions=pos;
}


/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    NSMutableArray * arrayPositions;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil)
    {
        arrayPositions = [[NSMutableArray alloc]init];
        
        // Extracting content
        for (NSDictionary *job in attributes)
        {
            [arrayPositions addObject: [ self parsePosition: job]];
        }
    }
    
    positions = arrayPositions;
}


/**
 * Parses the position.
 * @param job the job
 * @return the position
 * @throws TopoosException the topoos exception
 */
- (TOS_Position *) parsePosition: (NSDictionary *) job
{
    TOS_Position * position;
    
    int identifier;
    NSString * device;
    float latitude;
    float longitude;
    float elevation;
    float accuracy;
    float vaccuracy;
    float bearing;
    float velocity;
    NSString * trackId;
    NSDate * timestamp;
    NSDate * registerTime;
    TOS_PositionType * positionType;

    //SBJSON *parser = [[SBJSON alloc] init];
    //NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (job != nil) {
        // Extracting content
        position = [[TOS_Position alloc] init];
        identifier = [[job valueForKeyPath:@"id"] integerValue];
        [position setIdentifier: identifier];
        device= [job valueForKeyPath:@"device"];
        [position setDevice: device];
        latitude = [[job valueForKeyPath:@"latitude"] floatValue];
        [position setLatitude: latitude];
        longitude = [[job valueForKeyPath:@"longitude"] floatValue];
        [position setLongitude: longitude];
        elevation = [[job valueForKeyPath:@"elevation"] floatValue];
        [position setElevation: elevation];
        accuracy = [[job valueForKeyPath:@"accuracy"] floatValue];
        [position setAccuracy: accuracy];
        vaccuracy = [[job valueForKeyPath:@"vaccuracy"] floatValue];
        [position setVaccuracy: vaccuracy];
        bearing = [[job valueForKeyPath:@"bearing"] floatValue];
        [position setBearing: bearing];
        velocity = [[job valueForKeyPath:@"velocity"] floatValue];
        [position setVelocity: velocity];
        trackId= [job valueForKeyPath:@"trackid"];
        [position setTrackId: trackId];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        registerTime = [formatter dateFromString:[job valueForKeyPath:@"registertime"]];
        [position setRegisterTime: registerTime];
        timestamp = [formatter dateFromString:[job valueForKeyPath:@"timestamp"]];
        [position setTimestamp: timestamp];
        
        positionType = [[TOS_PositionType alloc]init];
        NSString * identifierPositionType=[job valueForKeyPath:@"identifierPositionType"];
        [positionType setIdentifier:identifierPositionType];
        NSString * descriptionPositionType=[job valueForKeyPath:@"descriptionPositionType"];
        [positionType setDescription:descriptionPositionType];
    
        [position setPositionType: positionType];
    }
    
    return position;
}


@end
