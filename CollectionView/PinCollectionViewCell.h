//
//  PinCollectionViewCell.h
//  CollectionView
//
//  Created by ricky cancro on 5/6/14.
//  Copyright (c) 2014 My name is kuma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinModel.h"

@interface PinCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UIImageView *pinImageView;

- (void)updateWithPinModel:(PinModel *)pin;
- (void)updateWithPinModel:(PinModel *)pin pinImageLoadedBlock:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))pinImageLoadedBlock;

@end
