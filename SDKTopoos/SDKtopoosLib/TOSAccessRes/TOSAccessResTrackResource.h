//
//  TOSAccessResTrackResource.h
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
#import "TOS_TrackResource.h"

@interface TOSAccessResTrackResource : TOSAccessRes

/** The track resource. */
@property (nonatomic,retain) TOS_TrackResource * TrackResource;

/**
 * Instantiates a new track resource result.
 */
- (TOSAccessResTrackResource *) init;

/**
 * Instantiates a new track resource result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResTrackResource *) initWithError: (NSString*) error andResult: (NSString*) result;

/**
 * Instantiates a new track resource result.
 *
 * @param error the error
 * @param result the result
 * @param rule the rule
 */
- (TOSAccessResTrackResource *) initWithError: (NSString*) error andResult: (NSString*) result andRule: (TOS_TrackResource *) trackResource;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the track resource.
 * @return the TrackResource
 */
- (TOS_TrackResource *) getTrackResource;

/**
 * Sets the track resource.
 * @param trackResource the Track Resource to set
 */
- (void) setTrackResource: (TOS_TrackResource *) trackResource;


@end
