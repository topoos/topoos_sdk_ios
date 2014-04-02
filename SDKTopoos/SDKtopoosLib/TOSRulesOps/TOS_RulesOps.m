//
//  TOS_RulesOps.m
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
#import "TOS_RulesOps.h"
#import "TOSAccessOpRulesAdd.h"
#import "TOSAccessResRules.h"
#import "TOSAccessCaller.h"

@implementation TOS_RulesOps

/**
 * Adds the track out of bounds.
 *
 * @param accessTokenPregenerated the access token pregenerated
 * @param track the track
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @return the rule
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Rule *) AddTrackOutOfBounds: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                        andTrackId: (int *) trackID andLatitude: (float *) lat andLongitude: (float *) lng andRadius: (int *) radius
{
    TOS_Rule * rule = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpRulesAdd * rulesAdd =
        [[TOSAccessOpRulesAdd alloc] initWithOperationName: @"Rule_Add" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                andOauth_token: accessTokenPregenerated.getAccessToken
                                                    andLat: lat andLng: lng andRadius: radius
                                                   andType: TOS_ACCESS_OP_RULES_TYPE_TRACK_OUT_OF_BOUNDS
                                                  andTrack: trackID];
       
        // RESULTS
        TOSAccessResRules * ruleResult = [[TOSAccessResRules alloc] init];
        [TOSAccessCaller ExecuteOperation:rulesAdd withResult:ruleResult];
        rule = ruleResult.getRule;
        
    }
    else {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    
    return rule;
}


// .....................................................................................................................................
// NOTA ................................................................................................................................
// PARA EL SIGUIENTE MÉTODO HAY QUE RECOGER EL TOS_AccessTokenOAuth PORQUE NO VIENE POR PARÁMETRO Y SE ESTÁ PASANDO nil
+ (TOS_Rule *) AddTrackOutOfBounds: (int *) trackID andLatitude: (float *) lat andLongitude: (float *) lng andRadius: (int *) radius
{
    return [[self class] AddTrackOutOfBounds: nil andTrackId: trackID andLatitude: lat andLongitude: lng andRadius: radius];
}


@end
