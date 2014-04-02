//
//  TOS_POICategory.m
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
#import "TOS_POICategory.h"

@implementation TOS_POICategory

/** The id. */
@synthesize Identifier, Description , IsSystem ;

/**
 * Instantiates a new pOI category.
 *
 * @param id the id
 * @param description the description
 * @param isSystem the is system
 */
-(TOS_POICategory*) init{
    self=[super init];
    return self;
}

-(TOS_POICategory*) initWithId: (int ) identifier andDescription: (NSString *) description andIsSystem:(bool ) isSystem {
    self=[super init];
    if (self) {
        Identifier=identifier;
        Description=description;
        IsSystem=isSystem;
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
- (void) setDescription: (NSString*) description {
    Description = description;
}

/**
 * get the is system status.
 *
 * @return the isSystem
 */
- (bool ) getIsSystem {
    return IsSystem;
}

/**
 * Sets the checks if is system.
 *
 * @param isSystem the isSystem to set
 */
- (void) setIsSystem: (bool) isSystem {
    IsSystem = isSystem;
}

@end
