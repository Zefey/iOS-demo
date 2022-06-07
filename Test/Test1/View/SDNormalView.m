//
//  NormalModal.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/26.
//

#import "SDNormalView.h"

@interface SDNormalView ()

@property(nonatomic,strong) UIView *background;
@property(nonatomic,strong) UIButton *delBtn;

@end

@implementation SDNormalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            self.background = [[UIView alloc] initWithFrame:self.bounds];
            self.background.backgroundColor = [UIColor blackColor];
            self.background.alpha = 0;
            [self.background addGestureRecognizer:({
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDel)];
                tap;
            })];
            self.background;
        })];
        
        [self addSubview:({
            self.delBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            self.delBtn.backgroundColor = [UIColor redColor];
            [self.delBtn addTarget:self action:@selector(handleDel) forControlEvents:UIControlEventTouchUpInside];
            self.delBtn;
        })];
    }
    return self;
}

-(void) show{
    [[[UIApplication sharedApplication] windows][0] addSubview:self];
    [UIView animateWithDuration:0.5f animations:^{
        self.background.alpha = 0.6;
    }];
    [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.delBtn.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"completion %d",finished);
    }];
}

-(void) showFromPoint:(CGPoint)point{
    [[[UIApplication sharedApplication] windows][0] addSubview:self];
    [UIView animateWithDuration:0.5f animations:^{
        self.background.alpha = 0.6;
    }];
    self.delBtn.frame = CGRectMake(point.x, point.y, 0, 0);
    [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.delBtn.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"completion %d",finished);
    }];
}

-(void) hide{
    [self removeFromSuperview];
}

-(void) handleDel{
    NSLog(@"handleDel");
    [self removeFromSuperview];
}

@end
