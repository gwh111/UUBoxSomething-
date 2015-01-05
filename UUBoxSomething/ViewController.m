//
//  ViewController.m
//  UUBoxSomething
//
//  Created by apple on 30/12/14.
//  Copyright (c) 2014年 ___GWH___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    float WIDTH=self.view.bounds.size.width;
    float HEIGHT=self.view.bounds.size.height;
    
    UIImageView *backImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    backImageView.image=[UIImage imageNamed:@"set_back.png"];
    [self.view addSubview:backImageView];
    
    UIButton *fanhuiButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 25, 50, 50)];
    [fanhuiButton setImage:[UIImage imageNamed:@"signin_bac.png"] forState:UIControlStateNormal];
    [self.view addSubview:fanhuiButton];
    [fanhuiButton addTarget:self action:@selector(fanhuiButton) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*30/667, self.view.bounds.size.width, 44)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.text=@"UU设置";
    [self.view addSubview:titleLabel];
    
    UILabel *connectLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*96/667, self.view.bounds.size.width, 44)];
    connectLabel.backgroundColor=[UIColor clearColor];
    connectLabel.textAlignment=NSTextAlignmentCenter;
    connectLabel.textColor=[UIColor whiteColor];
    connectLabel.text=@"正在连接";
    [self.view addSubview:connectLabel];
    
    UILabel *signalLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*64/75, HEIGHT*95/667, 44, 44)];
    signalLabel.backgroundColor=[UIColor clearColor];
    signalLabel.textColor=[UIColor whiteColor];
    signalLabel.text=@"良";
    [self.view addSubview:signalLabel];
    
    UILabel *dayLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*250/667, self.view.bounds.size.width, 100)];
    dayLabel.backgroundColor=[UIColor clearColor];
    dayLabel.textColor=[UIColor whiteColor];
    dayLabel.textAlignment=NSTextAlignmentCenter;
    dayLabel.font=[UIFont boldSystemFontOfSize:80];
    dayLabel.text=@"18";
    [self.view addSubview:dayLabel];
    
    UILabel *tianLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2, HEIGHT*270/667, 120, 100)];
    tianLabel.backgroundColor=[UIColor clearColor];
    tianLabel.textColor=[UIColor whiteColor];
    tianLabel.textAlignment=NSTextAlignmentCenter;
    tianLabel.text=@"天";
    [self.view addSubview:tianLabel];
    
    UILabel *endDateLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*320/667, self.view.bounds.size.width, 100)];
    endDateLabel.backgroundColor=[UIColor clearColor];
    endDateLabel.textColor=[UIColor whiteColor];
    endDateLabel.textAlignment=NSTextAlignmentCenter;
    endDateLabel.text=@"UU租金到期";
    [self.view addSubview:endDateLabel];
    NSLog(@"%f",WIDTH);
    
#warning set anything here
    //trans1是剩余容量[0,1]
    //trans2是剩余电量[0,1]
    float trans1=.4;
    float trans2=.4;
    UIImageView *cir1ImageView;
    UIImageView *cir2ImageView;
    if (trans1>0.1&&trans1<0.9) {
        cir1ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 146*WIDTH/375, self.view.bounds.size.width, self.view.bounds.size.width)];
        cir1ImageView.image=[UIImage imageNamed:@"mycir1.png"];
        [self.view addSubview:cir1ImageView];
    }
    
    if (trans2>0.1&&trans2<0.9) {
        cir2ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 146*WIDTH/375, self.view.bounds.size.width, self.view.bounds.size.width)];
        cir2ImageView.image=[UIImage imageNamed:@"mycir2.png"];
        [self.view addSubview:cir2ImageView];
    }
    
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, .5*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self rotateViewAnimated1:cir1ImageView withDuration:.3 byAngle:2*M_PI*trans1];
        [self rotateViewAnimated2:cir2ImageView withDuration:.3 byAngle:2*M_PI*trans2];
    });
    
    UIButton *tapButton1=[[UIButton alloc]initWithFrame:CGRectMake(5, HEIGHT*520/667, 100, 40)];
    [tapButton1 setTitle:@"旅游小贴士" forState:UIControlStateNormal];
    tapButton1.titleLabel.font=[UIFont systemFontOfSize:14];
    [tapButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:tapButton1];
    //    [tapButton1 addTarget:self action:@selector(tapButton1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *tapButton2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-110, HEIGHT*520/667, 110, 40)];
    [tapButton2 setBackgroundImage:[UIImage imageNamed:@"set_fee.png"] forState:UIControlStateNormal];
    [tapButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:tapButton2];
    
    UIButton *tapButton3=[[UIButton alloc]initWithFrame:CGRectMake(50, HEIGHT-75, 75, 75)];
    [tapButton3 setBackgroundImage:[UIImage imageNamed:@"scan.png"] forState:UIControlStateNormal];
    [tapButton3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tapButton3 addTarget:self action:@selector(tapButton3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tapButton3];
    
    UIButton *tapButton4=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-125, HEIGHT-75, 75, 75)];
    [tapButton4 setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [tapButton4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:tapButton4];
}

