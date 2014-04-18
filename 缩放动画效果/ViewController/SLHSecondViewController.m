
//
//  SLHSecondViewController.m
//  缩放动画效果
//
//  Created by hour on 14-4-17.
//  Copyright (c) 2014年 上海思墨信息科技有限公司. All rights reserved.
//

#import "SLHSecondViewController.h"
@interface SLHSecondViewController ()
{
    SLHTestView *myTestView;
}

@end

@implementation SLHSecondViewController

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
    myTestView = [[SLHTestView alloc] initWithFrame:CGRectMake(50, 50, 30, 40)];
    myTestView.backgroundColor = [UIColor redColor];
    myTestView.center=  self.view.center;
    [self.view addSubview:myTestView];
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"go back",@"缩放", nil];
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
- (void)actionBtnPress:(UIButton*)sender
{
    switch (sender.tag) {
        case 10:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 11:
        {
            [UIView animateWithDuration:0.5 animations:^(void){
                if (myTestView.frame.size.width == SCREEN_WIDTH) {
                    myTestView.center = self.view.center;
                    myTestView.frame = CGRectMake(50, 50, 30, 40);
                    myTestView.center = self.view.center;
                } else {
                    [UIView animateWithDuration:0.5 animations:^{
                        myTestView.center = self.view.center;
                        myTestView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20 - 60);
                    }];
                }
            }];
        }
        default:
            break;
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
