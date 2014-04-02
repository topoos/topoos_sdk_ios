//
//  LoginTopoosController.h
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

#import <UIKit/UIKit.h>

@interface LoginTopoosController : UIViewController <UIWebViewDelegate,UITextViewDelegate>{
    
    
@protected NSMutableData  *data;
@protected NSInteger yalogin;
@protected UIView * activityView;
    
    
}
/** the constant for scope */
extern NSString * const  SCOPE_OFFLINE_ACCESS;
/** the constant for scope */
extern NSString * const  SCOPE_EMAIL;
/** the constant for scope */
extern NSString * const  SCOPE_PROFILE;


/**
 WebView for login
 */
@property (weak, nonatomic) IBOutlet UIWebView *WVLogin;

/**
 Set the app client id (required)
 */
- (void) setClient_id:(NSString *) client_id;
/**
 Set the app scope email (optional)
 */
- (void) setScope_Email:(Boolean) scope;
/**
 Set the app scope offline access (optional)
 */
- (void) setScope_Offline_Access:(Boolean) scope;
/**
 Set the app scope profile (optional)
 */
- (void) setScope_Profile:(Boolean) scope;
@end
