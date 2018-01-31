//
//  Custom_GR.m
//  UIGestureRecognizer_Xuly_DaCham
//
//  Created by Trúc Phương >_< on 30/01/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Custom_GR.h"

@interface Custom_GR ()

@end

@implementation Custom_GR

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imgView.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imgView];
// tao mat la Mask
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    imgView.layer.mask = maskLayer;
    self.maskLayer = maskLayer;
// create shape layer for circle we'll draw on top of image (the boundary of the circle)

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.lineWidth = 3.0;
    circleLayer.fillColor = [[UIColor clearColor] CGColor];
    circleLayer.strokeColor = [[UIColor blackColor] CGColor];
    [imgView.layer addSublayer:circleLayer];
    self.circleLayer = circleLayer;
 // create circle path
    [self updateCirclePathAtLocation:CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height/ 2.0) radius:self.view.bounds.size.width * 0.30];

#pragma marka ddGestureRecognizer
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    [imgView addGestureRecognizer: pinch];
    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [imgView addGestureRecognizer: pan];
    imgView.userInteractionEnabled = YES;
    imgView.multipleTouchEnabled = YES;
    pan.delegate = self;
    pinch.delegate = self;
    
    
    
}
-(void)onPinch:(UIPinchGestureRecognizer*)GestureRecognizer{
    static CGFloat oldRadius;
    CGFloat newRadius;
    CGFloat scale = GestureRecognizer.scale;
    if (GestureRecognizer.state == UIGestureRecognizerStateBegan || GestureRecognizer.state == UIGestureRecognizerStateChanged) {
        oldRadius = self.circleRadius;
        newRadius = oldRadius * scale;
        [self updateCirclePathAtLocation:self.circleCenter radius:newRadius];
    }
    
    
}

-(void)onPan:(UIPanGestureRecognizer*)GestureRecognizer{
    
    if (GestureRecognizer.state == UIGestureRecognizerStateBegan || GestureRecognizer.state == UIGestureRecognizerStateChanged) {
        [self updateCirclePathAtLocation:[GestureRecognizer locationInView:GestureRecognizer.view] radius:_circleRadius];

    }
}


- (void)updateCirclePathAtLocation:(CGPoint)location radius:(CGFloat)radius // ban kinh
{
    self.circleCenter = location;
    self.circleRadius = radius;
    if (radius <5 || radius > self.view.frame.size.height) {
        self.circleRadius=self.view.bounds.size.width * 0.3;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];   // tao 1 duong cong tra ve 1 duong cong
    [path addArcWithCenter:self.circleCenter    // tam
                    radius:self.circleRadius    // ban kinh
                startAngle:0.0
                  endAngle:M_PI * 2.0           // 2pi
                 clockwise:YES];                // theo kim dong ho
    
    self.maskLayer.path = [path CGPath];
    self.circleLayer.path = [path CGPath];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    if ((gestureRecognizer == pan   && otherGestureRecognizer == pinch) ||
        (gestureRecognizer == pinch && otherGestureRecognizer == pan))
    {
        return YES;
    }
    
    return NO;
}

@end
// https://stackoverflow.com/questions/20165906/how-to-crop-image-inside-the-circle-in-uiimageview-in-ios
