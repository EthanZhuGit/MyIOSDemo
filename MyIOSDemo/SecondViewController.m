//
//  SecondViewController.m
//  MyIOSDemo
//
//  Created by hefu on 2022/7/14.
//

#import "SecondViewController.h"
#import "WebKit/WebKit.h"

@interface SecondViewController ()<WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@property (strong,nonatomic) WKWebView *webView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@ ",_url);
    _urlLabel.text = self.url;
    CGFloat webViewTop =_urlLabel.frame.origin.y+_urlLabel.frame.size.height+10;
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, webViewTop, self.view.frame.size.width, self.view.frame.size.height-webViewTop)];
    _webView.navigationDelegate =self;
    [self.view addSubview:_webView];
    
    NSURL *nsUrl = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl];
    [_webView loadRequest:request];
    
    // Do any additional setup after loading the view.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@ ",_url);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"");
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
