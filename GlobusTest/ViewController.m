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
@property (weak, nonatomic) IBOutlet UILabel *selectedIndexLabel;

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
    [self.segmentedControl insertSegmentWithTitle:@"Inserted" atIndex:0 animated:NO];
}

- (IBAction)appendPressed:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    GTSegmentedControl *sc = [[GTSegmentedControl alloc] initWithItems:@[
        @"раз",
        @"два",
        @"три",
        @"четыре"
    ]];
  
    [self.view addSubview:sc];
    self.segmentedControl = sc;
    [sc addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.segmentedControl.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
//  [self.segmentedControl.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-500];
//    [self.segmentedControl.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
}

- (void)valueChanged:(GTSegmentedControl *)sender {
    NSUInteger selectedIndex = sender.selectedSegmentIndex;
    self.selectedIndexLabel.text = selectedIndex == NSNotFound ? @"Сегмент не выбран" :
    [NSString stringWithFormat:@"Выбран элемент с индексом %@", @(selectedIndex)];

}

@end
