//
//  TOS_ImagesOps.m
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

#import "TOS_ImagesOps.h"
#import "Constants.h"
#import "TOSAccessOpImageUpload.h"
#import "TOSAccessResImage.h"

@implementation TOS_ImagesOps


/** The Constant SIZE_XXXSMALL. */
int const SIZE_XXXSMALL_ =0;
/** The Constant SIZE_XXSMALL. */
 int  const SIZE_XXSMALL_ =1;
/** The Constant SIZE_XSMALL. */
 int const SIZE_XSMALL_ =2;
/** The Constant SIZE_SMALL. */
 int const SIZE_SMALL_ =3;
/** The Constant SIZE_LARGE. */
 int const SIZE_LARGE_ =4;
/** The Constant SIZE_XLARGE. */
 int const SIZE_XLARGE_ =5;
/** The Constant SIZE_XXLARGE. */
 int const SIZE_XXLARGE_ =6;
/** The Constant SIZE_XXXLARGE. */
 int const SIZE_XXXLARGE_ =7;

NSString* methodImage= @"POST";
NSString* formatImage = @"json";
int versionImage = 1;

/**
 * Image upload.
 *
 * @param file the file
 * @param filename the filename
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Image *) ImageUpload: (TOS_AccessTokenOAuth* ) accessTokenPregenerated andFile:(NSData *) file andFilename:(NSString*) filename {
    TOS_Image * image=nil;
    
    if([accessTokenPregenerated isValid]){
        TOSAccessOpImageUpload *op=[[TOSAccessOpImageUpload alloc] initWithOperationName:@"ImageUpload" andMethod:methodImage andFormat:formatImage andVersion:&versionImage andOauth_token:[accessTokenPregenerated getAccessToken] andFile:file andFilename:filename];
        
        TOSAccessResImage *res=[[TOSAccessResImage alloc]init];
        if([op ValidateParams]){
            NSString *urlString = @"https://pic.topoos.com";
            urlString = [urlString stringByAppendingString:[op ConcatParams]];
            
            
            //
            NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
            //[_params setObject:@"1.0" forKey:@"ver"];
            [_params setObject:filename forKey:@"filename"];
            [_params setObject:[accessTokenPregenerated getAccessToken] forKey:@"oauth_token"];
            //[_params setObject:[NSString stringWithFormat:@"%d", userId] forKey:[NSString stringWithString:@"userId"]];
            //[_params setObject:[NSString stringWithFormat:@"%@",title] forKey:[NSString stringWithString:@"title"]];
            
            // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
            NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
            
            // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
            NSString* FileParamConstant = @"file";
            
            // the server url to which the image (or the media) is uploaded. Use your server url here
            NSURL* requestURL = [NSURL URLWithString:urlString];
            
            // create request
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
            [request setHTTPShouldHandleCookies:NO];
            [request setTimeoutInterval:30];
            [request setHTTPMethod:@"POST"];
            
            // set Content-Type in HTTP header
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
            [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
            
            // post body
            NSMutableData *body = [NSMutableData data];
            
            // add params (all params are strings)
            for (NSString *param in _params) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            // add image data
            NSData *imageData = file;//UIImageJPEGRepresentation(imageToPost, 1.0);
            if (imageData) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", FileParamConstant,filename] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:imageData];
                [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            
            // setting the body of the post to the reqeust
            [request setHTTPBody:body];
            
            // set the content-length
            NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            
            // set URL
            [request setURL:requestURL];
            NSLog(@"%@", urlString);
            
            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", returnString);
            [res setResult:returnString];
            [res setParameters];
            image= [res getImage];
            
        }else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
        }
    }
    return image;
}



/**
 * Image upload position.
 *
 * @param file the file
 * @param filename the filename
 * @param pos_id the pos_id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Image *) ImageUploadPosition: (TOS_AccessTokenOAuth* ) accessTokenPregenerated  andFile:(NSData *) file andFilename:(NSString*) filename andPosition_id: (int *) position_id {
    TOS_Image * image=nil;
    
    if([accessTokenPregenerated isValid]){
        TOSAccessOpImageUpload *op=[[TOSAccessOpImageUpload alloc] initWithOperationName:@"ImageUploadPosition" andMethod:methodImage andFormat:formatImage andVersion:&versionImage andOauth_token:[accessTokenPregenerated getAccessToken] andFile:file andFilename:filename andIdentifier:position_id andType:TYPE_POS];
        
        TOSAccessResImage *res=[[TOSAccessResImage alloc]init];
        if([op ValidateParams]){
            NSString *urlString = @"https://pic.topoos.com";
            urlString = [urlString stringByAppendingString:[op ConcatParams]];
            
            
            //
            NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
            //[_params setObject:@"1.0" forKey:@"ver"];
            [_params setObject:filename forKey:@"filename"];
            [_params setObject:[accessTokenPregenerated getAccessToken] forKey:@"oauth_token"];
            [_params setObject:[NSString stringWithFormat:@"%d", *position_id] forKey:@"pos_id"];
            //[_params setObject:[NSString stringWithFormat:@"%@",title] forKey:[NSString stringWithString:@"title"]];
            
            // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
            NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
            
            // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
            NSString* FileParamConstant = @"file";
            
            // the server url to which the image (or the media) is uploaded. Use your server url here
            NSURL* requestURL = [NSURL URLWithString:urlString];
            
            // create request
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
            [request setHTTPShouldHandleCookies:NO];
            [request setTimeoutInterval:30];
            [request setHTTPMethod:@"POST"];
            
            // set Content-Type in HTTP header
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
            [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
            
            // post body
            NSMutableData *body = [NSMutableData data];
            
            // add params (all params are strings)
            for (NSString *param in _params) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            // add image data
            NSData *imageData = file;//UIImageJPEGRepresentation(imageToPost, 1.0);
            if (imageData) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", FileParamConstant,filename] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:imageData];
                [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            
            // setting the body of the post to the reqeust
            [request setHTTPBody:body];
            
            // set the content-length
            NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            
            // set URL
            [request setURL:requestURL];
            NSLog(@"%@", urlString);
            
            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", returnString);
            [res setResult:returnString];
            [res setParameters];
            image= [res getImage];
            
            
            
        }else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
        }
    }
    return image;
}

/**
 * Image upload poi.
 *
 * @param file the file
 * @param filename the filename
 * @param poi_id the poi_id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */

