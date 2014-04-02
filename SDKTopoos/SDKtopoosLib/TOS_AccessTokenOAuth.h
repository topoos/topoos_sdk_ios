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

@interface TOS_AccessTokenOAuth : NSObject{
    // Atributo de tipo entero
    NSString* AccessToken;
    int ExpiresIn;
}



-(TOS_AccessTokenOAuth*) init;


/**
 * set the token without expires time
 * @param token
 */
-(TOS_AccessTokenOAuth*) initWithAccessToken: (NSString*) accessToken;

/**
 * set the token with the parameters that received
 * @param token
 * @param expiresIn
 */
-(TOS_AccessTokenOAuth*) initWithAccessToken: (NSString*) accessToken andExpiresIn: (int ) expiresIn;


/**
 * get the time that token expires
 * @return the expiresIn
 */
- (int ) getExpiresIn;


/** set the expires time of the token acces
 * @param expiresIn the expiresIn to set
 */
- (void) setExpiresIn:(int) expiresIn ;


/** get the access token
 * @return the accessToken
 */
- (NSString *) getAccessToken;

/**
 * set the access token that received as parameter
 * @param accessToken the accessToken to set
 */
- (void) setAccessToken:(NSString*) accessToken ;

/**
 * save the token
 * @param context
 */
- (void) save_Token;
/**
 * load the Token that recieved as parameter
 * @param context
 */
-(void) load_Token;
/**
 * delete the token that has been saved previously
 * @param context
 */
- (void) delete_Token;
/**
 * check if the token is valid, it has not expired
 * @return boolean
 */
- (bool) isValid;



/**
 * get the access token that is previously saved
 * @param context
 * @return AccessTokenOAuth
 */
+ (TOS_AccessTokenOAuth *) GetAccessToken;

/**
 * delete the access token
 * @param context
 */
- (void) DeleteAccessToken;

/**
 * convert to string the Access Token
 * @return
 */
-(NSString *) toStringToken;

@end
