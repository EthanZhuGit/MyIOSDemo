//
//  SecondViewController.m
//  CodeViewTest
//
//  Created by hefu on 2022/7/16.
//

#import "SecondViewController.h"
#import "WebKit/WebKit.h"

@interface SecondViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(strong,nonatomic) UILabel *urlLabel;
@property(strong,nonatomic) WKWebView *webView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _urlLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [self.view addSubview:_urlLabel];
    
    _urlLabel.text = self.url;
    CGFloat webViewTop =_urlLabel.frame.origin.y+_urlLabel.frame.size.height+10;
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, webViewTop, self.view.frame.size.width, self.view.frame.size.height-webViewTop)];
    
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    _webView.backgroundColor = [UIColor redColor];
    
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];

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
    NSLog(@"");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"");
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    
    // 修复_blank的bug
    if (!navigationAction.targetFrame.isMainFrame) {
        NSLog(@"");
        [webView loadRequest:navigationAction.request];
    }
    
    return nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        NSLog(@"%@" ,self.webView.title);
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
           
    }
}
@end
