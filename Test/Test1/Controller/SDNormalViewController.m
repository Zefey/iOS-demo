//
//  ViewController.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/13.
//

#import "SDNormalViewController.h"
#import "SDNormalView.h"
#import "SDTestLoader.h"

@interface SDNormalViewController ()<UITextFieldDelegate>

@property(nonatomic,strong) UIView *v;

@end

@implementation SDNormalViewController

-(instancetype)init{
    self = [super init];
    if(self){
        [self.tabBarItem setTitle:@"测试11"];
        [self.navigationItem setTitle:@"标题11"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.v = [[UIView alloc] init];
    [self.v setBackgroundColor:[UIColor yellowColor]];
    [self.v setFrame:CGRectMake(200, 200, 100, 100)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testGesture:)];
    tap.numberOfTapsRequired = 2;
    [self.v addGestureRecognizer:tap];
    
    self.v.layer.cornerRadius = 50;
    
    self.v.layer.borderColor = [UIColor blueColor].CGColor;
    self.v.layer.borderWidth = 2;
    
    [self.view addSubview:self.v];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self.view addSubview:({
        UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(20, 400, self.view.bounds.size.width-40, 60)];
        [field setBackgroundColor:[UIColor grayColor]];
        [field setPlaceholder:@"输入框。。"];
        field.delegate=self;
        field;
    })];
    
    SDTestLoader *loader = [[SDTestLoader alloc] init];
    [loader getData];
    
//    NSSetUncaughtExceptionHandler(caughtExceptionHandler);
}

//void caughtExceptionHandler(NSException *exception){
//    NSLog(@"");
//}

-(void) onClick:(UIButton *) btn {
//    [btn setFrame:CGRectMake(150, 150, 200, 200)];
    NSLog(@"onClick");
    UIViewController *second = [[UIViewController alloc] init];
    [second.view setBackgroundColor:[UIColor whiteColor]];
    [second.navigationItem setTitle:@"第二个"];
//    [self presentViewController:second animated:YES completion:^{
//            NSLog(@"");
//    }];
    [self.navigationController pushViewController:second animated:YES];
}

-(void) testGesture:(UITapGestureRecognizer *) tap{
    SDNormalView *modal = [[SDNormalView alloc] initWithFrame:self.view.bounds];
    [modal showFromPoint:self.v.frame.origin];
}


#pragma mark -

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([string isEqualToString:@"a"]){
        return NO;
    }
    return YES;
};

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
};

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
};

@end
