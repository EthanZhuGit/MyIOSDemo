//
//  ViewController.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UIButton *myCancel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (weak, nonatomic) IBOutlet UITextView *abstractTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"");
    return YES;
}


@end
