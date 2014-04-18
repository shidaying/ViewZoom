//
//  SLHRootViewController.m
//  缩放动画效果
//
//  Created by hour on 14-4-17.
//  Copyright (c) 2014年 上海思墨信息科技有限公司. All rights reserved.
//

#import "SLHRootViewController.h"
#import "SLHSecondViewController.h"
@interface SLHRootViewController ()
{
    SLHTestView *myTestView;
    NSTimer *myTimer;
}
@end

@implementation SLHRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(increaseMyTestViewSize:) userInfo:nil repeats:YES];
    [myTimer setFireDate:[NSDate distantFuture]];//停止定时器
    
    
    myTestView = [[SLHTestView alloc] initWithFrame:CGRectMake(50, 50, 120, 160)];
    myTestView.center = self.view.center;
    myTestView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myTestView];
    
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"缩放",@"next page", nil];
    for (int i=0; i<2; i++)
    {
        UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        actionBtn.backgroundColor = [UIColor brownColor];
        actionBtn.tag = 10 + i;
        actionBtn.frame = CGRectMake(0 + i*(SCREEN_WIDTH - 100), SCREEN_HEIGHT - 60, 100, 60);
        [actionBtn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        
        [actionBtn addTarget:self action:@selector(actionBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:actionBtn];
    }
    
}
#pragma mark -btn press
- (void)actionBtnPress:(UIButton*)sender
{
    if (sender.tag == 10) {
        CGRect testViewBiggestFrame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 60 - 20);
        if (CGRectEqualToRect(testViewBiggestFrame, myTestView.frame)) {
            myTestView.frame = CGRectMake(50, 50, 120, 160);
            myTestView.center = self.view.center;
        } else {
            [myTimer setFireDate:[NSDate distantPast]];//开启定时器
        }
    } else {
        SLHSecondViewController *secondVC = [[SLHSecondViewController alloc] init];
        [self presentViewController:secondVC animated:YES completion:nil];
    }
    
    
}
- (void)increaseMyTestViewSize:(NSTimer*)timer
{
    if (myTestView.frame.size.width >= SCREEN_WIDTH || myTestView.frame.size.height >= SCREEN_HEIGHT - 20) {
        myTestView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT -60 - 20);
        [timer setFireDate:[NSDate distantFuture]];//关闭定时器
    } else {
        CGFloat newWidth;
        CGFloat newHeight;
        if (RATE == 16/9) {
            newWidth =  myTestView.frame.size.width * 34/25;
            newHeight = myTestView.frame.size.height * 41/25;
        } else {
            newWidth =  myTestView.frame.size.width * 11/7;
            newHeight = myTestView.frame.size.height * 10/7;
        }
        myTestView.frame = CGRectMake(0, 20, newWidth, newHeight);
        myTestView.center = self.view.center;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
