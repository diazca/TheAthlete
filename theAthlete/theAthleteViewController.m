//
//  theAthleteViewController.m
//  theAthlete
//
//  Created by CLOS on 4/15/13.
//  Copyright (c) 2013 CLOS. All rights reserved.
//

#import "theAthleteViewController.h"
#import "AFJSONRequestOperation.h"
#import "Athlete.h"
@interface theAthleteViewController ()

@end

@implementation theAthleteViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
        NSURL *url = [NSURL URLWithString:@"http://api.espn.com/v1/sports/baseball/mlb/athletes/3748?apikey=[key]"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSArray *sports = [JSON valueForKeyPath:@"sports"];
            if(sports){
                NSDictionary *sport = [sports objectAtIndex:0];
                if(sport){
                    NSArray *leagues = [sport valueForKeyPath:@"leagues"];
                    if(leagues){
                        NSDictionary *league = [leagues objectAtIndex:0];
                        if(league){
                            Athlete *athlete = [[Athlete alloc]init];
                            athlete.sportAbbrev = [league valueForKeyPath:@"abbreviation"];
                            athlete.sportId = [[league valueForKeyPath:@"id"] intValue];
                            NSArray *athletes = [league valueForKeyPath:@"athletes"];
                            if(athletes){
                                NSDictionary *athleteDictionary = [athletes objectAtIndex:0];
                                if(athleteDictionary){
                                    
                                    athlete.displayName = [athleteDictionary valueForKeyPath:@"displayName"];
                                }
                            }
                            NSLog(@"%@",athlete);
                        }
                    }
                }
            }
            
        } failure:nil];
        
        [operation start];
    }
    
    return self;
}

@end
