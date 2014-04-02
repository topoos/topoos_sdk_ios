//
//  TOS_Track.m
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

#import "TOS_Track.h"

@implementation TOS_Track


@synthesize Device,Identifier,Name,Positions;


/**
 * Instantiates a new track.
 *
 * @param id the id
 * @param name the name
 * @param device the device
 * @param positions the positions
 */

-(TOS_Track*) init{
    self=[super init];
    return self;
}

-(TOS_Track*) initWithIdentifier: (int ) identifier andName:(NSString*) name andDevice:(int) device andPositions:(NSMutableArray *) positions {
    self=[super init];
    if(self){
        Name=name;
        Device=device;
        Identifier=identifier;
        Positions=positions;
    }
    
    return self;
}


/**
 * get the id.
 *
 * @return the id
 */
- (int ) getIdentifier {
    return Identifier;
}

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier {
    Identifier = identifier;
}

/**
 * get the name.
 *
 * @return the name
 */
- (NSString *) getName {
    return Name;
}

/**
 * Sets the name.
 *
 * @param name the name to set
 */
- (void) setName:(NSString *) name {
    Name = name;
}

/**
 * get the device.
 *
 * @return the device
 */
- (int ) getDevice {
    return Device;
}

/**
 * Sets the device.
 *
 * @param device the device to set
 */
- (void) setDevice:(int ) device {
    Device = device;
}

/**
 * get the positions.
 *
 * @return the positions
 */
- (NSMutableArray *) getPositions {
    return Positions;
}

/**
 * Sets the positions.
 *
 * @param positions the positions to set
 */
- (void) setPositions:(NSMutableArray *) positions {
    Positions = positions;
}


@end
