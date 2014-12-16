//
//  AnimationViewController.m
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/12.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor colorWithRed:0 green:0.0 blue:0.0 alpha:1.0].CGColor;
    //[self moveTransition:(nil)];
    [self snow];
    //[self animationSnow];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animationSnowInx:(int)px Iny:(int)py{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    //发射位置
    snowEmitter.emitterPosition = CGPointMake(px,py);
    //发射源的尺寸大小
    snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width ,self.view.bounds.size.height);
    
    //发射模式
    snowEmitter.emitterMode = kCAEmitterLayerOldestLast;
    snowEmitter.renderMode = kCAEmitterLayerAdditive;
    //发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerPoint;
    snowEmitter.preservesDepth = YES;
    
    //创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake.name = @"snow";
    snowflake.alphaRange = 1;
    snowflake.alphaSpeed = 3;
    snowflake.scale = 0.8;
    snowflake.scaleRange = 0.3;
    //snowflake.scaleSpeed = 4;
    //粒子参数的速度乘数因子
    snowflake.birthRate = 100.0;
    snowflake.lifetime = 1.0;
    snowflake.lifetimeRange = 0.5;
    //粒子速度
    snowflake.velocity =100.0;
    //粒子的速度范围
    snowflake.velocityRange = 100;
    //粒子y方向的加速度分量
    snowflake.yAcceleration = 4;
    snowflake.xAcceleration = 2;
    snowflake.zAcceleration = 3;
    //周围发射角度
    snowflake.emissionRange =   M_PI;
    //子旋转角度范围
    snowflake.spin = 3;
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (id)[[UIImage imageNamed:@"spark"] CGImage];
    //设置雪花形状的粒子的颜色
    snowflake.color = [[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.000] CGColor];
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    snowEmitter.shadowColor = [[UIColor redColor] CGColor];
    
    snowEmitter.emitterCells = [NSArray arrayWithObjects:snowflake,nil];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //CALayer *layer = self.view.layer;
   // NSLog(@"%i",[layer.sublayers count]);
    //[[self.view.layer.sublayers objectAtIndex:0] removeFromSuperlayer];
    [self moveTransition:(nil)];
    UITouch *touch=[touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    //[self testIn:touchPoint.x Iny:touchPoint.y];
    //[self animationSnowInx:touchPoint.x Iny:touchPoint.y];
    //[self fireWorke];
    //[self snow];
    NSLog(@"%f==%f",touchPoint.x,touchPoint.y);
    int stringFloat = (int)(touchPoint.x);
    int stringFloat1 = (int)(touchPoint.y);
    NSLog(@"%i%i",stringFloat,stringFloat1);
}
/*
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    //CGPoint touchPoint = [touch locationInView:self.view];
    [self fireWorke];
    //[self animationSnowInx:touchPoint.x Iny:touchPoint.y];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)snow{
    
    self.view.backgroundColor  = [UIColor blackColor];
    
    // 创建粒子Layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    // 粒子发射位置
    snowEmitter.emitterPosition = CGPointMake(120,20);
    
    // 发射源的尺寸大小
    snowEmitter.emitterSize = self.view.bounds.size;
    
    // 发射模式
    snowEmitter.emitterMode = kCAEmitterLayerSurface;
    
    // 发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 1.0;
    snowflake.lifetime = 120.0;
    
    // 粒子速度
    snowflake.velocity =10.0;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    
    // 子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (id)[[UIImage imageNamed:@"spark"] CGImage];
    
    // 设置雪花形状的粒子的颜色
    snowflake.color = [[UIColor whiteColor] CGColor];
    
    snowflake.scaleRange = 0.6f;
    snowflake.scale = 0.7f;
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 0.0);
    
    // 粒子边缘的颜色
    snowEmitter.shadowColor = [[UIColor whiteColor] CGColor];
    
    // 添加粒子
    snowEmitter.emitterCells = @[snowflake];
    
    // 将粒子Layer添加进图层中
    [self.view.layer addSublayer:snowEmitter];
}

- (IBAction)moveTransition:(id)sender {
    CATransition *animation = [CATransition animation];
    [animation setDuration:3];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:kCATransitionFromTop];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4.png"] ] ;
    [self.view.layer addAnimation:animation forKey:nil];
}
@end
