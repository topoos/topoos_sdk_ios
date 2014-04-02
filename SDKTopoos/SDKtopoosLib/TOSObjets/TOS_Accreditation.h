//
//  TOS_Acreditation.h
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

@interface TOS_Accreditation : NSObject
/** The Expirationtime. */
@property (nonatomic,retain) NSString * Expirationtime;

/** The client id. */
@property (nonatomic,retain) NSString * ClientId;

/** The visibledevices. */
@property (nonatomic,retain) NSMutableArray * Visibledevices;

/**
 * Instantiates a new acreditation.
 *
 * @param expirationtime the expirationtime
 * @param clientId the client id
 * @param visibledevices the visibledevices
 */
-(TOS_Accreditation *) init;

-(TOS_Accreditation *) initWithExpiration: (NSString *) expirationtime andClientId: (NSString *) clientid andVisibleDevices: (NSMutableArray *) visibledevices;

/**
 * Gets the expirationtime.
 *
 * @return the expirationtime
 */
- (NSString *) getExpirationtime ;

/**
 * Sets the expirationtime.
 *
 * @param expirationtime the new expirationtime
 */
- (void) setExpirationtime:(NSString *) expirationtime ;

/**
 * Gets the client id.
 *
 * @return the client id
 */
- (NSString *) getClientId ;

/**
 * Sets the client id.
 *
 * @param clientId the new client id
 */
- (void) setClientId:(NSString *) clientId ;

/**
 * Gets the visibledevices.
 *
 * @return the visibledevices
 */
- (NSMutableArray *) getVisibledevices ;

/**
 * Sets the visibledevices.
 *
 * @param visibledevices the new visibledevices
 */
- (void) setVisibledevices:(NSMutableArray *) visibledevices ;

@end
