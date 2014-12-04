//
//  ViewController.h
//  Calculator
//
//  Created by Chunyu on 14-12-3.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)digitPressed:(UIButton *)sender;

- (IBAction)oeprationPressed:(UIButton *)sender;

- (IBAction)enterPressed;

- (IBAction)clearPressed;

@end

