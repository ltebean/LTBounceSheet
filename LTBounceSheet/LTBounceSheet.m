//
//  TestView.m
//  ViewTest
//
//  Created by ltebean on 14-9-1.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTBounceSheet.h"

#define duration 0.55

#define sideViewDamping 0.87
#define sideViewVelocity 10

#define centerViewDamping 1.0
#define centerViewVelocity 8

@interface LTBounceSheet()
@property(nonatomic,strong) UIView* sideHelperView;
@property(nonatomic,strong) UIView* centerHelperView;
@property(nonatomic,strong) CADisplayLink *displayLink;
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) UIColor *bgColor;
@property BOOL shown;
@property int counter;
@property CGFloat height;
@end

@implementation LTBounceSheet

- (id) initWithHeight:(CGFloat) height bgColor:(UIColor*) color;
{
    self.height=height;
    self.bgColor=color;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = CGRectGetWidth(screenRect);
    CGFloat screenHeight = CGRectGetHeight(screenRect);
    
    self=[super initWithFrame:CGRectMake(0, screenHeight-height, screenWidth, height)];
    if(self){
        
        self.counter = 0;
        
        self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, height)];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, self.height);
        [self addSubview:self.contentView];
        
        self.sideHelperView = [[UIView alloc] initWithFrame:CGRectMake(0, height, 0, 0)];
        self.sideHelperView.backgroundColor=[UIColor blackColor];
        [self addSubview:self.sideHelperView];
        
        
        self.centerHelperView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth/2, height, 0, 0)];
        self.centerHelperView.backgroundColor=[UIColor blackColor];
        [self addSubview:self.centerHelperView];
        
        self.backgroundColor=[UIColor clearColor];
        
    }
    return self;
}

-(void) addView:(UIView *)view
{
    NSLog(@"My view frame: %@", NSStringFromCGRect(view.frame));
    [self.contentView addSubview:view];
}

-(void) toggle
{
    if(self.counter!=0){
        return;
    }
    if(self.shown){
        [self hide];
    }else{
        [self show];
    }
}

-(void) show
{
    self.shown=YES;
    [self start];
    [self animateSideHelperViewToPoint:CGPointMake(self.sideHelperView.center.x, 0)];
    [self animateCenterHelperViewToPoint: CGPointMake(self.centerHelperView.center.x, 0)];
    [self animateContentViewToHeight:0];
    
}

-(void) hide
{
    self.shown=NO;
    [self start];
    CGFloat height = CGRectGetHeight(self.bounds);
    
    [self animateSideHelperViewToPoint:CGPointMake(self.sideHelperView.center.x, height)];
    [self animateCenterHelperViewToPoint: CGPointMake(self.centerHelperView.center.x, height)];
    [self animateContentViewToHeight:self.height];
    
}

-(void) animateSideHelperViewToPoint:(CGPoint) point
{
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:sideViewDamping initialSpringVelocity:sideViewVelocity options:0 animations:^{
        self.sideHelperView.center = point;
    } completion:^(BOOL finished) {
        [self complete];
        
    }];
}


-(void) animateCenterHelperViewToPoint:(CGPoint) point
{
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:centerViewDamping initialSpringVelocity:centerViewVelocity options:0 animations:^{
        self.centerHelperView.center = point;
        
    } completion:^(BOOL finished) {
        [self complete];
    }];
}

-(void) animateContentViewToHeight:(CGFloat) height
{
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:centerViewDamping initialSpringVelocity:centerViewVelocity options:0 animations:^{
        self.contentView.transform = CGAffineTransformMakeTranslation(0, height);
    } completion:^(BOOL finished) {
    }];
}




-(void) tick:(CADisplayLink*) displayLink
{
    //NSLog(@"%@", NSStringFromCGPoint(self.centerHelperView.center));
    [self  setNeedsDisplay];
}

-(void) start
{
    if (self.displayLink == nil) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                               forMode:NSDefaultRunLoopMode];
        self.counter=2;
    }
}

-(void) complete
{
    self.counter--;
    if(self.counter==0){
        [self.displayLink invalidate];
        self.displayLink = nil;
        
    }
}
- (void)drawRect:(CGRect)rect
{
    if(self.counter==0){
        return;
    }
    CALayer* sideLayer=self.sideHelperView.layer.presentationLayer;
    CGPoint sidePoint=sideLayer.frame.origin;
    
    CALayer* centerLayer =self.centerHelperView.layer.presentationLayer;
    CGPoint centerPoint=centerLayer.frame.origin;
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    [self.bgColor setFill];
    
    [path moveToPoint:sidePoint];
    [path addQuadCurveToPoint:CGPointMake(320, sidePoint.y) controlPoint:centerPoint];
    [path addLineToPoint:CGPointMake(320, CGRectGetHeight(self.bounds))];
    [path addLineToPoint:CGPointMake(0, CGRectGetHeight(self.bounds))];
    [path closePath];
    
    [path fill];
}


@end
