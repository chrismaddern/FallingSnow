//
//  VENViewController.m
//  VENSnowOverlayViewExample
//
//  Created by Chris Maddern on 12/25/13.
//  Copyright (c) 2013 Venmo. All rights reserved.
//

#import "VENViewController.h"
#import "VENSnowOverlayView.h"

@interface VENViewController ()

@end

@implementation VENViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    VENSnowOverlayView *snowOverlay = [[VENSnowOverlayView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:snowOverlay];
    [snowOverlay beginSnowAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
