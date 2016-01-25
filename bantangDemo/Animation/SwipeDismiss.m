//
//  SwipeDismiss.m
//  bantangDemo
//
//  Created by 黄少华 on 16/1/22.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "SwipeDismiss.h"

@interface SwipeDismiss()
@property (nonatomic, assign) BOOL shouldComplete;

@property (nonatomic, strong) UIViewController *presentingVC;
@end
@implementation SwipeDismiss

- (void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self addGestureToView:viewController.view];
}

- (void)addGestureToView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint translation = [pan translationInView:pan.view.superview];
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interacting = YES;
            [self.presentingVC.navigationController popViewControllerAnimated:YES];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGFloat distanse = translation.y / 400.0;
            
            distanse = MIN(MAX(distanse, 0.0), 1.0);
            
            self.shouldComplete = (distanse > 0.5);
            
            [self updateInteractiveTransition:distanse];
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.interacting = NO;
            if (!self.shouldComplete || (pan.state == UIGestureRecognizerStateCancelled)) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }

}

@end
