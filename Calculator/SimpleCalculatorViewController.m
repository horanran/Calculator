//
//  ViewController.m
//  Calculator
//
//  Created by 方舟 on 15/5/4.
//  Copyright (c) 2015年 方舟. All rights reserved.
//

#import "SimpleCalculatorViewController.h"
#import "SimpleCalculator.h"


@interface ViewController ()

@property (strong,nonatomic) SimpleCalculator *simplecalculator;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;


@end

@implementation ViewController

-(SimpleCalculator *)simplecalculator
{
    if(!_simplecalculator)
        _simplecalculator = [[SimpleCalculator alloc] init];
    return _simplecalculator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numButton:(UIButton *)sender {
    [self.simplecalculator addNum:sender.currentTitle];
    [self updateUI];
}

- (IBAction)signButton:(UIButton *)sender {
    [self.simplecalculator addSign:sender.currentTitle];
    [self updateUI];
}

- (IBAction)resultButton {
    [self.simplecalculator calculating];
    [self updateUI];
}

- (IBAction)clearButton {
    [self.simplecalculator clear];
    [self updateUI];
}

-(void)updateUI
{
    if([self.simplecalculator.sequence count])
        self.displayLabel.text = [self.simplecalculator.sequence lastObject];    
    else
        self.displayLabel.text = @"0";
}

@end
