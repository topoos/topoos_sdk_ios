//
//  LoginTopoosController.m
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
#import "LoginTopoosController.h"
#import "Constants.h"
#import "UrlParser.h"

@implementation LoginTopoosController

@synthesize WVLogin;


NSString * const SCOPE_OFFLINE_ACCESS=@"offline_access";
NSString * const SCOPE_EMAIL=@"email";
NSString * const SCOPE_PROFILE=@"profile";


NSString * app_client_id=nil;
NSString * app_scope=nil;
Boolean scope_email=false;
Boolean scope_profile=false;
Boolean scope_offline_access=false;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(self.navigationItem!=nil){
    self.navigationItem.title = @"Topoos Login";//NSLocalizedString(@"tituloPantallaInicial", @"");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:YES];
    
    if(app_client_id!=nil){
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    NSString * params = TOPOOSURILOGIN;

    params = [params stringByAppendingString: @"/oauth/authtoken?response_type=token&agent=mobile&client_id="];
    NSString *value_client_id=app_client_id;
    params = [params stringByAppendingString: value_client_id];
    /*if(app_scope!=nil){
        params = [params stringByAppendingString: @"&scope="];
        params = [params stringByAppendingString:app_scope];
    }*/
        NSString* scopes=@"";
    if(scope_email){
        scopes=[scopes stringByAppendingString:@"&scope="];
        scopes=[scopes stringByAppendingString:SCOPE_EMAIL];
    }
        if(scope_offline_access){
            if([scopes isEqualToString:@""]){
                scopes=[scopes stringByAppendingString:@"&scope="];
                scopes=[scopes stringByAppendingString:SCOPE_OFFLINE_ACCESS];
            }else{
                scopes=[scopes stringByAppendingString:@","];
                scopes=[scopes stringByAppendingString:SCOPE_OFFLINE_ACCESS];
            }
        }
        if(scope_profile){
            if([scopes isEqualToString:@""]){
                scopes=[scopes stringByAppendingString:@"&scope="];
                scopes=[scopes stringByAppendingString:SCOPE_PROFILE];
            }else{
                scopes=[scopes stringByAppendingString:@","];
                scopes=[scopes stringByAppendingString:SCOPE_PROFILE];
            }
        }
        params=[params stringByAppendingString:scopes];
    NSString* value_redirect_uri=TOPOOSURILOGIN;
    value_redirect_uri = [value_redirect_uri stringByAppendingString: @"/oauth/dummy"];
    value_redirect_uri= [value_redirect_uri stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    params = [params stringByAppendingString: @"&redirect_uri="];
    params = [params stringByAppendingString: value_redirect_uri];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:params]];
    if(TOPOOS_DEBUG){
        NSLog(@"params: %@",params);
    }
    WVLogin.scalesPageToFit = YES;
    WVLogin.delegate=self;
    //Load the request in the UIWebView.
    [WVLogin loadRequest:requestObj];
    }else{
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                      reason:[NSString stringWithFormat:@"In %@: Client_id Not Valid", NSStringFromSelector(_cmd)]
                                      userInfo:nil];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    NSDictionary* userInfo = [notification userInfo];
    
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    
    
    [UIView commitAnimations];
}

-(void)showActivityViewer
{
    activityView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.WVLogin.bounds.size.width, self.view.bounds.size.height)];
    activityView.backgroundColor = [UIColor blackColor];
    activityView.alpha = 0.5;
    
    UIActivityIndicatorView *activityWheel = [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(self.view.bounds.size.width / 2 - 12, self.view.bounds.size.height / 2 - 12, 24, 24)];
    activityWheel.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    activityWheel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                      UIViewAutoresizingFlexibleRightMargin |
                                      UIViewAutoresizingFlexibleTopMargin |
                                      UIViewAutoresizingFlexibleBottomMargin);
    [activityView addSubview:activityWheel];
    [self.view addSubview: activityView];
    
    [[[activityView subviews] objectAtIndex:0] startAnimating];
}


