//
//  GTSegmentedControl.m
//  GlobusTest
//
//  Created by Alexander on 14.01.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

#import "GTSegmentedControl.h"


@interface GTSegmentedControl ()

@property (nonatomic, readwrite) NSUInteger numberOfSegments;
@property (nonatomic) NSMutableArray *titles;
@property (nonatomic) NSMutableArray *segments;
@property (nonatomic) UIView *line;

@property (nonatomic, weak) UIView *selectedSegment;

@end


@implementation GTSegmentedControl

#pragma mark - Initializers

- (instancetype)initWithItems:(nullable NSArray *)items {
    self = [super init];
    if (self) {
        self.tag = 999;
        _titles = [items mutableCopy];
        _segments = [NSMutableArray new];
        _interitemSpacing = 10.0;
        _lineThickness = 2.0;
        _inactiveSegmentColor = [UIColor grayColor];
        _activeSegmentColor = [UIColor greenColor];
        _segmentHeight = 44.0;
        _selectedSegmentIndex = NSNotFound;
        [self addLine];
        [self addSegments];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (void)addLine {
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = self.inactiveSegmentColor;
    self.line = line;
    line.tag = 999;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint center = self.center;
    CGFloat nextOriginX = 0;
    for (UIView *segment in self.segments) {
        segment.layer.cornerRadius = 0.5 * self.segmentHeight;
        UILabel *segmentLabel = (UILabel *)[segment.subviews firstObject];
        [segmentLabel sizeToFit];
        CGFloat width = MAX(segmentLabel.bounds.size.width + 16.0, self.segmentHeight);
        segment.frame = CGRectMake(0, 0, width, self.segmentHeight);
        segmentLabel.center = CGPointMake(CGRectGetMidX(segment.bounds), CGRectGetMidY(segment.bounds));
        segment.center = CGPointMake(nextOriginX + 0.5 * width, 0.5 * self.segmentHeight);
        nextOriginX += width + self.interitemSpacing;
    }
    self.frame = CGRectMake(100, 100, nextOriginX - self.interitemSpacing, self.segmentHeight);
    self.center = center;
    self.line.frame = CGRectMake(0, 0, self.bounds.size.width - 4.0, self.lineThickness);
    self.line.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.line.hidden = self.numberOfSegments == 0;
}

- (void)addSegments {
    for (NSInteger i = 0; i < self.titles.count; i++) {
        NSString *title = self.titles[i];
        UIView *segment = [self createSegmentForTitle:title];
        [self.segments addObject:segment];
    }
}

- (UIView *)createSegmentForTitle:(NSString *)title {
    UIView *segment = [[UIView alloc] init];
    [self addSubview:segment];
    UILabel *segmentTitleLabel = [[UILabel alloc] init];
    segmentTitleLabel.text = title;
    [segment addSubview:segmentTitleLabel];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(segmentTapped:)];
    [segment addGestureRecognizer:tap];
    segment.backgroundColor = self.inactiveSegmentColor;
    segment.layer.cornerRadius = 0.5 * self.segmentHeight;
    
    segmentTitleLabel.textColor = self.activeSegmentColor;
    return segment;
}

- (void)segmentTapped:(UITapGestureRecognizer *)tap {
    UIView *segment = tap.view;
    self.selectedSegment = segment;
}

- (void)deselectSegmentAtIndex:(NSInteger)index {
    if (index == NSNotFound) return;
    UIView *segment = self.segments[index];
    segment.backgroundColor = self.inactiveSegmentColor;
    UILabel *segmentLabel = [segment.subviews firstObject];
    segmentLabel.textColor = self.activeSegmentColor;
}

- (void)selectSegmentAtIndex:(NSInteger)index {
    if (index == NSNotFound) return;
    UIView *segment = self.segments[index];
    segment.backgroundColor = self.activeSegmentColor;
    UILabel *segmentLabel = [segment.subviews firstObject];
    segmentLabel.textColor = self.inactiveSegmentColor;
}

- (void)deselectAll {
    for (NSInteger i = 0; i < self.segments.count; i++) {
        [self deselectSegmentAtIndex:i];
    }
}

- (void)setSelectedSegment:(UIView *)selectedSegment {
    if (selectedSegment == _selectedSegment) return;
    _selectedSegment = selectedSegment;
    NSUInteger index = [self.segments indexOfObject:selectedSegment];
    self.selectedSegmentIndex = index;
}

- (void)refreshSelection {
    self.selectedSegment = self.selectedSegment;
}

- (void)resetSelection {
    self.selectedSegment = nil;
}

#pragma mark - Public

- (NSUInteger)numberOfSegments {
    return self.titles.count;
}

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)index animated:(BOOL)animated {
    if (index > self.titles.count) return;
    UIView *segment = [self createSegmentForTitle:title];
    [self.segments insertObject:segment atIndex:index];
    [self.titles insertObject:title atIndex:index];

    [self setNeedsLayout];
    [self resetSelection];
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    if ((selectedSegmentIndex == _selectedSegmentIndex || selectedSegmentIndex >= self.titles.count || selectedSegmentIndex < 0) && selectedSegmentIndex != NSNotFound) return;
    [self deselectAll];
    [self selectSegmentAtIndex:selectedSegmentIndex];
    _selectedSegmentIndex = selectedSegmentIndex;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (void)removeSegmentAtIndex:(NSUInteger)index animated:(BOOL)animated {
    if (index >= self.titles.count) return;
    [self.titles removeObjectAtIndex:index];
    [self.segments[index] removeFromSuperview];
    [self.segments removeObjectAtIndex:index];
    self.selectedSegmentIndex = NSNotFound;
    [self setNeedsLayout];
    [self resetSelection];
}

- (void)removeAllSegments {
    NSUInteger count = self.titles.count;
    for (NSInteger i = 0; i < count; i++) {
        [self removeSegmentAtIndex:0 animated:NO];
    }
}


@end
