//
//  Header.m
//  bantangDemo
//
//  Created by 黄少华 on 16/1/22.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Header.h"

@implementation Header

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    if(self = [super init]){
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

@end
