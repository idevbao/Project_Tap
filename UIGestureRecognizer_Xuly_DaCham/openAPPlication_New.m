//
//  openAPPlication_New.m
//  UIGestureRecognizer_Xuly_DaCham
//
//  Created by Trúc Phương >_< on 31/01/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "openAPPlication_New.h"

@interface openAPPlication_New ()

@end

@implementation openAPPlication_New

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *openAppURL = @"fb://";
    NSString *mapsAppURL = @"maps://";
    
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:openAppURL]];
    
    NSString *url = canOpenURL ? openAppURL : mapsAppURL; // neu yes thi open app ko thi open maps
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
// Also, starting at iOS 9 you must include LSApplicationQueriesSchemes in your info.plist. fb
}


@end
