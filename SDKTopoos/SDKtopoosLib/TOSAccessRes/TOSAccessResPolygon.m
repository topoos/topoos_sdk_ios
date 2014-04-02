//
//  TOSAccessResPolygon.m
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

#import "TOSAccessResPolygon.h"
#import "SBJSON.h"
#import "TOS_Location.h"


@implementation TOSAccessResPolygon


@synthesize  Result,Error,Format,Polygon;


/**
 * Instantiates a new polygon result.
 */
-(TOSAccessResPolygon *) init{
    self=[super init];
    return self;
}
/**
 * Instantiates a new polygon result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResPolygon *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new polygon result.
 *
 * @param error the error
 * @param result the result
 * @param polygon the polygon
 */
-(TOSAccessResPolygon *) initWithError: (NSString*) error andResult: (id) result andPolygon: (NSMutableArray *) polygon{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Polygon=polygon;
    }
    return self;
}

/* (non-Javadoc)
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
            [arrayPositions addObject: [ self parseLocation: job]];
        }
    }
    
    Polygon = arrayPositions;
}

- (TOS_Location *) parseLocation: (NSDictionary *) job
{
    TOS_Location * location;
    
    NSNumber * latitude;
    NSNumber * longitude;

    
    //SBJSON *parser = [[SBJSON alloc] init];
    //NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (job != nil) {
        // Extracting content
        location = [[TOS_Location alloc] init];
        latitude = [[NSNumber alloc] initWithFloat:[[job valueForKeyPath:@"latitude"] floatValue]] ;
        
        [location setLatitude: latitude];
        longitude = [[NSNumber alloc] initWithFloat:[[job valueForKeyPath:@"longitude"] floatValue]];
        [location setLongitude: longitude];
        
    }
    return location;
}


/**
 * Gets the polygon.
 *
 * @return the polygon
 */
-(NSMutableArray *) getPolygon {
    return Polygon;
}

/**
 * Sets the polygon.
 *
 * @param polygon the polygon to set
 */
-(void) setPolygon:(NSMutableArray *) polygon {
    Polygon = polygon;
}

@end
