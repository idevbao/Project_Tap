//
//  Custom_GR.h
//  UIGestureRecognizer_Xuly_DaCham
//
//  Created by Trúc Phương >_< on 30/01/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom_GR : UIViewController<UIGestureRecognizerDelegate>{
 UIImageView * imgView;
    NSTimer * timer;
    UIPanGestureRecognizer * pan;  // keo the
    UISwipeGestureRecognizer * swipe; // keo nhanh 4 huong
    UITapGestureRecognizer * tap ;
    UIPinchGestureRecognizer * pinch;

}
@property (nonatomic, weak) CAShapeLayer *maskLayer; // lop mat na
@property (nonatomic, weak) CAShapeLayer *circleLayer; // vong tron lop
@property (nonatomic) CGFloat circleRadius; // ban kinh
@property (nonatomic) CGPoint circleCenter; // tam vong tron
@property (nonatomic) CGPoint newcircleCenter;

@end
