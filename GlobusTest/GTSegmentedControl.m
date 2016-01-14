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

@end


@implementation GTSegmentedControl

#pragma mark - Initializers

- (instancetype)initWithItems:(nullable NSArray *)items {
    self = [super init];
    if (self) {
        _titles = [items copy];
        _segments = [NSMutableArray new];
        _interitemSpacing = 5.0;
        _lineThickness = 2.0;
        _inactiveSegmentColor = [UIColor grayColor];
        _activeSegmentColor = [UIColor greenColor];
        _segmentHeight = 44.0;
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
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint center = self.center;
    CGFloat nextOriginX = 0;
    for (UIView *segment in self.segments) {
        segment.layer.cornerRadius = 0.5 * self.segmentHeight;
        UILabel *segmentLabel = (UILabel *)[segment.subviews firstObject];
        [segmentLabel sizeToFit];
        CGFloat width = MAX(segmentLabel.bounds.size.width, self.segmentHeight);
        segment.frame = CGRectMake(0, 0, width, self.segmentHeight);
        segmentLabel.center = CGPointMake(CGRectGetMidX(segment.bounds), CGRectGetMidY(segment.bounds));
        segment.center = CGPointMake(nextOriginX + 0.5 * width, 0.5 * self.segmentHeight);
        nextOriginX += width + self.interitemSpacing;
    }
    self.frame = CGRectMake(0, 0, nextOriginX - self.interitemSpacing, self.segmentHeight);
    self.center = center;
    self.line.frame = CGRectMake(0, 0, self.bounds.size.width - 4.0, self.lineThickness);
    self.line.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

- (void)addSegments {
    for (NSInteger i = 0; i < self.titles.count; i++) {
        NSString *title = self.titles[i];
//        
//        BOOL isFirst = i == 0;
//        BOOL isLast = i == self.titles.count - 1;
        UIView *segment = [self createSegmentForTitle:title];
        [self.segments addObject:segment];
        [self addSubview:segment];
//        [segment.heightAnchor constraintEqualToConstant:self.segmentHeight];
//        [segment.topAnchor constraintEqualToAnchor:self.topAnchor];
//        [segment.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
//        
//        if (isFirst) {
//            [segment.leftAnchor constraintEqualToAnchor:self.leftAnchor];
//        }
//        if (isLast) {
//            [segment.rightAnchor constraintEqualToAnchor:self.rightAnchor];
//        }
//        if (!isFirst) {
//            UIView *previousSegment = self.segments[i - 1];
//            [previousSegment.rightAnchor constraintEqualToAnchor:segment.leftAnchor constant:self.interitemSpacing];
//        }
    }
}

- (UIView *)createSegmentForTitle:(NSString *)title {
    UIView *segment = [[UIView alloc] init];
    UILabel *segmentTitleLabel = [[UILabel alloc] init];
    segmentTitleLabel.text = title;
//    [segmentTitleLabel sizeToFit];
    [segment addSubview:segmentTitleLabel];
//    [segmentTitleLabel.centerXAnchor constraintEqualToAnchor:segment.centerXAnchor];
//    [segmentTitleLabel.centerYAnchor constraintEqualToAnchor:segment.centerYAnchor];
//    
//
//    [segmentTitleLabel.leftAnchor constraintEqualToAnchor:segment.leftAnchor];
//    [segmentTitleLabel.rightAnchor constraintEqualToAnchor:segment.rightAnchor];
//    [segmentTitleLabel.topAnchor constraintEqualToAnchor:segment.topAnchor];
//    [segmentTitleLabel.bottomAnchor constraintEqualToAnchor:segment.bottomAnchor];
    segment.backgroundColor = self.inactiveSegmentColor;
    segment.layer.cornerRadius = 0.5 * self.segmentHeight;
    
    segmentTitleLabel.textColor = self.activeSegmentColor;
    return segment;
}

@end
