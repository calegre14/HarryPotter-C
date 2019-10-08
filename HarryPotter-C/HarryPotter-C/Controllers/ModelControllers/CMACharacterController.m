//
//  CMACharacterController.m
//  HarryPotter-C
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMACharacterController.h"


@implementation CMACharacterController

static NSString * const kBaseURLString = @"https://www.potterapi.com/v1/";
static NSString * const kCharaterComponent = @"characters";
static NSString * const kApiKeyKey = @"key";
static NSString * const kApiKeyValue = @"$2a$10$ipHhcp4crl6up4vfXxBV4us/OYeh52SKjlaKOTWC4rjLCJlYW1hNS";

+ (instancetype)sharedInstance
{
    static CMACharacterController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CMACharacterController alloc] init];
    });
    return sharedInstance;
}


+ (void)fetchCharater:(void (^)(NSArray<CMACharacter *> * _Nullable))completion
{
    NSURL * url = [NSURL URLWithString:kBaseURLString];
    NSURL * characterConstant = [url URLByAppendingPathComponent:kCharaterComponent];
    
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:characterConstant resolvingAgainstBaseURL:true];
    NSURLQueryItem * urlKey = [NSURLQueryItem queryItemWithName:kApiKeyKey value:kApiKeyValue];
    
    urlComponents.queryItems = @[urlKey];
    NSURL * finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary * topLevelCharacter = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelCharacter)
            {
                NSLog(@"Error parsing JSON %@", error);
                completion(nil);
                return;
            }
            
            NSMutableArray * charatersArray = [NSMutableArray new];
            
            for (NSDictionary * dictionary in topLevelCharacter)
            {
                CMACharacter * charater = [[CMACharacter alloc] initWithDictionary:dictionary];
                [charatersArray addObject:charater];
            }
            completion(charatersArray);
        }
    }]resume];
}
@end
