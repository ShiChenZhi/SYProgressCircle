//
//  ViewController.m
//  SYProgressCircle
//
//  Created by shichenzhi on 2017/9/11.
//  Copyright © 2017年 shichenzhi. All rights reserved.
//

#import "ViewController.h"
#import "SYProgressCircle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SYProgressCircle *circle = [[SYProgressCircle alloc] initWithFrame:CGRectMake(375/2-100, 667/2-100, 200, 200)];
    circle.circleRadius = 10;
    circle.backgroundCircleLineWidth = 25;
    circle.precent = [NSString stringWithFormat:@"%d",66];
    circle.lineStrokeColor = [UIColor orangeColor];
    circle.fillColor = [UIColor lightGrayColor];
    [self.view addSubview:circle];
    
    [circle startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
