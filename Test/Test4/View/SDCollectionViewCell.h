//
//  SDCollectionViewCell.h
//  Test
//
//  Created by 刘泽锋 on 2022/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCollectionViewCell : UICollectionViewCell

-(void) layoutWithVideoUrl:(NSString *)videoUrl coverImageUrl:(NSString *) imageUrl;

@end

NS_ASSUME_NONNULL_END
