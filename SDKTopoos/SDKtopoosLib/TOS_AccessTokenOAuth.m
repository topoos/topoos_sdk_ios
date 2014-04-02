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

#import "TOS_AccessTokenOAuth.h"
#import "Constants.h"

@implementation TOS_AccessTokenOAuth


-(TOS_AccessTokenOAuth*) init{
    self=[super init];
    return self;
}


/**
 * set the token without expires time
 * @param token
 */
-(TOS_AccessTokenOAuth*) initWithAccessToken: (NSString*) accessToken{
    self=[super init];
    if(self){
        AccessToken= accessToken;
    }
    return self;
}

/**
 * set the token with the parameters that received
 * @param token
 * @param expiresIn
 */
-(TOS_AccessTokenOAuth*) initWithAccessToken: (NSString*) accessToken andExpiresIn: (int ) expiresIn{
    self=[super init];
    if(self){
        AccessToken= accessToken;
        ExpiresIn=expiresIn;
    }
    return self;
}


/**
 * get the time that token expires
 * @return the expiresIn
 */
- (int ) getExpiresIn {
    return ExpiresIn;
}


/** set the expires time of the token acces
 * @param expiresIn the expiresIn to set
 */
- (void) setExpiresIn:(int) expiresIn {
    ExpiresIn = expiresIn;
}


/** get the access token
 * @return the accessToken
 */
- (NSString *) getAccessToken {
    return AccessToken;
}


/**
 * set the access token that received as parameter
 * @param accessToken the accessToken to set
 */
- (void) setAccessToken:(NSString*) accessToken {
    AccessToken = accessToken;
}

/**
 * save the token
 * @param context
 */
- (void) save_Token {
    [[NSUserDefaults standardUserDefaults] setObject:AccessToken forKey:@"topoos_token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", ExpiresIn] forKey:@"topoos_token_expires"];
    [[NSUserDefaults standardUserDefaults] synchronize];
 }

/**
 * load the Token that recieved as parameter
 * @param context
 */
 -(void) load_Token {
     AccessToken=[[NSUserDefaults standardUserDefaults] objectForKey:@"topoos_token"];
     NSString* expirate_in=[[NSUserDefaults standardUserDefaults] objectForKey:@"topoos_token_expires"];
     ExpiresIn = [expirate_in intValue];
     //Token_type=[[NSUserDefaults standardUserDefaults] objectForKey:@"topoos_token_type"];
     if(TOPOOS_DEBUG){
         NSLog(@"SDKTOPOOS: %@",AccessToken);
     }
 }
/**
 * delete the token that has been saved previously
 * @param context
 */
- (void) delete_Token{
    AccessToken=nil;
    ExpiresIn=-1;
 }
/**
 * check if the token is valid, it has not expired
 * @return boolean
 */
- (bool) isValid{
    bool isvalid=true;
    //Solo compruebo si es valido el string es necesario comprobar si ha expirado
    isvalid=isvalid&&(AccessToken!=nil &&![AccessToken isEqualToString:@""]);
    if(TOPOOS_DEBUG){
        NSLog(@"SDKTOPOOS: isValid %d",isvalid);
    }
 return isvalid;
 }



/**
 * get the access token that is previously saved
 * @param context
 * @return AccessTokenOAuth
 */
+ (TOS_AccessTokenOAuth *) GetAccessToken {
    TOS_AccessTokenOAuth * access=[[TOS_AccessTokenOAuth alloc] init];
    [access load_Token];
    if(TOPOOS_DEBUG){
        NSLog(@"SDKTOPOOS: token %@",[access getAccessToken]);
    }
 return access;
 }

/**
 * delete the access token
 * @param context
 */
- (void) DeleteAccessToken{
    TOS_AccessTokenOAuth * access=[TOS_AccessTokenOAuth GetAccessToken];
    [access delete_Token];
    [access save_Token];
 }

/**
 * convert to string the Access Token
 * @return
 */
-(NSString *) toStringToken{
  return [[NSString alloc] initWithFormat: @"Token:  %@ Expires in: %d",AccessToken,ExpiresIn ];
 }
@end
