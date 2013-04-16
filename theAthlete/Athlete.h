//
//  Athlete.h
//  theAthlete
//
//  Created by CLOS on 4/15/13.
//  Copyright (c) 2013 CLOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Athlete : NSObject

@property (nonatomic,retain) NSString *displayName;
@property (nonatomic,retain) NSString *sportAbbrev;
@property (nonatomic) int playerId;
@property (nonatomic) int sportId;

-(NSString *)description;

@end
