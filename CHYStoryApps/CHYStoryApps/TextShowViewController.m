//
//  TextShowViewController.m
//  CHYStoryApps
//
//  Created by Chunyu on 14/12/11.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import "TextShowViewController.h"

@interface TextShowViewController ()
{
    int _pageNO;
    int _curPageNO;
    NSMutableArray *file;
}
@end

@implementation TextShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readFile];
    [self showPageContext];
    UISwipeGestureRecognizer *leftSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(nextButton:)];
    leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *upSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(nextButton:)];
    leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:upSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(prevButton:)];
    rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
   
    UISwipeGestureRecognizer *downSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(prevButton:)];
    rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:downSwipeGesture];
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
- (void) showPageContext{
    self.pageText.numberOfLines = 0;
    self.pageText.text = [self->file objectAtIndex:_curPageNO];
    self.readProgress.progress = (double)(
    _curPageNO+1)/(double)_pageNO;
    self.percentageOfRead.text = [NSString stringWithFormat:@"%.2f%%",self.readProgress.progress*100];
    //self.pageText.text = @"// In a storyboard-based application, you will often want to do a little preparationbeforenavigation  // Get the new view controller using [segue destinat ionViewCon troller]";
}

- (void) readFile{
    file = [[NSMutableArray alloc] init];
    //NSFileManager * fm=[NSFileManager defaultManager];
    //NSData fileData=[fm contentsAtPath:@"story.text"];
    //NSString *testPath = [NSHomeDirectory() stringByAppendingPathComponent:@"story.txt"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"story" ofType:@"txt"];
    NSString *content=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //NSLog(@"%@",filePath);
    //NSLog(@"%@",content);
    //NSLog(@"%i",[content length]);
    _pageNO = (int)([content length])/300;
    if(_pageNO*300 < [content length])
        _pageNO += 1;
    
    for(int i = 0;i < _pageNO-1; i++){
        [file addObject:[content substringWithRange:NSMakeRange(i*300, 300)]];
    }
    
    
    _curPageNO = 0;
   // _pageNO = 4;
   /* [file addObject:@"1. 等待孩子如花般绽放1999年3月13日上午10点41分。漆成蓝和白的医院走廊里，一阵急促的脚步声打破了原有的寂静，两名护士和一个男人推着活动担架床向手术室飞奔而来，床上躺着一个即将手术的孕妇。那个男人，面容憔悴，神色疲惫，却掩不住俊秀的长相，无论在什么地方都是引人注目的。他的嘴唇已然干裂，仍不停地对躺在床上的女人小声喊着什么。女人紧紧抱住隆起的肚子，不时发出痛苦的呻吟声。她双眼紧闭，似乎已陷入半昏迷状态中了。"];
    [file addObject:@"男人细长的手指紧紧抓着女人瘦削的手。女人突然清醒过来，嘴唇吃力地蠕动着，像在说什么，男人赶忙把耳朵凑到她的嘴边。“叫我别担心？好，我不担心，你一定会没事的。我相信，你和我们的孩子一定能挺得住！”男人对着眼泪汪汪的女人点了点头，握住她的一只手。那手瘦骨嶙峋，像枯枝一样，好像只剩下了骨头。女人用另一只手摩挲着男人的手背，默默地深情凝望着他的脸，嘴角隐隐露出微笑。但突然间，她扭动身体，皱着眉头惨叫一声，似有一阵剧痛袭遍全身。"];
    [file addObject:@"男人哽咽了一下。“美姝呀！我……我……就呆在这里。别忘了。我在这儿守着，一切都会好的。知道吗？一定要加油啊！”女人紧紧咬住干裂的嘴唇，点了两下头。床被推进手术室的那一刻，男人无奈地松开女人的手，女人望着男人，视线模糊。男人咬紧牙关，努力做出坚强的表情，向着女人竖起拇指，脸上露出灿烂的笑容。女人突然神情无比慌张地欠起身子，向着男人伸出双手，男人赶忙朝着女人伸出的手跑了几步，但霎时间载着女人的担架床就消失在手术室门里边了。"];
    */[file addObject:@"Congratuations! Reading Completed"];
    
}

- (IBAction)prevButton:(id)sender {
    if(_curPageNO == 0) return;
    if(_curPageNO > 0) _curPageNO -= 1;
    [self showPageContext];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:NO];
    [UIView commitAnimations];
}

- (IBAction)nextButton:(id)sender {
    if(_curPageNO + 1 == _pageNO) return;
    if(_curPageNO + 1 < _pageNO) _curPageNO += 1;
    [self showPageContext];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:NO];
    [UIView commitAnimations];
}
@end
