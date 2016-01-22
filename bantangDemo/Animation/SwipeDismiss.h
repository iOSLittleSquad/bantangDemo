//
//  SwipeDismiss.h
//  bantangDemo
//
//  Created by 黄少华 on 16/1/22.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeDismiss : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
- (void)wireToViewController:(UIViewController*)viewController;

@end
