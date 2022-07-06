//
//  MyRootViewController.m
//  CodeViewTest
//
//  Created by hefu on 2022/7/6.
//

#import "MyRootViewController.h"

@interface MyRootViewController ()
@property(strong, nonatomic) UILabel *myLabel;
@property(strong, nonatomic) UIButton *myBtn;
@end

@implementation MyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 50;
    CGFloat labelViewTop = 300;
    CGFloat labelViewLeft = (screen.size.width - labelWidth) / 2;

    CGRect frame = CGRectMake(labelViewLeft, labelViewTop, labelWidth, labelHeight);

    _myLabel = [[UILabel alloc] initWithFrame:frame];

    _myLabel.text = @"代码编辑";
    _myLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_myLabel];

    _myBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_myBtn setTitle:@"OK" forState:UIControlStateNormal];
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 50;
    CGFloat buttonViewTop = 350;
    _myBtn.frame = CGRectMake((screen.size.width - buttonWidth) / 2, buttonViewTop, buttonWidth, buttonHeight);
    [_myBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_myBtn];

}


- (void)onViewClick:(id)sender {
    NSLog(@"%@ ",sender);
    NSLog(@"%d", (_myBtn == sender));
    if (sender == _myBtn) {
        _myLabel.text = @"fdfdfdf";
    }
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
