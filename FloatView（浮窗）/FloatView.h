//
//  FloatView.h
//  Demo
//
//  Created by Cookie on 16/5/30.
//  Copyright © 2016年 Cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , SubViewShowType)
{
    SubViewShowTypeVertical = 0,  //纵向优先
    SubViewShowTypeHorizontal = 1,  //横向优先
    SubViewShowTypeDisperse = 2,  //四散
};


@protocol FloatViewDelegate <NSObject>

@optional
- (void)floatViewClicked;
- (void)floatViewSubViewClickedWithTag:(NSInteger)tag;

@end

@interface FloatView : UIView

@property(nonatomic , strong) UILabel *label;
@property(nonatomic , strong) UIImageView *imageView;
@property(nonatomic , assign) id<FloatViewDelegate> delegate;
@property(nonatomic , assign) SubViewShowType subViewShowType;

+ (instancetype)floatViewWithRadius:(CGFloat)radius point:(CGPoint)point color:(UIColor *)color inView:(UIView *)view;
+ (instancetype)floatViewWithRadius:(CGFloat)radius point:(CGPoint)point image:(UIImage *)image inView:(UIView *)view;
- (void)changeColor:(UIColor *)color;
- (void)changeImage:(UIImage *)image;
- (void)startProgressAnimation;
- (void)stopProgressAnimation;
- (void)startBitAnimation;
- (void)stopBitAnimation;
- (void)addSubFloatViewWithColor:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag;
- (void)addSubFloatViewWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag;
- (void)deleteSubFloatViewWithTag:(NSInteger)tag;
- (void)deleteAllSubFloatViews;
- (NSInteger)getSubFloatViewCount;

@end