#pragma mark - animate1
- (void) rotateViewAnimated1:(UIView*)view
                withDuration:(CFTimeInterval)duration
                     byAngle:(CGFloat)angle
{
    [CATransaction begin];
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.byValue = [NSNumber numberWithFloat:angle];
    rotationAnimation.duration = duration;
    rotationAnimation.removedOnCompletion = YES;
    float WIDTH=self.view.bounds.size.width;
    float HEIGHT=self.view.bounds.size.height;
    float trans1=angle/2/M_PI;
    [CATransaction setCompletionBlock:^{
        view.transform = CGAffineTransformRotate(view.transform, angle);
        int a=self.view.bounds.size.width/2-WIDTH*84/375;
        int x=sinf( -trans1*M_PI*2)*a;
        int y=cosf( -trans1*M_PI*2)*a;
        //        UIImageView *circle1ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-WIDTH*1/15+y, 305+x, 50, 50)];
        //        circle1ImageView.center=CGPointMake(self.view.bounds.size.width/2+y, HEIGHT*333/667-x);
        //        circle1ImageView.image=[UIImage imageNamed:@"set_va.png"];
        //        [self.view addSubview:circle1ImageView];
        if (trans1>0.1&&trans1<0.9) {
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-WIDTH*1/15+y, 305+x, 150, 50)];
            label.center=CGPointMake(self.view.bounds.size.width/2+y, HEIGHT*333/667-x);
            label.textColor=[UIColor whiteColor];
            label.backgroundColor=[UIColor clearColor];
            label.textAlignment=NSTextAlignmentCenter;
            label.font=[UIFont systemFontOfSize:12];
            label.text=[NSString stringWithFormat:@"%.0f%%",angle/2/M_PI*100];
            [self.view addSubview:label];
        }
        
    }];
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [CATransaction commit];
}

#pragma mark - animate2
- (void) rotateViewAnimated2:(UIView*)view
                withDuration:(CFTimeInterval)duration
                     byAngle:(CGFloat)angle
{
    [CATransaction begin];
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.byValue = [NSNumber numberWithFloat:angle];
    rotationAnimation.duration = duration;
    rotationAnimation.removedOnCompletion = YES;
    float WIDTH=self.view.bounds.size.width;
    float HEIGHT=self.view.bounds.size.height;
    float trans2=angle/2/M_PI;
    [CATransaction setCompletionBlock:^{
        view.transform = CGAffineTransformRotate(view.transform, angle);
        int a=self.view.bounds.size.width/2-32;
        int x=sinf( M_PI-trans2*M_PI*2)*a;
        int y=cosf( M_PI-trans2*M_PI*2)*a;
        //        UIImageView *circle2ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-WIDTH*1/15+y, 305+x, 50, 50)];
        //        circle2ImageView.center=CGPointMake(self.view.bounds.size.width/2+y, HEIGHT*333/667-x);
        //        circle2ImageView.image=[UIImage imageNamed:@"set_charge.png"];
        //        [self.view addSubview:circle2ImageView];
        
        if (trans2>0.1&&trans2<0.9) {
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-WIDTH*1/15+y, 305+x, 150, 50)];
            label.center=CGPointMake(self.view.bounds.size.width/2+y, HEIGHT*333/667-x);
            label.textColor=[UIColor whiteColor];
            label.backgroundColor=[UIColor clearColor];
            label.textAlignment=NSTextAlignmentCenter;
            label.font=[UIFont systemFontOfSize:12];
            label.text=[NSString stringWithFormat:@"%.0f%%",angle/2/M_PI*100];
            [self.view addSubview:label];
        }
        
    }];
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [CATransaction commit];
}

- (void)fanhuiButton{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tapButton3{
    //    scanView *sView = [[scanView alloc] init];
    //    [self.navigationController pushViewController:sView animated:YES];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
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
