//
//  FloatViewSubView.m
//  Demo
//
//  Created by Cookie on 16/5/30.
//  Copyright © 2016年 Cookie. All rights reserved.
//

#import "FloatViewSubView.h"

@implementation FloatViewSubView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = (self.bounds.size.width) / 2;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag
{
    self.tag = tag;
    if (title) {
        [self initLabelWithTitle:title titleColor:(UIColor *)titleColor];
    }
    [self addTapGesture];
}

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag
{
    if (self = [self initWithFrame:frame]) {
        self.backgroundColor = color ? color : [UIColor colorWithRed:30/255.0 green:110/255.0 blue:190/255.0 alpha:0.5];
        [self initWithTitle:title titleColor:(UIColor *)titleColor tag:tag];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag
{
    if (self = [self initWithFrame:frame]) {
        if (image) {
            self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
            self.imageView.contentMode = UIViewContentModeScaleToFill;
            self.imageView.image = image;
            [self addSubview:self.imageView];
            [self initWithTitle:title titleColor:(UIColor *)titleColor tag:tag];
        }
    }
    return self;
}

+ (instancetype)floatViewSubViewWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag
{
    return [[self alloc]initWithFrame:frame color:color title:title titleColor:(UIColor *)titleColor tag:(NSInteger)tag];
}

+ (instancetype)floatViewSubViewWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor tag:(NSInteger)tag
{
    return [[self alloc]initWithFrame:frame image:image title:title titleColor:(UIColor *)titleColor tag:tag];
}

- (void)addTapGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)singleTap:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(floatViewSubViewClickedWithTag:)]) {
        [self.delegate floatViewSubViewClickedWithTag:self.tag];
    }
}

- (void)initLabelWithTitle:(NSString *)title titleColor:(UIColor *)titleColor
{
    self.label = [[UILabel alloc]init];
    [self addSubview:self.label];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * h_c = [NSLayoutConstraint constraintWithItem:self.label
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1.0
                                                             constant:0];
    NSLayoutConstraint * v_c = [NSLayoutConstraint constraintWithItem:self.label
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1.0
                                                             constant:0];
    NSLayoutConstraint * h_l = [NSLayoutConstraint constraintWithItem:self.label
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:(self.bounds.size.width/6.0)];
    NSLayoutConstraint * h_r = [NSLayoutConstraint constraintWithItem:self.label
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:(self.bounds.size.width/6.0)];
    NSLayoutConstraint * v_t = [NSLayoutConstraint constraintWithItem:self.label
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.0
                                                             constant:(self.bounds.size.height/6.0)];
    NSLayoutConstraint * v_b = [NSLayoutConstraint constraintWithItem:self.label
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1.0
                                                             constant:(self.bounds.size.height/6.0)];
    [self addConstraints:@[h_c , v_c , h_l , h_r , v_t , v_b]];
    if (titleColor) {
        self.label.textColor = titleColor;
    }
    else
    {
        self.label.textColor = [UIColor blackColor];
    }
    self.label.numberOfLines = 0;
    self.label.text = title;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:8];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
