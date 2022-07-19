//
//  ViewController.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>
@property(weak, nonatomic) IBOutlet UILabel *myLabel;
@property(weak, nonatomic) IBOutlet UIButton *myBtn;
@property(weak, nonatomic) IBOutlet UIButton *myCancel;
@property(weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property(weak, nonatomic) IBOutlet UITextView *abstractTextView;
@property(weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property(weak, nonatomic) IBOutlet UISwitch *myAnotherSwitch;

@property(weak, nonatomic) IBOutlet UISegmentedControl *mySegmentView;

@property(weak, nonatomic) IBOutlet UIButton *alertBtn;

@property(weak, nonatomic) IBOutlet UIButton *actionSheetBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
    [_myAnotherSwitch setOn:!_mySwitch.isOn animated:false];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"");
}

- (IBAction)onClick:(id)sender {
    if (sender == self.myBtn) {
        NSLog(@"myBtn");
    } else if (sender == self.myCancel){
        NSLog(@"myCancel");
    } else if (sender == self.alertBtn){
        [self showAlertView:1 sourceView:nil];
    } else if (sender ==self.actionSheetBtn){
        [self showAlertView:2 sourceView:sender];
    }
    [_myBtn setTitle:@"new" forState:UIControlStateNormal];
//    self.myBtn.titleLabel.text = @"new";
    self.myLabel.text = @"fdfdf";
    NSLog(@"%@ ", _nameTextFiled.text)
}

- (IBAction)switchValueChangeLisetner:(id)sender {
    if (sender == _mySwitch) {
        [_myAnotherSwitch setOn:!_mySwitch.isOn animated:true];
    } else if (sender == _myAnotherSwitch) {
        [_mySwitch setOn:!_myAnotherSwitch.isOn animated:true];
    }
}

- (IBAction)segmentStateChangeListener:(id)sender {
    UISegmentedControl *segment = (UISegmentedControl *) sender;
    NSLog(@"index %li", segment.selectedSegmentIndex);
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@ %lu %lu ", string, range.length, range.location);
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
    NSLog(@"%@ ", text);
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

- (void)keyboardShow {
    NSLog(@"");
}

- (void)keyboardHide {
    NSLog(@"");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"showSecondView"]) {

    }
    SecondViewController *control = segue.destinationViewController;
    NSString *value = _nameTextFiled.text;
    NSLog(@"%@ %@ %@", segue.identifier, _nameTextFiled.text, value);
    control.url = value;
}

- (void)showAlertView:(int)type sourceView:(id) view {
    NSLog(@"showAlertView");
    switch (type) {
        case 1: {
            NSLog(@"showAlertView %d",type);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"this is a alert view" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                NSLog(@"no action");
            }];

            UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                NSLog(@"yes action %@ ",action);
            }];

            [alert addAction:noAction];
            [alert addAction:yesAction];

            [self presentViewController:alert animated:true completion:^(void){
                NSLog(@"show completion ");
            }];

            break;
        }
        case 2:{
            UIAlertController *actionSheetController = [[UIAlertController alloc] init];
            UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"破坏性按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                NSLog(@"destructive action");
            }];

            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                NSLog(@"other action");
            }];

            UIAlertAction *cancelActon = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                NSLog(@"cancel action");
            }];

            [actionSheetController addAction:destructiveAction];
            [actionSheetController addAction:otherAction];
            [actionSheetController addAction:cancelActon];
            actionSheetController.popoverPresentationController.sourceView = view;

            [self presentViewController:actionSheetController animated:true completion:nil];

            break;

        }
    }
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"");
}


@end