-(void)hideActivityViewer
{
    [[[activityView subviews] objectAtIndex:0] stopAnimating];
    [activityView removeFromSuperview];
    activityView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIWebView delegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showActivityViewer];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideActivityViewer];
    
}



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *file = [request URL];
    NSString *cadena= [file absoluteString];
    NSLog(@"current notification is %@",cadena);
    if(![cadena isEqualToString:@"about:blank"] &&  (![cadena isEqualToString:@"https://login.topoos.com/"] || ([cadena isEqualToString:@"https://login.topoos.com/"]))){
        
        

        UrlParser *parser = [[UrlParser alloc] initWithURLString:cadena];
        NSString *token = [parser valueForVariable:@"access_token"];
        NSString *token_type =[parser valueForVariable:@"token_type"];
        NSString * expires_in=[parser valueForVariable:@"expires_in"];
        if(TOPOOS_DEBUG){
            NSLog(@"token: %@",token);
            NSLog(@"expires_in: %@",expires_in);
            NSLog(@"token_type: %@",token_type);
        }
        if(token!=nil){
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"topoos_token"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        if(expires_in!=nil){
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"topoos_token_expires"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        if(token_type!=nil){
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"topoos_token_type"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        if(token!=nil && expires_in!=nil && token_type!=nil){
          [self dismissViewControllerAnimated:YES completion:nil];          
        }

        
 /*       if(token!=nil){
            //Loggg
            NSNumber *idDevice = [[NSNumber alloc] initWithInt:[[parser valueForVariable:@"idDevice"] integerValue]];
            NSLog(@"idDevice %@",idDevice);
            NSString *nameUser = [[NSString alloc] initWithString:[parser valueForVariable:@"nameUsuario"]];
            NSLog(@"idDevice %@",idDevice);
            NSString *userid = [[NSString alloc] initWithString:[parser valueForVariable:@"userid"]];
            [self dismissViewControllerAnimated:YES completion:nil];
            
 
            yalogin=NO;;
            if(appDelegate.password ==nil || [self IsEmpty:appDelegate.password]){
                setPassViewController  *savePass = [[setPassViewController alloc] initWithNibName:@"setPassViewController" bundle:nil];
                [[self navigationController] pushViewController:savePass animated:YES];

            }else{
                IntroducirContrasenaController  *inPass = [[IntroducirContrasenaController alloc] initWithNibName:@"IntroducirContrasenaController" bundle:nil];
                [[self navigationController] pushViewController:inPass animated:YES];
                
            }
        }*/
        
        NSString *tipoerror = [parser valueForVariable:@"error"];
        NSString *msgError = [parser valueForVariable:@"error_description"];
        //[parser release];
        if(tipoerror!=nil && msgError!=nil){
            return NO;
        }
    }else{
        return NO;
        
    }
    
	return YES;
}



- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><font size=+5 color='red'>%@<br>%@</font></center></html>",
							 NSLocalizedString(@"TituloErrorWeb", @""),NSLocalizedString(@"DescripcionErrorweb", @"")];
	[WVLogin loadHTMLString:errorString baseURL:nil];
}

-(BOOL)IsEmpty:(id )thing {
    return thing == nil
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}
/*
- (void)parser:(ReachabilityParser *)parser respondToChange:(BOOL)Conexion{
    if([parserReachability HayConex]){
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:URL_LOGIN, URL_SW]]];
        wvAuth.scalesPageToFit = YES;
        wvAuth.delegate=self;
        //Load the request in the UIWebView.
        [wvAuth loadRequest:requestObj];
    }
}*/


//<Sumary>
// Evento llamado al pulsar el boton de refrasco del navigationController
//</Sumary>
- (void) refresh: (id) sender{
     /*   NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:URL_LOGIN, URL_SW]]];
        WVLogin.scalesPageToFit = YES;
        WVLogin.delegate=self;
        //Load the request in the UIWebView.
        [WVLogin loadRequest:requestObj];*/
}

/**
 Set the app client id (required)
 */
- (void) setClient_id:(NSString *) client_id{
    //NSLog(@"client_id: %@",client_id);
    app_client_id=client_id;
}
/**
 Set the app scope (optional)
 
- (void) setScope:(NSString *)scope{
    NSLog(@"scope: %@",scope);
    app_scope=scope;
}*/
/**
 Set the app scope email (optional)
 */
- (void) setScope_Email:(Boolean) scope{
    scope_email=scope;
}
/**
 Set the app scope offline access (optional)
 */
- (void) setScope_Offline_Access:(Boolean) scope{
    scope_offline_access=scope;
}
/**
 Set the app scope profile (optional)
 */
- (void) setScope_Profile:(Boolean) scope{
    scope_profile=scope;
}

@end
