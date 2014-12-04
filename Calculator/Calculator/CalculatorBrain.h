//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Chunyu on 14-12-3.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *) operation;

@end
