//
//  SDSplashView.m
//  Test
//
//  Created by 刘泽锋 on 2022/6/2.
//

#import "SDSplashView.h"

@implementation SDSplashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"launch"];
        [self setContentMode:UIViewContentModeScaleAspectFill];
        [self setUserInteractionEnabled:YES];
        [self addSubview:({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-100, 100, 100, 50)];
            [btn setTitle:@"跳过" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(hideSplash) forControlEvents:UIControlEventTouchUpInside];
            btn;
        })];
    }
    return self;
}

- (void)showSplash{
    
}

-(void) hideSplash{
    [UIView animateWithDuration:0.6f animations:^{
        self.alpha=0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


@end
