//
//  CMACharacterController.h
//  HarryPotter-C
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMACharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMACharacterController : NSObject

+ (instancetype)sharedInstance;

+ (void)fetchCharater:(void(^)(NSArray<CMACharacter *>*charaters))completion;

@end

NS_ASSUME_NONNULL_END
