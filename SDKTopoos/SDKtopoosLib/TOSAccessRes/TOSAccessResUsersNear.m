//
//  TOSAccessResUsersNear.m
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
#import "TOSAccessResUsersNear.h"
#import "SBJSON.h"

@implementation TOSAccessResUsersNear


@synthesize Format,Error,Result,Usersnear;


/**
 * Instantiates a new users near result.
 */
/**
 * Instantiates a new user result.
 */
-(TOSAccessResUsersNear *) init{
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
-(TOSAccessResUsersNear *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new users near result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param usersnear
 *            the usersnear
 */
-(TOSAccessResUsersNear *) initWithError: (NSString*) error andResult: (id) result andUser: (TOS_UsersNear*) usersnear{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Usersnear=usersnear;
    }
    return self;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
-  (void) setParameters{
    SBJSON *parser = [[SBJSON alloc] init];
    Usersnear =nil;
    NSMutableArray * usersidsposition=[[NSMutableArray alloc]init];
    for (NSDictionary *userpositiondic in[parser objectWithString:Result error:nil] ){
        Usersnear =[[TOS_UsersNear alloc] init];
        TOS_UserIdPosition * useridposition=[[TOS_UserIdPosition alloc]init];
        [useridposition setUserid:[userpositiondic valueForKeyPath:@"user_id"]];
        TOS_UserPosition * userposition=[[TOS_UserPosition alloc]init];
        NSDictionary * position=[userpositiondic valueForKeyPath:@"position"];
        float acc=[[position valueForKey:@"accuracy"] floatValue];
        [userposition setAccuracy:acc];
        float lat=[[position valueForKey:@"latitude"] floatValue];
        [userposition setLatitude:lat];
        float lng=[[position valueForKey:@"longitude"] floatValue];
        [userposition setLongitude:lng];
        [useridposition setUserPosition:userposition];
        [usersidsposition addObject:useridposition];
    }
    if(Usersnear!=nil){
        [Usersnear setUseridPositions:usersidsposition];
    }
}

/**
 * Gets the usersnear.
 * 
 * @return the usersnear
 */
- (TOS_UsersNear* ) getUsersnear {
    return Usersnear;
}

/**
 * Sets the usersnear.
 * 
 * @param usersnear
 *            the usersnear to set
 */
- (void) setUsersnear:(TOS_UsersNear*) usersnear {
    Usersnear = usersnear;
}




@end
