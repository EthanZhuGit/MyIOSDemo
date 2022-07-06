//
//  ViewController.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UIButton *myCancel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onClick:(id)sender {
    NSLog(@"%@ ",sender);
    if (sender == self.myBtn) {
        NSLog(@"myBtn");
    }else {
        NSLog(@"myCancel");
    }
    [_myBtn setTitle:@"new" forState:UIControlStateNormal];
//    self.myBtn.titleLabel.text = @"new";
    self.myLabel.text = @"fdfdf";
}


@end
