//
//  TOS_Address.m
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

#import "TOS_Address.h"

@implementation TOS_Address

@synthesize Address,Administrative_area,Country,Cross_street,Postal_code,State;

/**
 * Instantiates a new address.
 *
 * @param address name of the address
 * @param cross_street name of the cross street
 * @param state name of the state
 * @param administrative_area name of the administrative area
 * @param country name of the country
 * @param postal_code postal code
 */
-(TOS_Address*) init
{
    self=[super init];
    return self;
}

-(TOS_Address*) initWithAddress: (NSString *) address andCross_Street:(NSString *) cross_street andState:(NSString* )state andAdministrative_area:(NSString*) administrative_area andCountry:(NSString *) country andPostal_Code:(NSString *) postal_code{
    self=[super init];
    if (self){
        Administrative_area=administrative_area;
        Address=address;
        Country=country;
        Cross_street=cross_street;
        Postal_code=postal_code;
        State=state;
    }
    return self;
}

/**
 * get the address.
 *
 * @return the address
 */
-(NSString *) getAddress {
    return Address;
}

/**
 * Sets the address.
 *
 * @param address the address to set
 */
- (void) setAddress:(NSString *) address{
    Address = address;
}

/**
 * get the cross street.
 *
 * @return the cross_street
 */
-(NSString *) getCross_street {
    return Cross_street;
}

/**
 * Sets the cross_street.
 *
 * @param cross_street the cross_street to set
 */
- (void) setCross_street:(NSString *) cross_street{
    Cross_street = cross_street;
}

/**
 * get the state.
 *
 * @return the state
 */
-(NSString *) getState {
    return State;
}

/**
 * Sets the state.
 *
 * @param state the state to set
 */
- (void) setState:(NSString *) state{
    State = state;
}

/**
 * get the administrative area.
 *
 * @return the administrative_area
 */
-(NSString *) getAdministrative_area {
    return Administrative_area;
}

/**
 * Sets the administrative_area.
 *
 * @param administrative_area the administrative_area to set
 */
- (void) setAdministrative_area:(NSString *) administrative_area{
   Administrative_area = administrative_area;
}

/**
 * get the country.
 *
 * @return the country
 */
-(NSString *) getCountry {
    return Country;
}

/**
 * Sets the country.
 *
 * @param country the country to set
 */
- (void) setCountry:(NSString *) country{
    Country = country;
}

/**
 * get the postal code.
 *
 * @return the postal_code
 */
-(NSString *) getPostal_code {
    return Postal_code;
}

/**
 * Sets the postal_code.
 *
 * @param postal_code the postal_code to set
 */
- (void) setPostal_code:(NSString *) postal_code{
    Postal_code = postal_code;
}

@end
