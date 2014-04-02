//
//  TOS_TrackResource.m
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
#import "TOS_TrackResource.h"

@implementation TOS_TrackResource

@synthesize Identifier, Type, Format ;

/**
 * Instantiates a new track resource.
 *
 * @param id the id
 * @param type the type
 * @param format the format
 */
-(TOS_TrackResource*) init
{
    self=[super init];
    return self;
}

-(TOS_TrackResource*) initWithId: (int ) identifier andType: (NSString *) type andFormat: (NSString *) format
{
    self=[super init];
    Identifier=identifier;
    Type=type;
    Format=format;
    return self;
}


/**
 * get the id.
 * @return the id
 */
- (int ) getIdentifier
{
    return Identifier;
}

/**
 * Sets the id.
 * @param id the id to set
 */
- (void) setIdentifier: (int ) identifier
{
    Identifier = identifier;
}

/**
 * get the type.
 * @return the type
 */
- (NSString *) getType
{
    return Type;
}

/**
 * Sets the type.
 * @param type the type to set
 */
- (void) setType: (NSString *) type
{
    Type = type;
}

/**
 * get the format.
 * @return the format
 */
- (NSString *) getFormat
{
    return Format;
}

/**
 * Sets the format.
 * @param format the format to set
 */
- (void) setFormat: (NSString *) format
{
    Format = format;
}

@end
