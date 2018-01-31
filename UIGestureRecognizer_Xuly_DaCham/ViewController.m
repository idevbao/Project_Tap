//
//  ViewController.m
//  UIGestureRecognizer_Xuly_DaCham
//
//  Created by Trúc Phương >_< on 29/01/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "ViewController.h"
#define degreesToRadian(x)  (M_PI* (x) /180.0)
@interface ViewController ()

@end

@implementation ViewController
UIImageView * imgPan, * imgPoint, * imgPinCh , *img;
NSTimer * timer;
CGFloat i,  Velocity;

- (void)viewDidLoad {
    [super viewDidLoad];
//    tap
//    self.view.userInteractionEnabled = YES;
//    self.view.multipleTouchEnabled = YES;
//    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
//    [self.view addGestureRecognizer:tapGest];
//    }
    
//    Pan
//    imgPan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"funny.jpg"]];
//    [self.view addSubview:imgPan];
//    imgPan.center = CGPointMake(100, 200);
//    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
//    [imgPan addGestureRecognizer:pan];
//    imgPan.userInteractionEnabled = YES;
//    
//    imgPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"funny.jpg"]];
//    [self.view addSubview:imgPoint];
//    imgPoint.center = CGPointMake(self.view.frame.size.height/2, self.view.frame.size.width/2);

    img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left"]];
    [self.view addSubview:img];
    img.frame= CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 100,100);
    img.multipleTouchEnabled = YES;
    img.userInteractionEnabled = YES;
    UIRotationGestureRecognizer * rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotate:)];
    [img addGestureRecognizer:rotate];
    
    
}

-(void)onRotate:(UIRotationGestureRecognizer*)GR{
    if (GR.state == UIGestureRecognizerStateChanged||GR.state == UIGestureRecognizerStateBegan) {
        GR.view.transform = CGAffineTransformRotate(GR.view.transform,GR.rotation);
        i = GR.rotation;
    

    }if (GR.state == UIGestureRecognizerStateRecognized) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:GR.velocity target:self selector:@selector(loop) userInfo:nil repeats:true];

        
    }
}
-(void)loop{
    i--;

    img.transform = CGAffineTransformRotate(img.transform,i);
    NSLog(@"-----%f----",i);
    if (i<=0) {
        [timer invalidate];
        timer = nil;
    }
    
}







-(void)onPinCH:(UIPinchGestureRecognizer*)pinCH{
    if (pinCH.state == UIGestureRecognizerStateChanged||pinCH.state == UIGestureRecognizerStateBegan) {
        [self AnchorPointChange:pinCH];
        imgPinCh.transform= CGAffineTransformScale(imgPinCh.transform,pinCH.scale, pinCH.scale);
        pinCH.scale = 1.0;
    }
}
-(void)AnchorPointChange:(UIGestureRecognizer*)GR{
//  viewIMG.layer.anchorPoint =(0.5,0.5) x/w y/h
//  anchorPointNew = pointZoom_img.x /w pointZoom_img.y/h
    UIView * viewIMG = GR.view;
    CGPoint pointZoom_img = [GR locationInView:viewIMG];  // diem cham can zoom
    viewIMG.layer.anchorPoint = CGPointMake(pointZoom_img.x/viewIMG.bounds.size.width, pointZoom_img.y/viewIMG.bounds.size.height);
// thay doi center superview
    CGPoint centerSuperView = [GR locationInView:viewIMG.superview];
    viewIMG.center = centerSuperView;
}






















-(void)onTap:(UIGestureRecognizer*)Tap_gest{
    CGPoint Point = [Tap_gest locationInView:self.view];
    UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"funny.jpg"]];
    img.center = Point;
    [self.view addSubview:img];
}

-(void)onPan:(UIPanGestureRecognizer*)aPan{
    if (aPan.state == UIGestureRecognizerStateBegan || aPan.state == UIGestureRecognizerStateChanged) {
        
        imgPan.center = [aPan locationInView:self.view];
        [self bullEyeInTarget:imgPan.center];
    }
    
}
- (BOOL) bullEyeInTarget: (CGPoint) bullEyeCenter {
    CGFloat distanceDoubleSquare = powf(bullEyeCenter.x - imgPoint.center.x, 2) + powf(bullEyeCenter.y - imgPoint.center.y, 2);
    if (distanceDoubleSquare < 20) {
        NSLog(@"Match");
       
        return true;
    } else {
     
        return false;
    }
}


@end
