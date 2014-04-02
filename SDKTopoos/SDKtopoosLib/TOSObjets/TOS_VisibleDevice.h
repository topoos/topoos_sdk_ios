//
//  TOS_VisibleDevice.h
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

@interface TOS_VisibleDevice : NSObject


/** The Id. */
@property (nonatomic,readwrite) int Identifier;

/** The Name. */
@property (nonatomic,retain) NSString * Name;

/** The Model. */
@property (nonatomic,readwrite) int  Model;

/** The is logical. */
@property (nonatomic,readwrite) bool isLogical;

-(TOS_VisibleDevice *) init;

-(TOS_VisibleDevice *) initWithIdentifier: (int ) identifier andName: (NSString *) name andModel: (int ) model andIsLogical:(bool ) islogical;

/**
 * get the device id.
 *
 * @return the device id
 */
- (int ) getIdentifier ;

/**
 * Sets the id.
 *
 * @param id set the device¥s id
 */
- (void) setIdentifier:(int ) identifier;

/**
 * get the name of the device.
 *
 * @return the name
 * name of the device
 */
- (NSString *) getName ;

/**
 * Sets the name.
 *
 * @param name set the device¥s name
 */
- (void) setName:(NSString *) name ;
/**
 * get the model of the device.
 *
 * @return the model
 * model of the device
 */
- (int ) getModel ;

/**
 * Sets the model.
 *
 * @param model set device¥s model
 */
- (void) setModel: (int )  model ;

/**
 * get the type of the device true if it is logical.
 *
 * @return the checks if is logical
 * if is a logical device
 */
- (bool ) getIsLogical ;

/**
 * Sets the checks if is logical.
 *
 * @param isLogical set device¥s type
 */
- (void) setIsLogical:(bool ) islogical;



@end
