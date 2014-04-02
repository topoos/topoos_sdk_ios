//
//  TOSAccessOp.m
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

#import "TOSAccessOp.h"

@implementation TOSAccessOp
/**
 * Instantiates a new aPI operation.
 *
 * @param operationName name of the operation
 * @param method name of the method
 * @param format format
 * @param version version
 */
@synthesize Version, Method, Format,OperationName;

- (TOSAccessOp *)init{
    self=[super init];
    if(self){
        int num = -1;
        Version= &num;
        
    }
    return self;
}
    
- (TOSAccessOp *)initWithOperationName: (NSString*) operationName andMethod: (NSString*) method andFormat:(NSString*) format andVersion: (int *) version{
    self=[super init];
    if(self){
        Version=version;
        Method=method;
        OperationName=operationName;
        Format=format;
    }
    return self;
}
/**
 * get the operation name.
 *
 * @return Operation name
 */
-(NSString *) getOperationName{
    return OperationName;
}


/**
 * set the operation name.
 *
 * @param operationName set the operation name
 */
- (void) setOperationName:(NSString*) name{
    OperationName=name;
}

/**
 * get the method.
 *
 * @return Method
 */
- (NSString*) getMethod{
    return Method;
}

/**
 * set the method.
 *
 * @param method set method
 */
- (void) setMethod:(NSString*) method{
    Method=method;
    
}

/**
 * get the format.
 *
 * @return Format
 */
- (NSString *) getFormat{
    return Format;
}

/**
 * set the format.
 *
 * @param format set the format
 */
- (void) setFormat:(NSString *) format{
    Format=format;
}

/**
 * get the version.
 *
 * @return Version
 */
- (int *) getVersion{
    return Version;
    
}

/**
 * set the version.
 *
 * @param version set the version
 */
- (void) setVersion:(int*) version{
    Version=version;
}

/**
 * check if the version is not null or not empty.
 *
 * @param param the param
 * @return bool
 */
- (bool) isValid:(NSString *) param{
    return param != nil
    && (([param respondsToSelector:@selector(length)] && [(NSData *)param length] != 0)
        || ([param respondsToSelector:@selector(count)] && [(NSArray *)param count] != 0));
}
- (bool) isValidInt:(int *) param{
    return param != nil;
}
- (bool) isValidFloat:(float *) param{
    return param != nil;
}
- (bool) isValidBool:(bool *) param{
    return param != nil;
}
/**
 * check if is valid or null the param.
 *
 * @param param the param
 * @return bool
 */
-(bool) isValidorNull:(NSString *) param{
    return param==nil || [self isValid: param];
}
-(bool) isValidorNullInt:(int *) param{
    return param==nil || param !=nil;
}
-(bool) isValidorNullFloat:(float *) param{
    return param==nil || param !=nil;
}
- (bool) isValidorNullBool:(bool *) param{
    return param==nil || param !=nil;
}

/**
 *Validate strings
 *@return string
 */
-(NSString *) stringToURLEncoded: (NSString*) param{
    if (param!=nil)
        return [param stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    else
        return @"";
}

/**
 *Validate Double
 *@return string
 */
-(NSString *) doubleToURLEncoded: (float*) param{
    if (param!=nil)
        return [[NSString stringWithFormat:@"%f", *param] stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    else
        return @"";
}

/**
 *Validate int
 *@return string
 */
-(NSString *) intToURLEncoded: (int*) param{
    if (param!=nil)
        return [[NSString stringWithFormat:@"%d", *param] stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    else
        return @"";
}

/**
 *Validate bool
 *@return string
 */
-(NSString *) boolToURLEncoded: (bool*) param{
    if (param!=nil){
        if(param)
            return @"true";
        else
            return @"false";
    }
    return @"";
}

/**
 *Validate date
 *@return string
 */
-(NSString *) dateToURLEncoded: (NSDate*) param{
    if (param!=nil){
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // (AAAA-MM-DDThh:mm:sszzzzzz)
        NSString * data=[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: param]] ;
        //NSString *encoded=[data stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
        NSString *encoded = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                  NULL,
                                                                                                  (CFStringRef)data,
                                                                                                  NULL,
                                                                                                  (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                                  kCFStringEncodingUTF8 ));
        return encoded;
    }
    else
        return @"";
}


/**
 * validate the params.
 *
 * @return bool
 */
- (bool) ValidateParams{
    bool valid=true;
    valid=valid&&[self isValid:[NSString stringWithFormat:@"%d", *Version]];
    valid=valid&&[self isValid:Method];
    valid=valid&&[self isValid:Format];
    valid=valid&&[self isValid:OperationName];
    return valid;
}

/**
 * return the object¥s parameters concatenate.
 *
 * @return the string
 * string
 */
- (NSString *) ConcatParams{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

/**
 * Body params.
 *
 * @return the multipart entity
 * @throws IOException Signals that an I/O exception has occurred.
 */




@end
