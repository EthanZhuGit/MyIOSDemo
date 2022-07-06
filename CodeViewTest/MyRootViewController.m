//
//  MyRootViewController.m
//  CodeViewTest
//
//  Created by hefu on 2022/7/6.
//

#import "MyRootViewController.h"

@interface MyRootViewController ()

@end

@implementation MyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 50;
    CGFloat labelViewTop = 300;
    CGFloat labelViewLeft = (screen.size.width-labelWidth)/2;
    
    CGRect frame = CGRectMake(labelViewLeft, labelViewTop, labelWidth, labelHeight);
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.text=@"代码编辑";
    label.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
    
    
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
