//
//  LTBounceSheet.h
//  LTBounceSheet
//
//  Created by ltebean on 14-9-3.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTBounceSheet : UIView
- (id) initWithHeight:(CGFloat) height bgColor:(UIColor*) color;
-(void) addView:(UIView*) view;
-(void) show;
-(void) hide;
-(void) toggle;

@end
