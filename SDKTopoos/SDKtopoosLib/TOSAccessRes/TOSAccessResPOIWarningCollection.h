//
//  TOSAccessResPOIWarningCollection.h
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

@interface TOSAccessResPOIWarningCollection : TOSAccessRes

/** The POI data warnings. */
@property (nonatomic,retain) NSMutableArray * POIDataWarnings;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the poi warning.
 * @return the poi warning
 */
- (NSMutableArray *) getPOIDataWarnings;

/**
 * Sets the poi warning.
 * @param poiw the poi warning to set
 */
- (void) setPOIDataWarnings: (NSMutableArray *) poidataw;

@end
