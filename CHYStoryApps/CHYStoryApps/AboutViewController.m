//
//  AboutViewController.m
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/11.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self moveLogo];
    // Do any additional setup after loading the view.
}

- (void)moveLogo
{
    /*
     layer.backgroundColor = [UIColor cyanColor].CGColor; // 给图层添加背景色
     layer.contents = (id)[UIImage imageNamed:@"view_BG.png"].CGImage; // 给图层添加背景图片
     layer.cornerRadius = 8;  // 将图层的边框设置为圆脚
     layer.masksToBounds = YES; // 隐藏边界
     layer.borderWidth = 5;  // 给图层添加一个有色边框
     layer.borderColor = [UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:1].CGColor;
     layer.shadowOffset = CGSizeMake(0, 3);  // 设置阴影的偏移量
     layer.shadowRadius = 10.0;  // 设置阴影的半径
     layer.shadowColor = [UIColor blackColor].CGColor; // 设置阴影的颜色为黑色
     layer.shadowOpacity = 0.9; // 设置阴影的不透明度
     */
    CALayer *kkLayer = [[CALayer alloc]init];
    
    kkLayer.contents = (id)[UIImage imageNamed:@"icon_bg@2x.png"].CGImage;
    kkLayer.masksToBounds = NO;
    /*kkLayer.shadowOffset = CGSizeMake(0, 3);
     kkLayer.shadowRadius = 10.0;
     kkLayer.shadowColor = [UIColor blackColor].CGColor;*/
    //kkLayer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_bg@2x.png"]];//[[UIColor redColor]CGColor];
    kkLayer.frame = CGRectMake(140, 60, 40, 40);
    kkLayer.cornerRadius = 8;
    [self.view.layer addSublayer:kkLayer];
    
    // 移动kkLayer的position
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position;
    toPoint.y += 200;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    // 以x轴进行旋转
    CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    
    // 对kkLayer进行放大缩小
    CABasicAnimation *scaleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 3;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    //
    CABasicAnimation *_anim1 = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    _anim1.duration = 1.f;
    _anim1.fromValue = [NSNumber numberWithFloat:0.5];
    _anim1.toValue = [NSNumber numberWithFloat:1];
    
    _anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    _anim1.repeatCount = CGFLOAT_MAX;
    _anim1.autoreverses = YES;
    
    //
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    anim.duration = 1.f;
    anim.toValue = (id)[UIColor redColor].CGColor;
    anim.fromValue =  (id)[UIColor blackColor].CGColor;
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount = CGFLOAT_MAX;
    anim.autoreverses = YES;
    
    // 把上面的动画组合起来
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.autoreverses = YES;  // 完成后反向完成
    group.duration = 3.0;
    group.animations = [NSArray arrayWithObjects:animation,rotateAnimation, scaleAnimation, anim, _anim1, nil];
    
    group.repeatCount = NSNotFound;
    
    group.fillMode = kCAFillModeForwards;
    
    [kkLayer addAnimation:group forKey:@"kkLayerMove"];
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
