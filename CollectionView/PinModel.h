//
//  PinModel.h
//  CollectionView
//
//  Created by ricky cancro on 5/6/14.
//  Copyright (c) 2014 My name is kuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinModel : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *userImageURLString;
@property (nonatomic, copy) NSString *pinImageURLString;

+ (NSArray *)pinData;

@end
