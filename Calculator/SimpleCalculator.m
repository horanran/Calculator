//
//  SimpleCalculator.m
//  Calculator
//
//  Created by 方舟 on 15/5/6.
//  Copyright (c) 2015年 方舟. All rights reserved.
//

#import "SimpleCalculator.h"

@implementation SimpleCalculator

-(void)addNum:(NSString *)num
{
    NSMutableString *n = [[NSMutableString alloc] initWithString:num];
//    NSLog(@"n = %@, indicator = %li",n,(long)self.indicator);
    switch (self.indicator) {
        case 0:
            [self.sequence addObject:n];
            
            break;
        case 1:
            if([[self.sequence lastObject] isEqualToString:@"0"] && ![num isEqualToString:@"."])
                [self.sequence replaceObjectAtIndex:[self.sequence count]-1 withObject:n];
            else
                [[self.sequence lastObject] appendString:n];
            break;
        case 2:
            [self.sequence addObject:n];
            break;
        case 3:
            [self.sequence removeAllObjects];
            [self.sequence addObject:n];
            break;
        default:
            break;
    }
    self.indicator = 1;
//    NSLog(@"lastobject is %@,indicator is %li",[self.sequence lastObject],(long)self.indicator);
}

-(void)addSign:(id)sign
{
    NSMutableString *s = [[NSMutableString alloc] initWithString:sign];
    switch (self.indicator) {
        case 0:
            break;
        case 1:
            [self.sequence addObject:s];
            break;
        case 2:
            [self.sequence replaceObjectAtIndex:[self.sequence count]-1 withObject:s];
            break;
        case 3:
            [self.sequence addObject:s];
            break;
        default:
            break;
    }
    self.indicator = 2;
}

-(void)calculating
{
//    for (NSMutableString * s in self.sequence)
//        NSLog(@"%@",s);
    while([self.sequence count] > 1)
    {
        double a = [[self.sequence firstObject] doubleValue];
        [self.sequence removeObjectAtIndex:0];
        NSMutableString *sign = [self.sequence firstObject];
        [self.sequence removeObjectAtIndex:0];
        double b = [[self.sequence firstObject] doubleValue];
        double c;
        switch ([@[@"+",@"-",@"*",@"/"] indexOfObject:sign]) {
            case 0:
                c = a + b;
                break;
            case 1:
                c = a - b;
                break;
            case 2:
                c = a * b;
                break;
            case 3:
                c = a / b;
                break;
            default:
                break;
                
        }
//        NSLog(@"%lf",c);
        NSMutableString *result = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%lf",c]];
        [self.sequence replaceObjectAtIndex:0 withObject:result];
    }
    NSMutableString *noZeroResult = [self.sequence firstObject];
    if([noZeroResult containsString:@"." ] )
    {
        char lastChar = [noZeroResult characterAtIndex:[noZeroResult length]-1];
        while (lastChar == '0' || lastChar == '.') {
            NSRange range = {[noZeroResult length] - 1,1};
            [noZeroResult deleteCharactersInRange:range];
            lastChar = [noZeroResult characterAtIndex:[noZeroResult length]-1];
        }
    }
    if([[self.sequence firstObject]  isEqual: @""])
        [self.sequence replaceObjectAtIndex:0 withObject:@"0"];
    self.indicator = 3;
}

-(void)clear
{
    [self.sequence removeAllObjects];
    self.indicator = 0;
}

@end
