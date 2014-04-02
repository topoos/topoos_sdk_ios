//
//  TOS_ExportOps.h
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
#import "TOS_TrackResource.h"
#import "TOS_AccessTokenOAuth.h"

@interface TOS_ExportOps : NSObject

/**
 * Export track.
 *
 * @param trackID the track id
 * @param export_format the export_format
 * @param total the total
 * @param initDate the init date
 * @param endDate the end date
 * @param accessTokenPregenerated the access token pregenerated
 * @return the track resource
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_TrackResource *) ExportTrack: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                        andInitDate: (NSDate *) initDate andEndDate: (NSDate *) endDate
                         andTrackId: (int *) trackID andExportFormat: (NSString *) exportFormat andTotal: (int *) total;

/**
 * Export track.
 *
 * @param trackID the track id
 * @param export_format the export_format
 * @param total the total
 * @param initDate the init date
 * @param endDate the end date
 * @return the track resource
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_TrackResource *) ExportTrack: (NSDate *) initDate andEndDate: (NSDate *) endDate
                         andTrackId: (int *) trackID andExportFormat: (NSString *) exportFormat andTotal: (int *) total;


@end
