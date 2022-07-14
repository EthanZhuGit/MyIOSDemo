//
//  ViewController.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UIButton *myCancel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (weak, nonatomic) IBOutlet UITextView *abstractTextView;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *myAnotherSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
    [_myAnotherSwitch setOn:!_mySwitch.isOn animated:false];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"");
}

- (IBAction)onClick:(id)sender {
    if (sender == self.myBtn) {
        NSLog(@"myBtn");
    }else {
        NSLog(@"myCancel");
    }
    [_myBtn setTitle:@"new" forState:UIControlStateNormal];
//    self.myBtn.titleLabel.text = @"new";
    self.myLabel.text = @"fdfdf";
    NSLog(@"%@ ",_nameTextFiled.text)
}

- (IBAction)switchValueChangeLisetner:(id)sender {
    if (sender == _mySwitch) {
        [_myAnotherSwitch setOn:!_mySwitch.isOn animated:true];
    }else if(sender == _myAnotherSwitch){
        [_mySwitch setOn:!_myAnotherSwitch.isOn animated:true];
    }
}

- (IBAction)segmentStateChangeListener:(id)sender {
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    NSLog(@"index %li",segment.selectedSegmentIndex);
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@ %lu %lu ",string,range.length,range.location);
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"");
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"");
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%@ ",text);
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

- (void) keyboardShow {
    NSLog(@"");
}

- (void) keyboardHide {
    NSLog(@"");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@ %@ ",segue.identifier,_nameTextFiled.text);
    if ([segue.identifier isEqualToString:@"showSecondView"]) {
        
    }
    SecondViewController *control = segue.destinationViewController;
    control.url=_nameTextFiled.text;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"");
}


@end
