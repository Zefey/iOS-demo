//
//  SDCollectionViewCell.m
//  Test
//
//  Created by 刘泽锋 on 2022/6/1.
//

#import "SDCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "SDVideoPlay.h"

@interface SDCollectionViewCell()

@property(nonatomic,strong) UIImageView *coverImage;
@property(nonatomic,copy) NSString *videoUrl;
@property(nonatomic,copy) NSString *imageUrl;
@end

@implementation SDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            self.coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            self.coverImage;
        })];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleClick)];
        self.coverImage.userInteractionEnabled = YES;
        [self.coverImage addGestureRecognizer:tap];
    }
    return self;
}

-(void)layoutWithVideoUrl:(NSString *)videoUrl coverImageUrl:(NSString *)imageUrl{
    self.videoUrl = videoUrl;
    self.imageUrl = imageUrl;
//    [self.coverImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]]];
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

-(void)handleClick{
    CGRect rect= [[UIScreen mainScreen] bounds];
    NSLog(@"handleClick");
    [[SDVideoPlay sharePlay] playWithVideoUrl:self.videoUrl videoView:self.coverImage];
}

@end
