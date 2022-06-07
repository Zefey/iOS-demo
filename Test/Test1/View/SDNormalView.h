//
//  NormalModal.h
//  Test
//
//  Created by 刘泽锋 on 2022/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 常用弹窗
@interface SDNormalView : UIView


-(void) show;

/// 展示弹窗
/// @param point 位置
-(void) showFromPoint:(CGPoint)point;

-(void) hide;

@end

NS_ASSUME_NONNULL_END
