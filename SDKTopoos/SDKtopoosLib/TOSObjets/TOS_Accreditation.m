//
//  TOS_Acreditation.m
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

#import "TOS_Accreditation.h"

@implementation TOS_Accreditation

/** The Expirationtime. */
@synthesize Expirationtime, ClientId, Visibledevices;


/**
 * Instantiates a new acreditation.
 *
 * @param expirationtime the expirationtime
 * @param clientId the client id
 * @param visibledevices the visibledevices
 */
-(TOS_Accreditation *) init{
    self=[super init];
    return self;
}

-(TOS_Accreditation *) initWithExpiration: (NSString *) expirationtime andClientId: (NSString *) clientid andVisibleDevices: (NSMutableArray *) visibledevices
{
    
    self=[super init];
    if(self){
        Expirationtime=expirationtime;
        ClientId=clientid;
        Visibledevices=visibledevices;
    }
    return self;
}

/**
 * Gets the expirationtime.
 *
 * @return the expirationtime
 */
- (NSString *) getExpirationtime {
    return Expirationtime;
}

/**
 * Sets the expirationtime.
 *
 * @param expirationtime the new expirationtime
 */
- (void) setExpirationtime:(NSString *) expirationtime {
    Expirationtime = expirationtime;
}

/**
 * Gets the client id.
 *
 * @return the client id
 */
- (NSString *) getClientId {
    return ClientId;
}

/**
 * Sets the client id.
 *
 * @param clientId the new client id
 */
- (void) setClientId:(NSString *) clientId {
    ClientId = clientId;
}

/**
 * Gets the visibledevices.
 *
 * @return the visibledevices
 */
- (NSMutableArray *) getVisibledevices {
    return Visibledevices;
}

/**
 * Sets the visibledevices.
 *
 * @param visibledevices the new visibledevices
 */
- (void) setVisibledevices:(NSMutableArray *) visibledevices {
    Visibledevices = visibledevices;
}
@end
