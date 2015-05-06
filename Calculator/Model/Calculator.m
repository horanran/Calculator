//
//  Calculator.m
//  Calculator
//
//  Created by 方舟 on 15/5/4.
//  Copyright (c) 2015年 方舟. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(NSMutableArray *)sequence
{
    if(!_sequence)
        _sequence = [[NSMutableArray alloc] init];
    return _sequence;
}

@end
