//
//  SimpleCalculator.h
//  Calculator
//
//  Created by 方舟 on 15/5/6.
//  Copyright (c) 2015年 方舟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@interface SimpleCalculator : Calculator
//在简单计算中，将存放数字与运算符的数组看作队列

@property (nonatomic) NSInteger indicator;  //各种情况指示：0——初始化，1——键入数字后，2——键入运算符后，3——按“=”后

//-(instancetype)init;
-(void)addNum:(NSString *)num;
-(void)addSign:(NSString *)sign;
-(void)calculating;
-(void)clear;

@end