+(TOS_Image *) ImageUploadPOI: (TOS_AccessTokenOAuth* ) accessTokenPregenerated  andFile:(NSData *) file andFilename:(NSString*) filename andPoi_id: (int *) poi_id {
    TOS_Image * image=nil;
    
    if([accessTokenPregenerated isValid]){
        TOSAccessOpImageUpload *op=[[TOSAccessOpImageUpload alloc] initWithOperationName:@"ImageUpload" andMethod:methodImage andFormat:formatImage andVersion:&versionImage andOauth_token:[accessTokenPregenerated getAccessToken] andFile:file andFilename:filename andIdentifier:poi_id andType:TYPE_POS];
        
        TOSAccessResImage *res=[[TOSAccessResImage alloc]init];
        if([op ValidateParams]){
            
            NSString *urlString = @"https://pic.topoos.com";
            urlString = [urlString stringByAppendingString:[op ConcatParams]];
            
            
            //
            NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
            //[_params setObject:@"1.0" forKey:@"ver"];
            [_params setObject:filename forKey:@"filename"];
            [_params setObject:[accessTokenPregenerated getAccessToken] forKey:@"oauth_token"];
            [_params setObject:[NSString stringWithFormat:@"%d", *poi_id] forKey:@"poi_id"];
            //[_params setObject:[NSString stringWithFormat:@"%@",title] forKey:[NSString stringWithString:@"title"]];
            
            // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
            NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
            
            // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
            NSString* FileParamConstant = @"file";
            
            // the server url to which the image (or the media) is uploaded. Use your server url here
            NSURL* requestURL = [NSURL URLWithString:urlString];
            
            // create request
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
            [request setHTTPShouldHandleCookies:NO];
            [request setTimeoutInterval:30];
            [request setHTTPMethod:@"POST"];
            
            // set Content-Type in HTTP header
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
            [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
            
            // post body
            NSMutableData *body = [NSMutableData data];
            
            // add params (all params are strings)
            for (NSString *param in _params) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            // add image data
            NSData *imageData = file;//UIImageJPEGRepresentation(imageToPost, 1.0);
            if (imageData) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", FileParamConstant,filename] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:imageData];
                [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            
            // setting the body of the post to the reqeust
            [request setHTTPBody:body];
            
            // set the content-length
            NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            
            // set URL
            [request setURL:requestURL];
            NSLog(@"%@", urlString);
            
            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", returnString);
            [res setResult:returnString];
            [res setParameters];
            image= [res getImage];

        }else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
        }
    }
    return image;
}

/**
 * Image upload new poi.
 *
 * @param file the file
 * @param filename the filename
 * @param lat the lat
 * @param lng the lng
 * @param name the name
 * @param description the description
 * @param elevation the elevation
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param address the address
 * @param cross_street the cross_street
 * @param city the city
 * @param country the country
 * @param postal_code the postal_code
 * @param phone the phone
 * @param twitter the twitter
 * @param categories the categories
 * @param accessTokenPregenerated the access token pregenerated
 * @return the image
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Image *) ImageUploadNew_POI: (TOS_AccessTokenOAuth* ) accessTokenPregenerated  andFile:(NSData *) file andFilename:(NSString*) filename
                           andLat: (float*) lat andLng: (float*) lng andAccuracy: (float*) accuracy andVaccuracy: (float*) vaccuracy andElevation: (float*) elevation
                    andCategories: (NSMutableArray *) categories andName: (NSString *) name andDesc: (NSString *) desc andAddress: (NSString *) address andCross_street: (NSString *) cross_street
                          andCity: (NSString *) city andCountry: (NSString *) country andPostal_code: (NSString *) postal_code andPhone: (NSString *) phone andTwitter: (NSString *) twitter {
    TOS_Image * image=nil ;
    
    if([accessTokenPregenerated isValid]){
        NSString * str_categories = @"";
        for(int i=0;i<[categories count];i++){
            if(i<[categories count]-1){
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:i] stringValue]];
                str_categories = [str_categories stringByAppendingString:@","];
            }
            else{
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:[categories count]-1] stringValue]];
            }
        }
        TOSAccessOpImageUpload *op=[[TOSAccessOpImageUpload alloc] initWithOperationName:@"ImageUpload" andMethod:methodImage andFormat:formatImage andVersion:&versionImage andOauth_token:[accessTokenPregenerated getAccessToken] andFile:file andFilename:filename andLat:lat andLng:lng andAccuracy:accuracy andVaccuracy:vaccuracy andElevation:elevation andCategories:str_categories andName:name andDesc:desc andAddress:address andCross_street:cross_street andCity:city andCountry:country andPostal_code:postal_code andPhone:phone andTwitter:twitter];
        
        TOSAccessResImage * res=[[TOSAccessResImage alloc]init];
        if([op ValidateParams]){
            
            NSString *urlString = @"https://pic.topoos.com";
            urlString = [urlString stringByAppendingString:[op ConcatParams]];
            
            
            //
            NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
            //[_params setObject:@"1.0" forKey:@"ver"];
            [_params setObject:filename forKey:@"filename"];
            [_params setObject:[accessTokenPregenerated getAccessToken] forKey:@"oauth_token"];
            [_params setObject:[NSString stringWithFormat:@"%f", *lat] forKey:@"lat"];
            [_params setObject:[NSString stringWithFormat:@"%f", *lng] forKey:@"lng"];
            if (name!=nil) {
                [_params setObject:name forKey:@"name"];
            }
            if(desc!=nil){
                 [_params setObject:desc forKey:@"description"];               
            }
            if(elevation!=nil){
                [_params setObject:[NSString stringWithFormat:@"%f", *elevation] forKey:@"Elevation"];            
            }
            if(accuracy!=nil){
                [_params setObject:[NSString stringWithFormat:@"%f", *accuracy] forKey:@"Accuracy"];             
            }
            if(vaccuracy!=nil){
                [_params setObject:[NSString stringWithFormat:@"%f", *vaccuracy] forKey:@"Vaccuracy"];
            }
            if(address!=nil){
                [_params setObject:address forKey:@"Address"];
            }
            if (categories!=nil) {
                
                [_params setObject:str_categories forKey:@"categories"];
            }

            if (cross_street!=nil) {
                [_params setObject:cross_street forKey:@"Cross_street"];
            }
            if (city!=nil) {
                [_params setObject:city forKey:@"City"];
            }
            if(country!=nil){
                [_params setObject:country forKey:@"Country"]; 
            }
            if(postal_code!=nil){
                [_params setObject:postal_code forKey:@"Postal_code"];
            }
            if (twitter!=nil) {
                [_params setObject:twitter forKey:@"twitter"];
            }
            //[_params setObject:[NSString stringWithFormat:@"%@",title] forKey:[NSString stringWithString:@"title"]];
            
            // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
            NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
            
            // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
            NSString* FileParamConstant = @"file";
            
            // the server url to which the image (or the media) is uploaded. Use your server url here
            NSURL* requestURL = [NSURL URLWithString:urlString];
            
            // create request
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
            [request setHTTPShouldHandleCookies:NO];
            [request setTimeoutInterval:30];
            [request setHTTPMethod:@"POST"];
            
            // set Content-Type in HTTP header
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
            [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
            
            // post body
            NSMutableData *body = [NSMutableData data];
            
            // add params (all params are strings)
            for (NSString *param in _params) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            // add image data
            NSData *imageData = file;//UIImageJPEGRepresentation(imageToPost, 1.0);
            if (imageData) {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", FileParamConstant,filename] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:imageData];
                [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            
            // setting the body of the post to the reqeust
            [request setHTTPBody:body];
            
            // set the content-length
            NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            
            // set URL
            [request setURL:requestURL];
            NSLog(@"%@", urlString);
            
            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", returnString);
            [res setResult:returnString];
            [res setParameters];
            image= [res getImage];

        }else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
        }
    }
    return image;
}


/**
 * Gets the image uri.
 *
 * @param filename_unique the filename_unique
 * @return the string
 */


+(NSString *) GetImageURI:(NSString *) filename_unique {
    NSString *urlString = @"https://pic.topoos.com";
    urlString = [urlString stringByAppendingString:@"/"];
    urlString = [urlString stringByAppendingString:[filename_unique stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    return urlString;
}

/**
 * Gets the image uri thumb.
 *
 * @param filename_unique the filename_unique
 * @param size the size
 * @return the string
 */
+ (NSString *)  GetImageURIThumb: (NSString *) filename_unique  andSize:(int ) size {
    NSString * strsize = @"small";
    switch (size) {
		case SIZE_LARGE_:
			strsize = @"large";
			break;
		case SIZE_SMALL_:
			strsize = @"small";
			break;
		case SIZE_XLARGE_:
			strsize = @"x-large";
			break;
		case SIZE_XSMALL_:
			strsize = @"x-small";
			break;
		case SIZE_XXLARGE_:
			strsize = @"xx-large";
			break;
		case SIZE_XXSMALL_:
			strsize = @"xx-small";
			break;
		case SIZE_XXXLARGE_:
			strsize = @"xxx-large";
			break;
		case SIZE_XXXSMALL_:
			strsize = @"xxx-small";
			break;
		default:
			break;
    }
    NSString *urlString = @"https://pic.topoos.com";
    urlString = [urlString stringByAppendingString:@"/thumb/"];
    urlString = [urlString stringByAppendingString:[filename_unique stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    urlString = [urlString stringByAppendingString:@"?size="];
    urlString = [urlString stringByAppendingString:[strsize stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    return urlString;
}






@end
