//
//  UrlParser.h
//  Jose
//
//  Created by Manuel Imedio Gutiérrez on 25/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlParser : NSObject {
    NSMutableArray *variables;
}

@property (nonatomic, retain) NSMutableArray *variables;

- (id)initWithURLString:(NSString *)url;
- (NSString *)valueForVariable:(NSString *)varName;
- (id) initWithURLStringInt:(NSString *)url;

@end
