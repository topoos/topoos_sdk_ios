//
//  TOSAccessResUser.m
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

#import "TOSAccessResUser.h"
#import "SBJSON.h"

@implementation TOSAccessResUser


/** The user. */
@synthesize User,Format,Error,Result;

/**
 * Instantiates a new user result.
 */
-(TOSAccessResUser *) init{
    self=[super init];
    return self;
}
/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResUser *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param user
 *            the user
 */
-(TOSAccessResUser *) initWithError: (NSString*) error andResult: (id) result andUser: (TOS_User*) user{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        User=user;
    }
    return self;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters{
    // TODO Auto-generated method stub
    NSString * identifier;
    NSString * name;
    NSString * email;
    NSMutableArray *  ugroups;
    TOS_Accreditation * accreditation;
    NSMutableArray * visibledevices;
    int iddevice;
    int modeldevice;
    bool islogicaldevice;
    SBJSON *parser = [[SBJSON alloc] init];
    
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        User= [[TOS_User alloc] init];
        identifier=[attributes valueForKeyPath:@"id"];
        [User setIdentifier:identifier];
        name= [attributes valueForKeyPath:@"name"];
        [User setName:name];
        email= [attributes valueForKeyPath:@"email"];
        [User setEmail:email];
        NSDictionary * profiledata = [attributes valueForKeyPath:@"profile"];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        
        if(profiledata!= [NSNull null] &&[profiledata count]!=0){
            TOS_Profile * profile=[[TOS_Profile alloc]init];
            [profile setBirthday: [formatter dateFromString:[profiledata valueForKeyPath:@"birthday"]]];
            [profile setGender:[profiledata valueForKeyPath:@"gender"]];
            [User setProfile:profile];
        }
        ugroups = [[NSMutableArray alloc] init ];
        
        //NSLog(@"%@",Result);
        //NSNumber *value= [[NSNumber alloc]initWithInt:0];
        for (NSString* ugroup in [attributes valueForKeyPath:@"ugroup"] ){
            [ugroups addObject:[[NSNumber alloc]initWithInt:[ugroup intValue ]]];
        }
        [User setUgroup: ugroups];
        
        
        accreditation= [[TOS_Accreditation alloc]init];
        NSDictionary * accreditationdata = [attributes valueForKeyPath:@"accreditation"];
        
        
        
        [accreditation setExpirationtime:[accreditationdata valueForKeyPath:@"expirationtime"]];
        [accreditation setClientId:[accreditationdata valueForKeyPath:@"client_id"]];
        
        visibledevices=[[NSMutableArray alloc] init];
        for (NSDictionary *visibledevice in[accreditationdata valueForKeyPath:@"visibledevices"] ){
            TOS_VisibleDevice *visible_device = [[TOS_VisibleDevice alloc]init ];
            iddevice=[[visibledevice valueForKeyPath:@"id"] intValue];
            [visible_device setIdentifier:iddevice];
            [visible_device setName:[visibledevice valueForKey:@"name"]];
            modeldevice=[[visibledevice valueForKeyPath:@"model"] intValue];
            [visible_device setModel:modeldevice];
            islogicaldevice=[[visibledevice valueForKeyPath:@"islogical"] boolValue];
            [visible_device setIsLogical:&islogicaldevice];
            [visibledevices addObject:visible_device];
        }
        [accreditation setVisibledevices:visibledevices];
        [User setAccreditation:accreditation];
        
    }
}


/**
 * Gets the user.
 * 
 * @return the user
 */
- (TOS_User *) getUser {
    return User;
}

/**
 * Sets the user.
 * 
 * @param user
 *            the user to set
 */
- (void) setUser :(TOS_User *) user {
    User = user;
}






@end
