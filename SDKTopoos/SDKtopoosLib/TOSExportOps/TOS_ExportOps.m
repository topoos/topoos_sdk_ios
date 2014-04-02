//
//  TOS_ExportOps.m
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
#import "TOS_ExportOps.h"
#import "TOS_TrackResource.h"
#import "TOS_AccessTokenOAuth.h"
#import "TOSAccessOpExportLayerTrack.h"
#import "TOSAccessResTrackResource.h"
#import "TOSAccessCaller.h"

@implementation TOS_ExportOps


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
                         andTrackId: (int *) trackID andExportFormat: (NSString *) exportFormat andTotal: (int *) total
{
    TOS_TrackResource * trackResource = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpExportLayerTrack * exportLayerTrack = 
        [[TOSAccessOpExportLayerTrack alloc] initWithOperationName: @"Export_ExportTrack" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                    andOauth_token: accessTokenPregenerated.getAccessToken
                                                           andType: TOS_ACCESS_OP_TRACK_TYPE_LAYER
                                                           andData: TOS_ACCESS_OP_TRACK_DATA_TRACK
                                                   andExportFormat: exportFormat andTrack: trackID andTotal: total
                                                       andInitDate: initDate andEndDate: endDate ];
        
        
        // RESULTS
        TOSAccessResTrackResource * trackResult = [[TOSAccessResTrackResource alloc] init];
        [TOSAccessCaller ExecuteOperation: exportLayerTrack withResult:trackResult];
        trackResource = trackResult.getTrackResource;
    }
    else
    {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    
    return trackResource;
}


// .....................................................................................................................................
// NOTA ................................................................................................................................
// PARA EL SIGUIENTE MÉTODO HAY QUE RECOGER EL TOS_AccessTokenOAuth PORQUE NO VIENE POR PARÁMETRO Y SE ESTÁ PASANDO nil
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
                         andTrackId: (int *) trackID andExportFormat: (NSString *) exportFormat andTotal: (int *) total
{
    return [[self class] ExportTrack: nil andInitDate: initDate andEndDate: endDate
                          andTrackId: trackID andExportFormat: exportFormat andTotal: total];
}


@end
