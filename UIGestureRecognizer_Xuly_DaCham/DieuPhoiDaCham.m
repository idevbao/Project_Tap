//
//  DieuPhoiDaCham.m
//  UIGestureRecognizer_Xuly_DaCham
//
//  Created by Trúc Phương >_< on 30/01/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "DieuPhoiDaCham.h"

@interface DieuPhoiDaCham ()<UIGestureRecognizerDelegate>

@end

@implementation DieuPhoiDaCham{
    UIImageView * imgView;
    NSTimer * timer;
    NSDate *thoidiemSwipeNhandang;
    
    UIPanGestureRecognizer * pan;  // keo the
    UISwipeGestureRecognizer * swipe; // keo nhanh 4 huong
    UITapGestureRecognizer * tap ;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left.png"]];
    imgView.center = CGPointMake(50, 50);
    [self.view addSubview: imgView];
    
    imgView.userInteractionEnabled = YES;
    imgView.multipleTouchEnabled = YES;
    
    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [imgView addGestureRecognizer:pan];
    pan.delegate = self;
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [imgView addGestureRecognizer:tap];
    tap.delegate = self;

    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    [imgView addGestureRecognizer:swipe];
    swipe.delegate = self;
    swipe.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    // swipe fail Recognizer: pan
#pragma mark requireGestureRecognizerToFail: Quyen UU TIEN
    // quyen uu tien
//    [pan requireGestureRecognizerToFail:swipe];

    

}
-(void)onTap:(UITapGestureRecognizer*)GRtap{
    if (GRtap.state== UIGestureRecognizerStateRecognized) {
        NSLog(@"_______Tap");
        
    }
    
}
-(void)onPan:(UIPanGestureRecognizer*)GRpan{
    if (GRpan.state== UIGestureRecognizerStateBegan || GRpan.state == UIGestureRecognizerStateChanged) {
        imgView.center =  [GRpan locationInView:self.view];
        NSLog(@"_______pan");
    }
}
-(void)onSwipe:(UISwipeGestureRecognizer*)GRswipe{
    if (GRswipe.state== UIGestureRecognizerStateRecognized) {
        NSLog(@"_______Swipe");
    }
}
#pragma mark  shouldRecognizeSimultaneouslyWithGestureRecognizer: nhan dong thoi 2 su kien nhap nhang
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    return true;
//}

#pragma mark shouldRequireFailureOfGestureRecognizer: Quyen UU TIEN
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    if ([gestureRecognizer isMemberOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isMemberOfClass:[UISwipeGestureRecognizer class]]) {
//        return true;
//    }else{
//        return false;
//    }
//}
#pragma mark shouldBeRequiredToFailByGestureRecognizer: gestureRecognizer fail nhan dang otherGestureRecognizer khong can thiet thang trc dc nhan dang hay ko ma uu tien thang  sau
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isMemberOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer isMemberOfClass:[UISwipeGestureRecognizer class]]) {
        return false;
    } else {
        return true;
    }
}

@end
