//
//  TouchSnow.m
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/15.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "TouchSnow.h"

@implementation TouchSnow

-(void)setupInx:(float)px Iny:(float)py InView:(UIView *)view{
        CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
        //发射位置
        snowEmitter.emitterPosition = CGPointMake(px,py);
        //发射源的尺寸大小
        snowEmitter.emitterSize = CGSizeMake(view.bounds.size.width ,view.bounds.size.height);
        
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
        [view.layer insertSublayer:snowEmitter atIndex:0];

}
-(void)animate{
    //[self setup];
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        [self stop];
    });
}

-(void)stop{

}

@end
