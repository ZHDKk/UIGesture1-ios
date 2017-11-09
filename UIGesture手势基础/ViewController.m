//
//  ViewController.m
//  UIGesture手势基础
//
//  Created by zh dk on 2017/8/23.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"2.jpg"];
    imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(50, 80, 200, 300);
    [self.view addSubview:imageView];
    imageView.tag = 101;
    
    
    imageView.userInteractionEnabled = YES;//开启手势事件响应开关
    
    //创建一个单击手势对象；是被点击手势事件
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnact:)];
    
    
    //表示手势识别事件的事件类型：几次点击时触发，1表示1次点击，2表示2次点击
    tapgesture.numberOfTapsRequired = 1;
    
    //表示几个手指点击时触发此事件
    tapgesture.numberOfTouchesRequired = 1;
    
    //将点击事件添加到视图中,视图即可响应事件
    [imageView addGestureRecognizer:tapgesture];
    
    //创建双击手势
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwo:)];
    
    tapTwo.numberOfTapsRequired = 2;
    tapTwo.numberOfTouchesRequired = 1;
    
    [imageView addGestureRecognizer:tapTwo];
    
    //当单击操作遇到双击操作时，单击操作失效
    [tapgesture requireGestureRecognizerToFail:tapTwo];
}

-(void) tapTwo:(UIGestureRecognizer*)tap
{
    UIImageView *imageView  = (UIImageView*) tap.view;
    
    [UIView beginAnimations:nil context:nil];
    
     [UIView setAnimationDuration:1];
    imageView.frame = CGRectMake(50, 80, 200 , 300);
    
    [UIView commitAnimations];
}

-(void) tapOnact:(UIGestureRecognizer*)tap
{
    //获取手势监控的视图对象
    UIImageView *imageView = (UIImageView*)tap.view;
    //开启一个动画
    [UIView beginAnimations:nil context:nil];
    //设置动画时间
    [UIView setAnimationDuration:1];
    //图片放大
    imageView.frame = CGRectMake(50, 80, 300, 450);
    //关闭动画
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
