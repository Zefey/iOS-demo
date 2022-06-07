//
//  SDCollectionViewController.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/31.
//

#import "SDCollectionViewController.h"
#import "SDCollectionViewCell.h"

@interface SDCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation SDCollectionViewController

static NSString *identifier = @"collectionTestId";

- (instancetype) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"测试44";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = 10;
    flow.minimumInteritemSpacing = 10;
    flow.itemSize = CGSizeMake((self.view.bounds.size.width-10)/2, (self.view.bounds.size.height-10)/2);
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:[self.view bounds] collectionViewLayout:flow];
    [cv registerClass:[SDCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    cv.dataSource = self;
    cv.delegate = self;
    [self.view addSubview:cv];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [((SDCollectionViewCell *)cell) layoutWithVideoUrl:@"https://www.zefey.com/file/1615462862704.mp4" coverImageUrl:@"https://www.zefey.com/file/1553938235876.png"];
    return cell;
}

@end
