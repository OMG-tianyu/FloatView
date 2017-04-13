//
//  FloatViewSubView.h
//  Demo
//
//  Created by Cookie on 16/5/30.
//  Copyright © 2016年 Cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FloatViewSubViewDelegate <NSObject>

@optional
- (void)floatViewSubViewClickedWithTag:(NSInteger)tag;

@end

@interface FloatViewSubView : UIView

@property (nonatomic , strong) UILabel *label;
@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , assign) id<FloatViewSubViewDelegate> delegate;

+ (instancetype)floatViewSubViewWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag;
+ (instancetype)floatViewSubViewWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag;

@end
