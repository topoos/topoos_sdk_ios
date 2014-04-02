//
//  TOSAccessResCheckinCollection.h
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

#import "TOSAccessRes.h"
#import "TOS_CheckinCollection.h"

@interface TOSAccessResCheckinCollection : TOSAccessRes
//
//  TOSAccessResCheckinCollection.h
//  SDKtopoos
//
//  Created by Miguel Angel Jiménez Sánchez on 22/04/13.
//  Copyright (c) 2013 Miguel Angel Jiménez Sánchez. All rights reserved.
//



/** The checkin collection. */
@property (nonatomic,retain) TOS_CheckinCollection * CheckinCollection;


/**
 * Instantiates a new checkin collection result.
 */
-(TOSAccessResCheckinCollection *) init;

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResCheckinCollection *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param checkinCollection
 *            the checkin collection
 */
-(TOSAccessResCheckinCollection *) initWithError: (NSString*) error andResult: (id) result andPOICategoryCollection: (TOS_CheckinCollection *) checkinCollection;

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;


/**
 * Gets the checkin collection.
 *
 * @return the checkinCollection
 */
-(TOS_CheckinCollection *) getCheckinCollection ;
/**
 * Sets the checkin collection.
 *
 * @param checkinCollection
 *            the checkinCollection to set
 */
-(void) setCheckinCollection:(TOS_CheckinCollection*)checkinCollection ;
@end
