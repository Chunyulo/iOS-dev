//
//  AnimationFireworkViewController.m
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/15.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "AnimationFireworkViewController.h"

@interface AnimationFireworkViewController ()

@end

@implementation AnimationFireworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor colorWithRed:0 green:0.0 blue:0.0 alpha:1.0].CGColor;
    [self fireWorke];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    [self animationSnowInx:touchPoint.x Iny:touchPoint.y];
}

-(void)fireWorke{
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition =
    CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    
    fireworksEmitter.emitterSize    = CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode    = kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape    = kCAEmitterLayerLine;
    fireworksEmitter.renderMode        = kCAEmitterLayerAdditive;
    fireworksEmitter.seed = (arc4random()%100)+1;
    
    
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate        = 1.0;
    rocket.emissionRange    = 0.1 * M_PI;
    rocket.velocity         = 400;
    rocket.velocityRange    = 100;
    rocket.yAcceleration    = 75;
    rocket.lifetime         = 1.02;
    
    rocket.contents         = (id) [[UIImage imageNamed:@"spark"] CGImage];
    rocket.scale            = 0.2;
    rocket.color            = [[UIColor redColor] CGColor];
    rocket.greenRange       = 1.0;
    rocket.redRange         = 1.0;
    rocket.blueRange        = 1.0;
    rocket.spinRange        = M_PI;
    
    
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate           = 1.0;
    burst.velocity            = 0;
    burst.scale               = 2.5;
    burst.redSpeed            =-1.5;
    burst.blueSpeed           =+1.5;
    burst.greenSpeed          =+1.0;
    burst.lifetime            = 0.35;
    

    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate           = 400;
    spark.velocity            = 125;
    spark.emissionRange       = 2* M_PI;
    spark.yAcceleration       = 75;
    spark.lifetime            = 3;
    
    spark.contents            = (id) [[UIImage imageNamed:@"spark"] CGImage];
    spark.scaleSpeed          =-0.2;
    spark.greenSpeed          =-0.1;
    spark.redSpeed            = 0.4;
    spark.blueSpeed           =-0.1;
    spark.alphaSpeed          =-0.25;
    spark.spin                = 2* M_PI;
    spark.spinRange           = 2* M_PI;
    
    fireworksEmitter.emitterCells    = [NSArray arrayWithObject:rocket];
    rocket.emitterCells              = [NSArray arrayWithObject:burst];
    burst.emitterCells               = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
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
    snowEmitter.name = @"snowLayer";
    
    //创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake.name = @"snow";
    snowflake.alphaRange = 1;
    snowflake.alphaSpeed = 3;
    snowflake.scale = 0.3;
    snowflake.scaleRange = 0.3;
    //snowflake.scaleSpeed = 4;
    //粒子参数的速度乘数因子
    snowflake.birthRate = 30.0;
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
    snowflake.emissionRange =   2*M_PI;
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
    NSLog(@"start");
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.001 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        //snowflake.birthRate = 0;
        NSLog(@"ended");
        NSArray *l = self.view.layer.sublayers;
        for(int i = 0;i<[l count];i++){
            CALayer *tl = [l objectAtIndex:i];
            //NSLog(@"%@",tl.);
            NSLog(@"This is %i is %@",i,[l objectAtIndex:i]);
        }
        CALayer *layer = [self.view.layer.sublayers objectAtIndex:0];
        [layer setValue:@0 forKeyPath:@"emitterCells.snow.birthRate"];
        NSLog(@"%@",layer);
    });
    
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
