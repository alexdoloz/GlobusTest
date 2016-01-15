//
//  GTSegmentedControl.h
//  GlobusTest
//
//  Created by Alexander on 14.01.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface GTSegmentedControl : UIControl

- (_Nonnull instancetype)initWithItems:(nullable NSArray *)items;

@property(nonatomic) NSInteger selectedSegmentIndex;
@property(nonatomic, readonly) NSUInteger numberOfSegments;

- (void)insertSegmentWithTitle:(nullable NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)removeAllSegments;
//- (void)setTitle:(nullable NSString *)title
//    forSegmentAtIndex:(NSUInteger)segment;
//- (nullable NSString *)titleForSegmentAtIndex:(NSUInteger)segment;


@property (nonatomic) IBInspectable CGFloat segmentHeight;
@property (nonatomic) IBInspectable CGFloat interitemSpacing;
@property (nonatomic) IBInspectable CGFloat lineThickness;
@property (nonatomic, nullable) IBInspectable UIColor *inactiveSegmentColor;
@property (nonatomic, nullable) IBInspectable UIColor *activeSegmentColor;

@end
