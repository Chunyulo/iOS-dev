//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Chunyu on 14-12-3.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic,strong) NSMutableArray *operandStack;

@end

@implementation CalculatorBrain

@synthesize operandStack ;// = _operandStack;


-(NSMutableArray *)operandStack{
    if(!operandStack){
        operandStack = [[NSMutableArray alloc] init];
    }
    return operandStack;
}

-(void)setOperandStack:(NSMutableArray *)anArray{
    operandStack = anArray;
}

-(void)pushOperand:(double)operand{
    NSLog(@"The value in operandStack now push is %@",[NSString stringWithFormat:@"%g",operand]);
    
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
    NSLog(@"The oeprand stack size is %@",[NSString stringWithFormat:@"%lu",self.operandStack.count]);
    //for( NSDictionary *dic in self.operandStack)
 
}

-(double) popOperand{
    
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    NSLog(@"the operand poped is %@",[NSString stringWithFormat:@"%g",[operandObject doubleValue]]);
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *) operation{
    double result = 0;
    
    NSLog(@"opertion value is %@",operation);
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }else if([operation isEqualToString:@"-"]){
        double subtrahend = [self popOperand];
        NSLog(@"element poped is %@",[NSString stringWithFormat:@"%g",subtrahend]);
        result = [self popOperand] - subtrahend;
    }else if([operation isEqualToString:@"*"]){
        result = [self popOperand] * [self popOperand];
    }else if([operation isEqualToString:@"/"]){
        double divisor = [self popOperand];
        if(divisor)
            result = [self popOperand] / divisor;
    }
    
    [self pushOperand:result];
    
    NSLog(@"the calculate result is %@",[NSString stringWithFormat:@"%g",result]);
    return result;
}

@end
