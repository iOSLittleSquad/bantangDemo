//
//  PushLikeModalAnimation.m
//  bantangDemo
//
//  Created by 黄少华 on 16/1/22.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "PushAnimaton.h"

@implementation PushAnimaton

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //1.获得目标控制器
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //2.给目标控制器设置初始的frame与结束frame
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVc];
    toVc.view.frame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);

    
    //3.把目标控制器view添加到动画容器
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    
    //4.开始执行动画
    NSTimeInterval timeInterval = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:timeInterval
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear animations:^{
                            toVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        //5.动画完成后告诉context动画已经完成
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
