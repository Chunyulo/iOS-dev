//
//  CommentViewController.m
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/11.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.commentText animateWithWords:@[
                                           @"我的爱不会因任何人而动摇",
                                           @"我的爱根本不可能动摇",
                                           @"因为，",
                                           @"我是一棵树 ，",
                                           @"只有把根扎在你心里才能活下去",
                                           @"这是一部小说",
                                           @"更是生活的一部分"
                                           ]
                             forDuration:3.0f
                           withAnimation:ATAnimationTypeSlideTopInBottomOut];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
