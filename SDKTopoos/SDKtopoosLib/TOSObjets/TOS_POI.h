//
//  TOS_POI.h
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
#import <Foundation/Foundation.h>
#import "TOS_POIWarning_Count.h"
#import "TOS_POICategory.h"
@interface TOS_POI : NSObject{
    /** The id. */
    int Identifier ; //id
    
    /** The name. */
    NSString * Name ;
    
    /** The description. */
    NSString * Description ;
    
    /** The latitude. */
    float  Latitude ;
    
    /** The longitude. */
    float  Longitude ;
    
    /** The elevation. */
    float  Elevation ;
    
    /** The accuracy. */
    float  Accuracy ;
    
    /** The vaccuracy. */
    float  Vaccuracy ;
    
    /** The registertime. */
    NSDate * Registertime ;
    
    /** The categories. #POICategory */
    NSMutableArray * Categories ;
    
    /** The address. */
     NSString * Address ;
    
    /** The cross street. */
     NSString * CrossStreet ;
    
    /** The city. */
     NSString * City ;
    
    /** The country. */
     NSString * Country ;
    
    /** The postal code. */
    NSString * PostalCode ;
    
    /** The phone. */
     NSString * Phone ;
    
    /** The twitter. */
     NSString * Twitter ;
    
    /** The last update. */
     NSDate * LastUpdate ;
    
    /** The warningcount. */
     TOS_POIWarning_Count * Warningcount ;
}
/**
 * V0
 */

/**
 * Instantiates a new poi.
 *
 * @param id the id
 * @param name the name
 * @param description the description
 * @param latitude the latitude
 * @param longitude the longitude
 * @param elevation the elevation
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param registertime the registertime
 * @param categories the categories
 * @param address the address
 * @param crossStreet the cross street
 * @param city the city
 * @param country the country
 * @param postalCode the postal code
 * @param phone the phone
 * @param twitter the twitter
 * @param lastUpdate the last update
 * @param warningcount the warningcount
 */
-(TOS_POI*) init;

-(TOS_POI*) initWithId: (int ) identifier andName: (NSString *) name andDescription: (NSString *) description andLatitude:(float ) latitude
andLongitude:(float ) longitude andElevation:(float ) elevation andAccuracy:(float ) accuracy
andVaccuracy:(float ) vaccuracy andRegisterTime:(NSDate*) registerTime
andCategories:(NSMutableArray *) categories andAddress:(NSString *) address
andCrossStreet:(NSString *) crossStreet andCity:(NSString *) city andCountry:(NSString *) country andPostalCode:(NSString *) postalCode
andPhone:(NSString *) phone andTwitter:(NSString *) twitter andLastUpdate:(NSDate *) lastUpdate
andWarningCount: (TOS_POIWarning_Count *) warningCount;


/**
 * Get the id of the poi.
 *
 * @return the id
 */
- (int) getIdentifier;

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier;



/**
 * get the name.
 *
 * @return the name
 */
- (NSString *) getName;

/**
 * Sets the name.
 *
 * @param name the name to set
 */
- (void) setName:(NSString *) name;

/**
 * get the description.
 *
 * @return the description
 */
- (NSString *) getDescription ;

/**
 * Sets the description.
 *
 * @param description the description to set
 */
- (void) setDescription:(NSString *) description ;

/**
 * get the latitude.
 *
 * @return the latitude
 */
- (float ) getLatitude ;

/**
 * Sets the latitude.
 *
 * @param latitude the latitude to set
 */
- (void) setLatitude:(float ) latitude ;

/**
 * get the longitude.
 *
 * @return the longitude
 */
- (float ) getLongitude ;

/**
 * Sets the longitude.
 *
 * @param longitude the longitude to set
 */
- (void) setLongitude:(float ) longitude;

/**
 * get the elevation.
 *
 * @return the elevation
 */
- (float ) getElevation ;

/**
 * Sets the elevation.
 *
 * @param elevation the elevation to set
 */
- (void) setElevation:(float ) elevation ;

/**
 * get the accuracy.
 *
 * @return the accuracy
 */
- (float ) getAccuracy ;

/**
 * Sets the accuracy.
 *
 * @param accuracy the accuracy to set
 */
- (void) setAccuracy:(float ) accuracy ;

/**
 * get the vaccuracy.
 *
 * @return the vaccuracy
 */
- (float ) getVaccuracy;

/**
 * Sets the vaccuracy.
 *
 * @param vaccuracy the vaccuracy to set
 */
- (void) setVaccuracy:(float ) vaccuracy ;

/**
 * get the register time.
 *
 * @return the registertime
 */ 
- (NSDate*) getRegistertime ;

/**
 * Sets the registertime.
 *
 * @param registertime the registertime to set
 */
- (void) setRegistertime:(NSDate *) registertime ;

/**
 * get a list of the categories.
 *
 * @return the categories
 */
- (NSMutableArray *) getCategories ;

/**
 * Sets the categories.
 *
 * @param categories the categories to set
 */
- (void) setCategories:(NSMutableArray *) categories;

/**
 * get the address.
 *
 * @return the address
 */
- (NSString *) getAddress;
/**
 * Sets the address.
 *
 * @param address the address to set
 */
- (void) setAddress:(NSString *) address;
/**
 * get the cross street.
 *
 * @return the crossStreet
 */
- (NSString *) getCrossStreet ;

/**
 * Sets the cross street.
 *
 * @param crossStreet the crossStreet to set
 */
- (void) setCrossStreet:(NSString *) crossStreet ;

/**
 * get the city.
 *
 * @return the city
 */
- (NSString *) getCity ;

/**
 * Sets the city.
 *
 * @param city the city to set
 */
- (void) setCity:(NSString *) city ;

/**
 * get the country.
 *
 * @return the country
 */
- (NSString *) getCountry ;

/**
 * Sets the country.
 *
 * @param country the country to set
 */
- (void) setCountry:(NSString *) country ;

/**
 * get the postal code.
 *
 * @return the postalCode
 */
- (NSString *) getPostalCode ;

/**
 * Sets the postal code.
 *
 * @param postalCode the postalCode to set
 */
- (void) setPostalCode:(NSString *) postalCode ;

/**
 * get the phone.
 *
 * @return the phone
 */
- (NSString *) getPhone ;

/**
 * Sets the phone.
 *
 * @param phone the phone to set
 */
- (void) setPhone:(NSString *) phone ;

/**
 * get the twitter id.
 *
 * @return the twitter
 */
- (NSString *) getTwitter ;

/**
 * Sets the twitter.
 *
 * @param twitter the twitter to set
 */
- (void) setTwitter: (NSString*) twitter ;

/**
 * get the last update.
 *
 * @return the lastUpdate
 */
- (NSDate *) getLastUpdate ;

/**
 * Sets the last update.
 *
 * @param lastUpdate the lastUpdate to set
 */
- (void) setLastUpdate:(NSDate *) lastUpdate;

/**
 * get the warning count.
 *
 * @return the warningcount
 */
- (TOS_POIWarning_Count *) getWarningcount;

/**
 * Sets the warningcount.
 *
 * @param warningcount the warningcount to set
 */
- (void) setWarningcount:(TOS_POIWarning_Count *) warningcount ;
@end
