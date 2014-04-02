//
//  TOSAccessCaller.m
//  SDKtopoos
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

#import "TOSAccessCaller.h"

@implementation TOSAccessCaller
/**
 * Returns the url for the object operation.
 *
 * @param operation
 * @return URL
 */
+ (NSString *) GetUriAPIOperation: (TOSAccessOp *) operation
{
    NSString * uri=TOPOOSURIAPI;
    uri=[uri stringByAppendingString: operation.ConcatParams];
    return  uri;
}

/**
 * Returns the url for topoos api service
 *
 * @return URL
 */
+ (NSString *) GetURLAPItopoos
{
    NSString * uri=TOPOOSURIAPI;
    return  uri;
}

/**
 * Returns the url for topoos pic service
 *
 * @return String
 */
+ (NSString *) GetURLPICAPItopoos
{
    NSString * uri=TOPOOSURIPIC;
    return  uri;
}

/**
 * Initiates an operation on topoos API.
 *
 * @param operation
 *            Represents the operation to be executed
 * @param result
 *            Represents a result returned from a query to API topoos
 * @throws IOException
 * @throws TopoosException
 */
+ (void) ExecuteOperation: (TOSAccessOp*) operation withResult: (TOSAccessRes*) result
{
    
    NSURLResponse* response = nil;
    NSString * urlRequestStr= [self GetUriAPIOperation:operation];
    NSLog(@"URL: %@", urlRequestStr);
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:urlRequestStr]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    NSData* data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"RESULT: %@", jsonString);
    [result setResult:jsonString];
    [result setParameters];
    
   /* HttpClient hc = new DefaultHttpClient();
    if (!operation.ValidateParams())
        throw new TopoosException(TopoosException.NOT_VALID_PARAMS);
    String OpURI = Constants.TOPOOSURIAPI + operation.ConcatParams();
    if (Constants.DEBUGURL) {
        Log.d(Constants.TAG, OpURI);
        //			appendLog(OpURI);
    }
    HttpPost post = new HttpPost(OpURI);
    // POST
    if (operation.getMethod().equals("POST")) {
        post.setEntity(operation.BodyParams());
    }
    HttpResponse rp = hc.execute(post);
    HttpParams httpParams = hc.getParams();
    HttpConnectionParams.setConnectionTimeout(httpParams,
                                              Constants.HTTP_WAITING_MILISECONDS);
    HttpConnectionParams.setSoTimeout(httpParams,
                                      Constants.HTTP_WAITING_MILISECONDS);
    if (rp.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
        result.setResult(EntityUtils.toString(rp.getEntity()));
        if (Constants.DEBUGURL) {
            Log.d(Constants.TAG, result.getResult());
            //				appendLog(result.getResult());
        }
        result.setError(null);
        result.setParameters();
    } else {
        switch (rp.getStatusLine().getStatusCode()) {
			case 400:
				throw new TopoosException(TopoosException.ERROR400);
			case 405:
				throw new TopoosException(TopoosException.ERROR405);
			default:
				throw new TopoosException("Error: "
                                          + rp.getStatusLine().getStatusCode() + "");
        }
        
    }*/
}

@end
