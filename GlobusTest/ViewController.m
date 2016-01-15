//
//  ViewController.m
//  GlobusTest
//
//  Created by Alexander on 14.01.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

#import "ViewController.h"
#import "GTSegmentedControl.h"


@interface ViewController ()

@property (nonatomic) GTSegmentedControl *segmentedControl;

@end

@implementation ViewController

- (IBAction)removePressed:(id)sender {
    [self.segmentedControl removeSegmentAtIndex:[self randomIndex] animated:YES];
}

- (NSInteger)randomIndex {
     return (NSInteger)arc4random_uniform((u_int32_t)self.segmentedControl.numberOfSegments);
}

- (IBAction)removeAllPressed:(id)sender {
    [self.segmentedControl removeAllSegments];
}

- (IBAction)insertPressed:(id)sender {
}

- (IBAction)appendPressed:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    GTSegmentedControl *sc = [[GTSegmentedControl alloc] initWithItems:@[
        @"раз",
        @"дваkljsfldk",
        @"три"
    ]];
    sc.center = CGPointMake(300, 300);
    [self.view addSubview:sc];
    self.segmentedControl = sc;
}

@end
