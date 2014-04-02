//
//  TOS_Image.h
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

#import <Foundation/Foundation.h>

#import "TOS_GeoData.h"
@interface TOS_Image : NSObject


/** The id. */
@property (nonatomic,retain) NSString * Identifier;

/** The client_id. */
@property (nonatomic,retain) NSString * Client_id;

/** The user_id. */
@property (nonatomic,retain) NSString * User_id;

/** The filename. */
@property (nonatomic,retain) NSString * Filename;

/** The filename_unique. */
@property (nonatomic,retain) NSString * Filename_unique;

/** The file_ext. */
@property (nonatomic,retain) NSString * File_ext;

/** The uri. */
@property (nonatomic,retain) NSString * Uri;

/** The register_date. */
@property (nonatomic,retain) NSDate * Register_date;

/** The geo_data. */
@property (nonatomic,retain) TOS_GeoData * Geo_data;

-(TOS_Image*) init;


/**
 * Instantiates a new image.
 *
 * @param id the id
 * @param client_id the client_id
 * @param user_id the user_id
 * @param filename the filename
 * @param filename_unique the filename_unique
 * @param file_ext the file_ext
 * @param uri the uri
 * @param register_date the register_date
 * @param geo_data the geo_data
 */
-(TOS_Image*) initWithIdentifier: (NSString *) identifier andClient_id:(NSString *) client_id andUserID:(NSString *) user_id andFilename:(NSString* ) filename andFilename_unique:(NSString*) filename_unique andFile_ext:(NSString *) file_ext andUri:(NSString *) uri andRegisterDate:(NSDate *) register_date andGeo_Data:(TOS_GeoData *) geo_data;


/**
 * Gets the id.
 *
 * @return the id
 */
-(NSString *) getIdentifier ;

/**
 * Sets the id.
 *
 * @param id the id to set
 */
-(void) setIdentifier:(NSString *) identifier;

/**
 * Gets the client_id.
 *
 * @return the client_id
 */
-(NSString *) getClient_id ;

/**
 * Sets the client_id.
 *
 * @param client_id the client_id to set
 */
-(void) setClient_id:(NSString *) client_id;

/**
 * Gets the user_id.
 *
 * @return the user_id
 */
-(NSString *) getUser_id ;

/**
 * Sets the user_id.
 *
 * @param user_id the user_id to set
 */
-(void) setUser_id:(NSString *) user_id;

/**
 * Gets the filename.
 *
 * @return the filename
 */
-(NSString *) getFilename ;

/**
 * Sets the filename.
 *
 * @param filename the filename to set
 */
-(void) setFilename:(NSString *) filename;

/**
 * Gets the filename_unique.
 *
 * @return the filename_unique
 */
-(NSString *) getFilename_unique ;

/**
 * Sets the filename_unique.
 *
 * @param filename_unique the filename_unique to set
 */
-(void) setFilename_unique:(NSString *) filename_unique;

/**
 * Gets the file_ext.
 *
 * @return the file_ext
 */
-(NSString *) getFile_ext ;

/**
 * Sets the file_ext.
 *
 * @param file_ext the file_ext to set
 */
-(void) setFile_ext:(NSString *) file_ext;

/**
 * Gets the uri.
 *
 * @return the uri
 */
-(NSString *) getUri ;

/**
 * Sets the uri.
 *
 * @param uri the uri to set
 */
-(void) setUri:(NSString *) uri;

/**
 * Gets the register_date.
 *
 * @return the register_date
 */
-(NSDate *) getRegister_date ;

/**
 * Sets the register_date.
 *
 * @param register_date the register_date to set
 */
-(void) setRegister_date: (NSDate *) register_date;
/**
 * Gets the geo_data.
 *
 * @return the geo_data
 */
-(TOS_GeoData *) getGeo_data ;

/**
 * Sets the geo_data.
 *
 * @param geo_data the geo_data to set
 */
-(void) setGeo_data: (TOS_GeoData *) geo_data;

@end
