//
//  UIView+Frame.m
//  asda
//
//  Created by ricky cancro on 6/24/13.
//  Copyright (c) 2013 Asda. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView(Frame)

- (void)setX:(CGFloat)x
{
    CGRect f = self.frame;
    f.origin.x = x;
    self.frame = f;
}

- (void)setY:(CGFloat)y
{
    CGRect f = self.frame;
    f.origin.y = y;
    self.frame = f;
}

- (void)setWidth:(CGFloat)width
{
    CGRect f = self.frame;
    f.size.width = width;
    self.frame = f;
}

- (void)setHeight:(CGFloat)height;
{
    CGRect f = self.frame;
    f.size.height = height;
    self.frame = f;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect f = self.frame;
    f.origin = origin;
    self.frame = f;
}

- (void)setSize:(CGSize)size;
{
    CGRect f = self.frame;
    f.size = size;
    self.frame = f;
}


- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y;
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGSize)size
{
    return self.frame.size;
}


@end
