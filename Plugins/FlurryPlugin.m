//
//  FlurryPlugin.m
//  toontheatre
//
//  Created by kamal on 08/09/11.
//  Copyright 2011 Kamal. All rights reserved.
//

#import "FlurryPlugin.h"
#import "Flurry.h"

@implementation FlurryPlugin

- (void)logPageView:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options  
{
    [Flurry logPageView];
    NSLog(@"PageView logged");
}

- (void)logEvent:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options  
{
    NSString *event = [options objectForKey:@"event"] ?: @"unknown-event";
    
    [Flurry logEvent:event];
    NSLog(@"Logged event for %@", event);
}

- (void)logEventTimed:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    NSString *event = [options objectForKey:@"event"] ?: @"unknown-event";
    
    [Flurry logEvent:event timed:YES];
    NSLog(@"Logging timed event for %@", event);
}

- (void)logEventWithParameters:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    NSString *event = [options objectForKey:@"event"] ?: @"unknown-event";
    NSMutableDictionary *params = [options objectForKey:@"params"] ?: [[NSMutableDictionary alloc] init];
    
    [Flurry logEvent:event withParameters:params];
    NSLog(@"Logged event for %@ with parameters %@", event, params);
}
@end
