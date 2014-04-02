
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

@interface Constants : NSObject

#define TOPOOSURIPIC @"https://pic.topoos.com";
#define TOPOOSURIAPI @"https://api.topoos.com";
#define TOPOOSURILOGIN @"https://login.topoos.com";
#define TOPOOSURILOGINBACK @"https://login.topoos.com/oauth/authtoken";

//	#define TOPOOSURIPIC @"http://topoos2.cloudapp.net:9003";
//	#define TOPOOSURIAPI @"http://topoos2.cloudapp.net:9000";
//	#define TOPOOSURILOGIN @"http://topoos2.cloudapp.net:9001";

#define HTTP_WAITING_MILISECONDS  5000;
#define APIVERSION  1;
#define TOPOOS_DEBUG NO

#define TOPOOS_TOKEN_PREF @"topoos_token";
#define TOPOOS_TOKEN_EXPIRES @"topoos_token_expires";
#define TOPOOS_TOKEN_TYPE @"topoos_token_type";

/** the constant for TAG */
extern NSString * const  TAG;
/** the constant for SDKVERSION */
extern NSString * const SDKVERSION;
@end
