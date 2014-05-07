//
//  UIView+Frame.h
//  asda
//
//  Created by ricky cancro on 6/24/13.
//  Copyright (c) 2013 Asda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView(Frame)

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

- (CGPoint)origin;
- (CGSize)size;

@end
