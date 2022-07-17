//
//  MyRootViewController.m
//  CodeViewTest
//
//  Created by hefu on 2022/7/6.
//

#import "MyRootViewController.h"
#import "SecondViewController.h"

@interface MyRootViewController () <UITextFieldDelegate, UITextViewDelegate>
@property(strong, nonatomic) UILabel *myLabel;
@property(strong, nonatomic) UIButton *myBtn;
@property(strong, nonatomic) UITextField *nameTextFiled;
@property(strong, nonatomic) UITextView *abstractTextView;
@property(strong, nonatomic) UISwitch *mySwitch1;
@property(strong, nonatomic) UISwitch *mySwitch2;
@property(strong, nonatomic) UISegmentedControl *mySegmentedView;

@end

@implementation MyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 50;
    CGFloat labelViewTop = 100;
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

    CGFloat nameTextFiledWidth = 200;
    CGFloat nameTextFiledHeight = 50;
    CGFloat nameViewSpaceTop = 10;
    _nameTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(_myLabel.frame.origin.x,
            _myLabel.frame.origin.y + _myLabel.frame.size.height + nameViewSpaceTop, nameTextFiledWidth, nameTextFiledHeight)];
    _nameTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextFiled.placeholder = @"请输入";
    _nameTextFiled.delegate = self;
    [self.view addSubview:_nameTextFiled];

    
    _abstractTextView = [[UITextView alloc] initWithFrame:CGRectMake(_nameTextFiled.frame.origin.x,
            _nameTextFiled.frame.origin.y + _nameTextFiled.frame.size.height + 10, 200, 100)];

    _abstractTextView.delegate = self;
    _abstractTextView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_abstractTextView];
    
    _mySwitch1 = [[UISwitch alloc] initWithFrame:CGRectMake(0, _myBtn.frame.origin.y+100, 100, 50)];
    [_mySwitch1 addTarget:self action:@selector(switchStateChanged:) forControlEvents:UIControlEventValueChanged];
    [_mySwitch1 setOn:TRUE animated:false];
    [self.view addSubview:_mySwitch1];
    
    _mySwitch2 = [[UISwitch alloc] initWithFrame:CGRectMake(120, _myBtn.frame.origin.y+100, 100, 50)];
    [_mySwitch2 addTarget:self action:@selector(switchStateChanged:) forControlEvents:UIControlEventValueChanged];
    [_mySwitch2 setOn:!_mySwitch1.isOn animated:false];
    [self.view addSubview:_mySwitch2];


    NSArray *segments = @[@"春",@"夏",@"秋",@"冬"];
    _mySegmentedView = [[UISegmentedControl alloc] initWithItems:segments];
    frame = CGRectMake(100, _mySwitch1.frame.origin.y+60, screen.size.width-200, 60);
    _mySegmentedView.frame = frame;
    [_mySegmentedView addTarget:self action:@selector(segmentViewStateChanged:) forControlEvents:UIControlEventValueChanged];
    [_mySegmentedView setSelectedSegmentIndex:0];
    [self.view addSubview:_mySegmentedView];
}


- (void)onViewClick:(id)sender {
    NSLog(@"%@ ", sender);
    NSLog(@"%d", (_myBtn == sender));
    if (sender == _myBtn) {
        SecondViewController *second = [[SecondViewController alloc]init];
        second.url=_nameTextFiled.text;
        [self.navigationController pushViewController:second animated:true];
    }
}


-(void) switchStateChanged:(id)sender{
    if (sender == _mySwitch1) {
        [_mySwitch2 setOn:!_mySwitch1.isOn animated:true];
    }else if(sender == _mySwitch2){
        [_mySwitch1 setOn:!_mySwitch2.isOn animated:true];
    }
}


-(void) segmentViewStateChanged:(id)sender{
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    NSLog(@"index %li",segment.selectedSegmentIndex);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@ %lu %lu", string, range.location, range.length);
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _abstractTextView.text=_nameTextFiled.text;
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
