//
//  SDVideoPlay.h
//  Test
//
//  Created by 刘泽锋 on 2022/6/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDVideoPlay : NSObject

+(instancetype) sharePlay;

-(void) playWithVideoUrl:(NSString *)url videoView:(UIView *) videoView;

@end

NS_ASSUME_NONNULL_END
