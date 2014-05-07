//
//  PinCollectionViewCell.m
//  CollectionView
//
//  Created by ricky cancro on 5/6/14.
//  Copyright (c) 2014 My name is kuma. All rights reserved.
//

#import "PinCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "SDMacros.h"

@interface PinCollectionViewCell()
@property (nonatomic, assign) BOOL setupConstraints;
@end

@implementation PinCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _setupConstraints = NO;
        
        _userImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _userImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        _userLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _userLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _pinImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _pinImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        _pinImageView.contentMode = UIViewContentModeCenter;
        
        [self.contentView addSubview:_userImageView];
        [self.contentView addSubview:_userLabel];
        [self.contentView addSubview:_pinImageView];
        
        self.contentView.backgroundColor = [UIColor colorWithRed:.9f green:.9f blue:.9f alpha:1.0f];
        self.contentView.autoresizesSubviews = YES;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.setupConstraints)
    {
        self.setupConstraints = YES;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_pinImageView, _userLabel, _userImageView);
        // creates the horizontal contraints: | is the left edge of the container.  userImageView is 10pixels to the right, 30 pixels wide and 10 pixels from the user's label
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[_userImageView]-(10)-[_userLabel]" options:0 metrics:nil views:views]];
        
        // create vertical constraints: userImageView is 10pixels from the top, 10 pixels to the pin image.  The pinImage is 0 pixels from the bottom of the cell
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[_userImageView]-(10)-[_pinImageView]|" options:0 metrics:nil views:views]];
        
        // create horizontal constraints for the pin image.  It is 0 pixels to the left of the container and 0 pixels from the right.  Also set it to be 320 pixels wide.
        // generally you want to avoid all explicit width/height constraints on views -- especially if they are an unknown size.  But without it the cell's width will be the width
        // of the largest thing in the cell, which will be this image.  If the image is 200px, we still want the width of the cell to be 320.  If it is 500, we still want the width
        // of the cell to be 320.  So in this case, I think a width constraint is appropriate.
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_pinImageView(320)]|" options:0 metrics:nil views:views]];
        
        // you can't do this in ascii art -- set the userLabel to be centered vertically to the userImage
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.userLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.userImageView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.f]];
    }
}

- (void)awakeFromNib
{
    // the contraints are set up in the xib, no reason to create them in code
    self.setupConstraints = YES;
}

- (void)updateWithPinModel:(PinModel *)pin
{
    [self updateWithPinModel:pin pinImageLoadedBlock:nil];
}

- (void)updateWithPinModel:(PinModel *)pin pinImageLoadedBlock:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))pinImageLoadedBlock
{
    @weakify(self);
    self.userLabel.text = pin.username;
    [self.userImageView setImageWithURL:[NSURL URLWithString:pin.userImageURLString]];
    [self.pinImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:pin.pinImageURLString]]
                             placeholderImage:nil
                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                          if (pinImageLoadedBlock)
                                          {
                                              @strongify(self);
                                              self.pinImageView.image = image;
                                              pinImageLoadedBlock(request, response, image);
                                          }
                                      }
                                      failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                          // i am lazy!
                                      }];
}

@end
