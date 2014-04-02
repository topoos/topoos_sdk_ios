//
//  TOS_POIWarningData.m
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

#import "TOS_POIWarningData.h"

@implementation TOS_POIWarningData

@synthesize Identifier, Name, Description , Latitude , Longitude , Elevation , Accuracy , Vaccuracy , Categories , Address , CrossStreet , City , Country , PostalCode, Phone , Twitter;

/**
 * Instantiates a new poi.
 *
 * @param identifier the id
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
 */
-(TOS_POIWarningData*) init
{
    self=[super init];
    return self;
}

-(TOS_POIWarningData*) initWithId: (int ) identifier andName: (NSString *) name andDescription: (NSString *) description andLatitude:(NSNumber *) latitude
          andLongitude:(NSNumber *) longitude andElevation:(NSNumber *) elevation andAccuracy:(NSNumber *) accuracy
          andVaccuracy:(NSNumber *) vaccuracy andRegisterTime:(NSDate*) registerTime
         andCategories:(NSMutableArray *) categories andAddress:(NSString *) address
        andCrossStreet:(NSString *) crossStreet andCity:(NSString *) city andCountry:(NSString *) country andPostalCode:(NSString *) postalCode
              andPhone:(NSString *) phone andTwitter:(NSString *) twitter
{
    self=[super init];
    if(self){
        Identifier=identifier;
        Name=name;
        Description=description;
        Latitude=latitude;
        Longitude=longitude;
        Elevation=elevation;
        Accuracy=accuracy;
        Vaccuracy=vaccuracy;
        Categories=categories;
        Address=address;
        CrossStreet=crossStreet;
        City=city;
        Country=country;
        PostalCode=postalCode;
        Phone=phone;
        Twitter=twitter;
    }
    return self;
}


/**
 * Get the id of the poi.
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
 * get the description.
 *
 * @return the description
 */
- (NSString *) getDescription {
    return Description;
}

/**
 * Sets the description.
 *
 * @param description the description to set
 */
- (void) setDescription:(NSString *) description {
    Description = description;
}

/**
 * get the latitude.
 *
 * @return the latitude
 */
- (NSNumber *) getLatitude {
    return Latitude;
}

/**
 * Sets the latitude.
 *
 * @param latitude the latitude to set
 */
- (void) setLatitude:(NSNumber *) latitude {
    Latitude = latitude;
}

/**
 * get the longitude.
 *
 * @return the longitude
 */
- (NSNumber *) getLongitude {
    return Longitude;
}

/**
 * Sets the longitude.
 *
 * @param longitude the longitude to set
 */
- (void) setLongitude:(NSNumber *) longitude {
    Longitude = longitude;
}

/**
 * get the elevation.
 *
 * @return the elevation
 */
- (NSNumber *) getElevation {
    return Elevation;
}

/**
 * Sets the elevation.
 *
 * @param elevation the elevation to set
 */
- (void) setElevation:(NSNumber *) elevation {
    Elevation = elevation;
}

/**
 * get the accuracy.
 *
 * @return the accuracy
 */
- (NSNumber *) getAccuracy {
    return Accuracy;
}

/**
 * Sets the accuracy.
 *
 * @param accuracy the accuracy to set
 */
- (void) setAccuracy:(NSNumber *) accuracy {
    Accuracy = accuracy;
}

/**
 * get the vaccuracy.
 *
 * @return the vaccuracy
 */
- (NSNumber *) getVaccuracy {
    return Vaccuracy;
}

/**
 * Sets the vaccuracy.
 *
 * @param vaccuracy the vaccuracy to set
 */
- (void) setVaccuracy:(NSNumber *) vaccuracy {
    Vaccuracy = vaccuracy;
}

/**
 * get a list of the categories.
 *
 * @return the categories
 */
- (NSMutableArray *) getCategories {
    return Categories;
}

/**
 * Sets the categories.
 *
 * @param categories the categories to set
 */
- (void) setCategories:(NSMutableArray *) categories {
    Categories = categories;
}

/**
 * get the address.
 *
 * @return the address
 */
- (NSString *) getAddress {
    return Address;
}

/**
 * Sets the address.
 *
 * @param address the address to set
 */
- (void) setAddress:(NSString *) address {
    Address = address;
}

/**
 * get the cross street.
 *
 * @return the crossStreet
 */
- (NSString *) getCrossStreet {
    return CrossStreet;
}

/**
 * Sets the cross street.
 *
 * @param crossStreet the crossStreet to set
 */
- (void) setCrossStreet:(NSString *) crossStreet {
    CrossStreet = crossStreet;
}

/**
 * get the city.
 *
 * @return the city
 */
- (NSString *) getCity {
    return City;
}

/**
 * Sets the city.
 *
 * @param city the city to set
 */
- (void) setCity:(NSString *) city {
    City = city;
}

/**
 * get the country.
 *
 * @return the country
 */
- (NSString *) getCountry {
    return Country;
}

/**
 * Sets the country.
 *
 * @param country the country to set
 */
- (void) setCountry:(NSString *) country {
    Country = country;
}

/**
 * get the postal code.
 *
 * @return the postalCode
 */
- (NSString *) getPostalCode {
    return PostalCode;
}

/**
 * Sets the postal code.
 *
 * @param postalCode the postalCode to set
 */
- (void) setPostalCode:(NSString *) postalCode {
    PostalCode = postalCode;
}

/**
 * get the phone.
 *
 * @return the phone
 */
- (NSString *) getPhone {
    return Phone;
}

/**
 * Sets the phone.
 *
 * @param phone the phone to set
 */
- (void) setPhone:(NSString *) phone {
    Phone = phone;
}

/**
 * get the twitter id.
 *
 * @return the twitter
 */
- (NSString *) getTwitter {
    return Twitter;
}

/**
 * Sets the twitter.
 *
 * @param twitter the twitter to set
 */
- (void) setTwitter: (NSString*) twitter {
    Twitter = twitter;
}

@end
