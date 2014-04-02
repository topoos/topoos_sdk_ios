//
//  TOSAccessResCheckinCollection.m
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

#import "TOSAccessResCheckinCollection.h"
#import "SBJSON.h"
#import "TOS_Checkin.h"

@implementation TOSAccessResCheckinCollection

@synthesize Result,Error,Format,CheckinCollection;


/**
 * Instantiates a new checkin collection result.
 */
-(TOSAccessResCheckinCollection *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResCheckinCollection *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param checkinCollection
 *            the checkin collection
 */
-(TOSAccessResCheckinCollection *) initWithError: (NSString*) error andResult: (id) result andPOICategoryCollection: (TOS_CheckinCollection *) checkinCollection{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        CheckinCollection=checkinCollection;
    }
    return self;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil)
    {
        NSMutableArray * jarray;
        CheckinCollection = [[TOS_CheckinCollection alloc] init];
        jarray = [[NSMutableArray alloc]init];
        
        // Extracting content
        for (NSDictionary *job in attributes)
        {
            [jarray addObject: [self parseCheckin: job]];
        }
        
        [CheckinCollection setCheckins: jarray];
    }
}

/**
 * Parses the POI Category.
 * @param job the job
 * @return the POI Category
 * @throws TopoosException the topoos exception
 */
- (TOS_Checkin *) parseCheckin: (NSDictionary *) job
{
    TOS_Checkin * checkin=nil;
    int identifier;
    int poi_id;
    int device;
    NSDate * registerTime;
    NSDate * timestamp;
    if (job != nil) {
        // Extracting content
        checkin= [[TOS_Checkin alloc] init];
        identifier=[[job valueForKeyPath:@"id"] intValue];
        [checkin setIdentifier:identifier];
        [checkin setUser_id:[job valueForKeyPath:@"user_id"]];
        poi_id=[[job valueForKeyPath:@"poi_id"] intValue];
        [checkin setPoi_id:poi_id];
        device= [[job valueForKeyPath:@"device_id"] intValue];
        [checkin setDevice_id:device];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        registerTime = [formatter dateFromString:[job valueForKeyPath:@"register_time"]];
        [checkin setRegister_time: registerTime];
        timestamp = [formatter dateFromString:[job valueForKeyPath:@"timestamp"]];
        [checkin setTimestamp: timestamp];
    }
    
    return checkin;
}


/**
 * Gets the checkin collection.
 *
 * @return the checkinCollection
 */
-(TOS_CheckinCollection *) getCheckinCollection {
    return CheckinCollection;
}

/**
 * Sets the checkin collection.
 *
 * @param checkinCollection
 *            the checkinCollection to set
 */
-(void) setCheckinCollection:(TOS_CheckinCollection*)checkinCollection {
    CheckinCollection = checkinCollection;
}




@end
