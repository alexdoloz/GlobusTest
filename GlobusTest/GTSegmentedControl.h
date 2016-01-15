//
//  GTSegmentedControl.h
//  GlobusTest
//
//  Created by Alexander on 14.01.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GTSegmentedControl : UIControl

- (instancetype)initWithItems:(nullable NSArray *)items;

@property(nonatomic) NSInteger selectedSegmentIndex;
@property(nonatomic, readonly) NSUInteger numberOfSegments;

- (void)insertSegmentWithTitle:(nullable NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)removeAllSegments;
//- (void)setTitle:(nullable NSString *)title
//    forSegmentAtIndex:(NSUInteger)segment;
//- (nullable NSString *)titleForSegmentAtIndex:(NSUInteger)segment;


@property (nonatomic) CGFloat segmentHeight;
@property (nonatomic) CGFloat interitemSpacing;
@property (nonatomic) CGFloat lineThickness;
@property (nonatomic, nullable) UIColor *inactiveSegmentColor;
@property (nonatomic, nullable) UIColor *activeSegmentColor;

@end
