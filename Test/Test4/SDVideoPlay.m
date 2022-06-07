//
//  SDVideoPlay.m
//  Test
//
//  Created by 刘泽锋 on 2022/6/1.
//

#import "SDVideoPlay.h"
#import <AVFoundation/AVFoundation.h>

@interface SDVideoPlay()
@property(nonatomic,strong) AVPlayerLayer *playerLayer;
@property(nonatomic,strong) AVPlayerItem *playItem;
@property(nonatomic,strong) AVPlayer *player;
@end

@implementation SDVideoPlay

+(instancetype) sharePlay{
    static SDVideoPlay *play;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        play = [[SDVideoPlay alloc] init];
    });
    return play;
}

- (void)playWithVideoUrl:(NSString *)url videoView:(UIView *)videoView{
    [self stopPlay];
    
    self.playItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:url]];
    self.player = [AVPlayer playerWithPlayerItem:self.playItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = videoView.bounds;
    [videoView.layer addSublayer:self.playerLayer];
    [self.player play];
}

-(void)stopPlay{
    [self.playerLayer removeFromSuperlayer];
    self.playItem = nil;
    self.player = nil;
}

@end
