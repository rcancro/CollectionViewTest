//
//  FirstViewController.m
//  CollectionView
//
//  Created by ricky cancro on 5/6/14.
//  Copyright (c) 2014 My name is kuma. All rights reserved.
//

#import "FirstViewController.h"
#import "PinModel.h"
#import "PinCollectionViewCell.h"
#import "NSObject+SDExtensions.h"


@interface FirstViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *collectionData;

@property (nonatomic, strong) PinCollectionViewCell *sizingCell;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionData = [PinModel pinData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.f;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"PinCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PinCollectionViewCellXIB"];
    [self.collectionView registerClass:[PinCollectionViewCell class] forCellWithReuseIdentifier:@"PinCollectionViewCell"];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PinCollectionViewCell *cell = nil;
    
    if (self.useXIB)
    {
        cell = (PinCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"PinCollectionViewCellXIB" forIndexPath:indexPath];
    }
    else
    {
        cell = (PinCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"PinCollectionViewCell" forIndexPath:indexPath];
    }
    
    [cell updateWithPinModel:[self.collectionData objectAtIndex:indexPath.item] pinImageLoadedBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (nil != response) {
            // only recompute the size if we didn't have the image cached
            [collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }
    }];

    
    return cell;
}


// this where the magic of variable height cells happens.
// I'd never done it with uicollectionviews before, but the main idea is the same as with tableviews.  This is a great post on stack overflow about it:
// http://stackoverflow.com/questions/18746929/using-auto-layout-in-uitableview-for-dynamic-cell-layouts-variable-row-heights
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (nil == self.sizingCell)
    {
        if (self.useXIB)
        {
            self.sizingCell = [PinCollectionViewCell loadFromNib];
        }
        else
        {
            self.sizingCell = [[PinCollectionViewCell alloc] initWithFrame:CGRectZero];
        }
    }
    
    [self.sizingCell updateWithPinModel:[self.collectionData objectAtIndex:indexPath.item] pinImageLoadedBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (nil != response) {
            // only recompute the size if we didn't have the image cached
            [collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }
    }];
    
    [self.sizingCell setNeedsUpdateConstraints];
    [self.sizingCell updateConstraints];
    
    [self.sizingCell setNeedsLayout];
    [self.sizingCell layoutIfNeeded];
    
    CGSize size = CGSizeZero;
    
    // in code you HAVE to add to the contentView or constraints won't work (that was the you need to call super in layoutSubviews crash we saw)
    // but in a XIB I guess you can do whatever you want!
    if (self.useXIB)
    {
        size = [self.sizingCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    }
    else
    {
        size = [self.sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    }
    
    return size;
}

@end
