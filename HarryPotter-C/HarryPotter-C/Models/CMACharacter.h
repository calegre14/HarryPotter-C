//
//  CMACharacter.h
//  HarryPotter-C
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMACharacter : NSObject

@property(nonatomic, copy, readonly)NSString *name;
@property(nonatomic, copy, readonly, nullable)NSString *house;
@property(nonatomic, copy, readonly)NSString *bloodStatus;
@property(nonatomic, readonly)BOOL deathEater;
@property(nonatomic, copy, readonly)NSString *role;

-(instancetype)initWithCharacterName:(NSString *)name
                               house:(NSString *)house
                          bloodSatus:(NSString *)bloodStatus
                          deathEater:(BOOL)deathEater
                                role:(NSString *)role;

@end

@interface CMACharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
