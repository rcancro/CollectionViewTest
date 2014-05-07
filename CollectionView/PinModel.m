//
//  PinModel.m
//  CollectionView
//
//  Created by ricky cancro on 5/6/14.
//  Copyright (c) 2014 My name is kuma. All rights reserved.
//

#import "PinModel.h"

@implementation PinModel

- (instancetype)initWithUsername:(NSString *)username userImageURLString:(NSString *)userURLString pinImageURLString:(NSString *)pinURLString
{
    self = [super init];
    if (self)
    {
        _username = [username copy];
        _userImageURLString = [userURLString copy];
        _pinImageURLString = [pinURLString copy];
    }
    return self;
}

+ (NSArray *)pinData
{
    NSMutableArray *pinData = [NSMutableArray array];
    
    PinModel *pin = nil;
    
    pin = [[PinModel alloc] initWithUsername:@"Van Berger"
                          userImageURLString:@"http://media-cache-ec0.pinimg.com/avatars/vanessaberger-22_60.jpg"
                           pinImageURLString:@"http://media-cache-ak0.pinimg.com/474x/5d/62/de/5d62dea527e1368a950d853526b7a8d7.jpg"];
    [pinData addObject:pin];
    
    pin = [[PinModel alloc] initWithUsername:@"Charles"
                          userImageURLString:@"http://media-cache-ec0.pinimg.com/avatars/HardwareLust-80_60.jpg"
                           pinImageURLString:@"http://media-cache-ak0.pinimg.com/474x/e4/fa/72/e4fa721fcf6dbcca345e1b6955ecd4be.jpg"];
    [pinData addObject:pin];
    
    pin = [[PinModel alloc] initWithUsername:@"Ricky Cancro"
                          userImageURLString:@"http://media-cache-ec0.pinimg.com/avatars/rickycancro-1398901736_60.jpg"
                           pinImageURLString:@"http://media-cache-ec0.pinimg.com/474x/21/e4/fa/21e4fa0d1866e7a15829983f9063ff51.jpg"];
    [pinData addObject:pin];

    pin = [[PinModel alloc] initWithUsername:@"Yan Ucci"
                          userImageURLString:@"http://media-cache-ec0.pinimg.com/avatars/yan_ucci-53_60.jpg"
                           pinImageURLString:@"http://media-cache-ec0.pinimg.com/474x/b5/17/3f/b5173fff4b1595ef3a3b6dd5e361ed71.jpg"];
    [pinData addObject:pin];

    pin = [[PinModel alloc] initWithUsername:@"Matthew Edwards"
                          userImageURLString:@"http://media-cache-ec0.pinimg.com/avatars/eddedwards_1329512442_60.jpg"
                           pinImageURLString:@"http://media-cache-ak0.pinimg.com/474x/77/fb/90/77fb90b543cdcf66abf1c20a5f0fdb13.jpg"];
    [pinData addObject:pin];
    
    return pinData;
}


@end
