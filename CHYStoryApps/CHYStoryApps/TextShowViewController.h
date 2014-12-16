//
//  TextShowViewController.h
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/11.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextShowViewController : UIViewController
- (IBAction)prevButton:(id)sender;
- (IBAction)nextButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pageText;
@property (weak, nonatomic) IBOutlet UIProgressView *readProgress;
@property (weak, nonatomic) IBOutlet UILabel *percentageOfRead;

@end
