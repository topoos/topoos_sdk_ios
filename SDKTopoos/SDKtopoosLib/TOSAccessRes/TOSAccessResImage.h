//
//  TOSAccessResImage.h
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
#import "TOSAccessRes.h"
#import "TOS_Image.h"
#import "TOS_GeoData.h"

@interface TOSAccessResImage : TOSAccessRes

/** The image. */
@property (nonatomic,retain) TOS_Image * Image;

/**
 * Instantiates a new image result.
 */
-(TOSAccessResImage *) init;

/**
 * Instantiates a new image result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResImage *) initWithError: (NSString*) error andResult: (id) result;



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
-(TOSAccessResImage *) initWithError: (NSString*) error andResult: (id) result andImage: (TOS_Image *) image;


/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the image.
 *
 * @return the image
 */
-(TOS_Image *) getImage ;

/**
 * Sets the image.
 *
 * @param image
 *            the image to set
 */
-(void) setImage:(TOS_Image* ) image ;


@end
