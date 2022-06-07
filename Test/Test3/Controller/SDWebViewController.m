//
//  WebViewController.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/26.
//

#import "SDWebViewController.h"
#import "WebKit/WebKit.h"

int a = 100;
typedef void(^callbackg)(void);

@interface SDWebViewController ()<WKNavigationDelegate>

@property(nonatomic,strong) WKWebView *webView;
@property(nonatomic,strong) UIProgressView *progressView;
@property(nonatomic,copy) void(^callback)(void);

@end

@implementation SDWebViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"测试33";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height-88)];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://zefey.com"]];
    [self.webView loadRequest:request];
    self.webView.navigationDelegate = self;
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:@"test"];
    [self.view addSubview:self.webView];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 20)];
    [self.view addSubview:self.progressView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark webview
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath");
    if (context == @"test") {
        self.progressView.progress = self.webView.estimatedProgress;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
