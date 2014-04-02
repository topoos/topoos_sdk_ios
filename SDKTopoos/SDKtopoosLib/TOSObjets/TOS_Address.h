//
//  TOS_Address.h
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

@interface TOS_Address : NSObject
/** The address. */
@property (nonatomic,retain) NSString * Address;

/** The cross_street. */
@property (nonatomic,retain) NSString * Cross_street;

/** The state. */
@property (nonatomic,retain) NSString * State;

/** The administrative_area. */
@property (nonatomic,retain) NSString * Administrative_area;

/** The country. */
@property (nonatomic,retain) NSString * Country;

/** The postal_code. */
@property (nonatomic,retain) NSString * Postal_code;




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
-(TOS_Address*) init;

-(TOS_Address*) initWithAddress: (NSString *) address andCross_Street:(NSString *) cross_street andState:(NSString* )state andAdministrative_area:(NSString*) administrative_area andCountry:(NSString *) country andPostal_Code:(NSString *) postal_code;

/**
 * get the address.
 *
 * @return the address
 */
-(NSString *) getAddress ;

/**
 * Sets the address.
 *
 * @param address the address to set
 */
- (void) setAddress:(NSString *) address;

/**
 * get the cross street.
 *
 * @return the cross_street
 */
-(NSString *) getCross_street ;

/**
 * Sets the cross_street.
 *
 * @param cross_street the cross_street to set
 */
- (void) setCross_street:(NSString *) cross_street;

/**
 * get the state.
 *
 * @return the state
 */
-(NSString *) getState;

/**
 * Sets the state.
 *
 * @param state the state to set
 */
- (void) setState:(NSString *) state;

/**
 * get the administrative area.
 *
 * @return the administrative_area
 */
-(NSString *) getAdministrative_area ;

/**
 * Sets the administrative_area.
 *
 * @param administrative_area the administrative_area to set
 */
- (void) setAdministrative_area:(NSString *) administrative_area;

/**
 * get the country.
 *
 * @return the country
 */
-(NSString *) getCountry ;

/**
 * Sets the country.
 *
 * @param country the country to set
 */
- (void) setCountry:(NSString *) country;

/**
 * get the postal code.
 *
 * @return the postal_code
 */
-(NSString *) getPostal_code ;

/**
 * Sets the postal_code.
 *
 * @param postal_code the postal_code to set
 */
- (void) setPostal_code:(NSString *) postal_code;

@end
