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
    [self.segmentedControl removeSegmentAtIndex:0 animated:YES];
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
