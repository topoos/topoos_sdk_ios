//
//  TOS_PositionsOps.h
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
#import "TOS_Position.h"
#import "TOS_AccessTokenOAuth.h"

@interface TOS_PositionsOps : NSObject

// Private
+ (TOS_Position *) AddPrivate: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                  andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                  andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                 andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
                      andType: (int) type;

// Public
+ (TOS_Position *) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated
           andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
           andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
          andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddAlarmEnd: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                   andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddAlarmInit: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                   andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddGPSNo: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                    andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                    andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                   andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddGPSOk: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                    andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                    andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                   andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddTrackEnd: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                    andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                    andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                   andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;

+ (TOS_Position *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated
              andPosId: (int *) posID;

+ (TOS_Position *) GetLastUser: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                     andUserID: (NSString *) userID;

+ (NSMutableArray *) GetBetweenDays: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                     andInitDate: (NSDate *) initDate andEndDate: (NSDate *) endDate;

// Los mismos métodos pero sin el AccessToken
+ (TOS_Position *) Add: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
           andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
          andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddAlarmEnd: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;

+ (TOS_Position *) AddAlarmInit: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                    andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                   andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;

+ (TOS_Position *) AddGPSNo: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
               andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddGPSOk: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
               andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;


+ (TOS_Position *) AddTrackEnd: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing;

+ (TOS_Position *) Get: (int *) posID;

+ (TOS_Position *) GetLastUser: (NSString *) userID;

+ (NSMutableArray *) GetBetweenDays: (NSDate *) initDate andEndDate: (NSDate *) endDate;
            
@end
