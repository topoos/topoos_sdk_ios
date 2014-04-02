//
//  TOSAccessResImage.m
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

#import "TOSAccessResImage.h"

#import "SBJSON.h"

@implementation TOSAccessResImage


@synthesize Format,Error,Image,Result;


/**
 * Instantiates a new image result.
 */
-(TOSAccessResImage *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new image result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResImage *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new image result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param image
 *            the image
 */
-(TOSAccessResImage *) initWithError: (NSString*) error andResult: (id) result andImage: (TOS_Image *) image{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Image=image;
    }
    return self;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters{
    
    NSString * identifier;
    NSString * client_id;
    NSString * user_id;
    NSString * filename;
     NSString * filename_unique;
     NSString * filename_ext;
     NSString * uri;
    NSString * str_register_date;
    NSDate * register_date;
    int geo_data_id;
    int geo_data_position_id;
    int geo_data_poi_id;
    
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        Image = [[TOS_Image alloc] init];
        identifier = [attributes valueForKeyPath:@"id"];
        [Image setIdentifier: identifier];
        client_id= [attributes valueForKeyPath:@"client_id"];
        [Image setClient_id:client_id];
        filename= [attributes valueForKeyPath:@"filename"];
        [Image setFilename:filename];
        filename_unique= [attributes valueForKeyPath:@"filename_unique"];
        [Image setFilename_unique:filename_unique];
        user_id= [attributes valueForKeyPath:@"user_id"];
        [Image setUser_id:user_id];
        uri= [attributes valueForKeyPath:@"uri"];
        [Image setUri:uri];
        filename_ext= [attributes valueForKeyPath:@"file_ext"];
        [Image setFile_ext:filename_ext];
        
        str_register_date=[attributes valueForKeyPath:@"register_date"];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        register_date = [formatter dateFromString:str_register_date];
        
        NSDictionary *jGeo_data = [attributes valueForKeyPath:@"geo_data"];
        if(jGeo_data!=nil){
            
            geo_data_id= [[attributes valueForKeyPath:@"id"] intValue];
            geo_data_poi_id= [[attributes valueForKeyPath:@"position_id"] intValue];
            geo_data_position_id= [[attributes valueForKeyPath:@"poi_id"] intValue];
            TOS_GeoData* geo_data= [[TOS_GeoData alloc] initWithIdentifier:&geo_data_id andPosition_id:&geo_data_position_id andPoi_id:&geo_data_poi_id];
            [Image setGeo_data:geo_data];
        }
    }
}

/**
 * Gets the image.
 * 
 * @return the image
 */
-(TOS_Image *) getImage {
    return Image;
}

/**
 * Sets the image.
 * 
 * @param image
 *            the image to set
 */
-(void) setImage:(TOS_Image* ) image {
    Image = image;
}


@end
