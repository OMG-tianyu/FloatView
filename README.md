# FloatView-
封装的类似iPhone的AssistiveTouch功能的悬浮窗，你可以定义悬浮窗主视图的各个参数（背景图片，半径），子视图的参数以及展开类型。还包括转动动画和跳动动画
### 使用方法<br />

    把文件拖入项目中，导入头文件#import "FloatView.h"
    
    在AppDelegate.m中的代理方法中，输入[self.window makeKeyAndVisible];
    
    //添加floatView主View（添加FloatView需要在 makeKeyAndVisible 之后）
    
    /**
     *添加纯色主View
     *参数说明：
     *Radius：主View半径，不能为nil
     *point：初始化位置，不能为nil
     *color：主View颜色，传入nil默认半透明蓝色
     *inView：需要将floatView添加在这个View中，传入nil默认添加在window上，可以跨View、ViewController
     */
     //self.floatView = [FloatView floatViewWithRadius:30 point:CGPointMake(bounds.size.width - 100 , bounds.size.height - 150) color:nil inView:nil];
    
    /**
     *添加图片主View
     *参数说明：
     *image：主View图片，传入nil默认无图片
     *其余与纯色相同
     */
     //self.floatView = [FloatView floatViewWithRadius:30 point:CGPointMake(SCREEN_WIDTH - 100 ,SCREEN_HEIGHT - 150) image:[UIImage imageNamed:@"图片名字"] inView:nil];
    //设置代理（代理方法调用在最下方）
    self.floatView.delegate = self;
    
    //主View文字(主View Label暴露，可自行更改，默认不限行数，黑色8号字体，内容水平居中)
    self.floatView.label.text = @"要输入的文字";
    self.floatView.label.font = [UIFont systemFontOfSize:15];
    self.floatView.label.textColor = [UIColor blackColor];
    
    //添加子View
    
    /**
     *添加纯色子View
     *参数说明：
     *Color：子View颜色，传入nil默认半透明蓝色
     *title：子View中的字体内容，传入nil则不显示
     *titleColor：字体颜色，传入nil默认黑色
     *tag：子View所对应的tag，获取子View点击事件、删除子View时需要
     */
    //[self.floatView addSubFloatViewWithColor:[UIColor yellowColor] title:@"这里是测试文字" titleColor:nil tag:888];
    
    /**
     *添加图片子View
     *参数说明：
     *Image：子View图片，传入nil默认透明
     *其余同纯色
     */
     //[self.floatView addSubFloatViewWithImage:[UIImage imageNamed:@"图片名字"] title:nil titleColor:nil tag:889];
     
    //开始浮标转动动画
    [self.floatView startProgressAnimation];
    //停止浮标转动动画
    [self.floatView stopProgressAnimation];
    //开始跳动动画
    [self.floatView startBitAnimation];
    //停止跳动动画
    [self.floatView stopBitAnimation];
    //显示浮窗
    self.floatView.hidden = NO;
    //隐藏浮窗
    self.floatView.hidden = YES;
    //垂直展开优先
    self.floatView.subViewShowType = SubViewShowTypeVertical;
    //四散展开优先
    self.floatView.subViewShowType = SubViewShowTypeDisperse;
    //水平展开优先
    self.floatView.subViewShowType = SubViewShowTypeHorizontal;
    
    //FloatView代理方法
    #pragma mark - FloatViewDelegate
    //点击主View的代理方法
    - (void)floatViewClicked{}
    //点击子View的代理方法
    -(void)floatViewSubViewClickedWithTag:(NSInteger)tag{}
  
