//
//  CMACharacter.m
//  HarryPotter-C
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMACharacter.h"

static NSString * const kName = @"name";
static NSString * const kHouse = @"house";
static NSString * const kBloodStatus = @"bloodStatus";
static NSString * const kDeathEater = @"deathEater";
static NSString * const kRole = @"role";

@implementation CMACharacter

- (instancetype)initWithCharacterName:(NSString *)name house:(NSString *)house bloodSatus:(NSString *)bloodStatus deathEater:(BOOL)deathEater role:(NSString *)role
{
    if (self = [super init])
        //self = [super init]
        //if (self)
    {
        _name = name;
        _house = house;
        _bloodStatus = bloodStatus;
        _deathEater = deathEater;
        _role = role;
    }
    return self;
}

@end

@implementation CMACharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[kName];
    NSString *house = dictionary[kHouse];
    NSString *bloodStatus = dictionary[kBloodStatus];
    BOOL deathEater = dictionary[kDeathEater];
    NSString *role = dictionary[kRole];
    
    return [self initWithCharacterName:name house:house bloodSatus:bloodStatus deathEater:deathEater role:role];
}

@end
