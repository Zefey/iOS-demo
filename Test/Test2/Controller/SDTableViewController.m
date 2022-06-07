//
//  TableViewController.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/25.
//

#import "SDTableViewController.h"
#import "SDWebImage.h"

@interface SDTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SDTableViewController

static NSString *identifier = @"tableTestId";

-(instancetype)init {
	self = [super init];
	if(self) {
		[self.tabBarItem setTitle:@"测试22"];
		[self.navigationItem setTitle:@"标题22"];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self.view setBackgroundColor:[UIColor whiteColor]];
	UITableView *list = [[UITableView alloc] init];
	list.frame=[[UIScreen mainScreen] bounds];
	list.delegate = self;
	list.dataSource = self;
	[self.view addSubview:list];
}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

# pragma mark tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if(!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	cell.textLabel.text=[NSString stringWithFormat:@"测试item - %@",@(indexPath.row)];
	cell.detailTextLabel.text=@"详情";
    
//    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://zefey.com/file/1651041079158.jpg"]]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://zefey.com/file/1651041079158.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            NSLog(@"");
    }];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 6;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [NSString stringWithFormat:@"header - %@",@(section)];
}


#pragma mark tableview

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"didHighlightRowAtIndexPath");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect rect = [tableView convertRect:[tableView rectForRowAtIndexPath:indexPath] toView:[tableView superview]];
	NSLog(@"didSelectRowAtIndexPath - %@",@(rect));
    NSURL *url =[NSURL URLWithString:@"SDZefey://testJumpSelf"];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url options:nil completionHandler:^(BOOL success) {
                NSLog(@"");
        }];
    }
    
}

@end
