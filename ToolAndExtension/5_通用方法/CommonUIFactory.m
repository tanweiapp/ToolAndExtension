//
//  JDUtils.m
//  WJDStudyLibrary
//
//  Created by wangjundong on 2017/3/31.
//  Copyright © 2017年 wangjundong. All rights reserved.
//

#import "CommonUIFactory.h"

@implementation CommonUIFactory

+ (UIView *)createViewWithFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    return view;
}

+ (UIView *)createViewWithFrame:(CGRect)frame Color:(UIColor *)color {

    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame ImageName:(NSString *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    return imageView;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                         FontSize:(int)fontSize
                             Text:(NSString *)text {
    return [CommonUIFactory createLabelWithFrame:frame FontSize:fontSize Text:text textColor:[UIColor blackColor]];
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                         FontSize:(int)fontSize
                             Text:(NSString *)text
                        textColor:(UIColor *)color {
    return [CommonUIFactory createLabelWithFrame:frame FontSize:fontSize Text:text textColor:[UIColor blackColor] NSTextAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                         FontSize:(int)fontSize
                             Text:(NSString *)text
                        textColor:(UIColor *)color
                  NSTextAlignment:(NSTextAlignment)alignment {

    UILabel *label = [[UILabel alloc] initWithFrame:frame]; //
    label.numberOfLines = 1;                                //默认一行
    label.textAlignment = alignment;                        //默认对齐方式
    label.backgroundColor = [UIColor clearColor];           //背景颜色透明
    label.font = [UIFont systemFontOfSize:fontSize];        //系统字体
    label.lineBreakMode = NSLineBreakByWordWrapping;        //基准线
    label.textColor = color;                                //默认字体颜色
    label.adjustsFontSizeToFitWidth = YES;                  //自适应
    label.text = text;
    return label;
}

+ (UIButton *)createSystemButtonWithFrame:(CGRect)frame
                                   Target:(id)target
                                   Action:(SEL)action
                                    Title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame
                          ImageName:(NSString *)imageName
                             Target:(id)target
                             Action:(SEL)action
                              Title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                              placeholder:(NSString *)placeholder
                                 passWord:(BOOL)YESorNO
                            leftImageView:(UIView *)imageView
                           rightImageView:(UIImageView *)rightImageView
                                 FontSize:(float)fontSize {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];

    textField.placeholder = placeholder;           //灰色提示框
    textField.textAlignment = NSTextAlignmentLeft; //文字对齐方式
    textField.secureTextEntry = YESorNO;
    textField.keyboardType = UIKeyboardTypeDefault; //键盘类型
    textField.autocapitalizationType = NO;          //关闭首字母大写
    textField.clearButtonMode = YES;                //清除按钮
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.leftView = imageView; //左图片
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.rightViewMode = UITextFieldViewModeAlways; //编辑状态下一直存在

    if (rightImageView) {
        textField.rightView = rightImageView;
        textField.rightView.hidden = NO;
    }
    //textField.inputView                                                    //自定义键盘
    textField.font = [UIFont systemFontOfSize:fontSize]; //字体
    //字体颜色
    textField.textColor = [UIColor blackColor];
    return textField;
}

+ (UIBarButtonItem *)createTextBarButtonWithTitle:(NSString *)title
                                           Target:(id)target
                                           Action:(SEL)action {
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    return barButton;
}

+ (UIBarButtonItem *)createImageBarButtonWithFrame:(CGRect)frame
                                         ImageName:(NSString *)imageName
                                            Target:(id)target
                                            Action:(SEL)action {
    UIButton *button = [self createButtonWithFrame:frame ImageName:imageName Target:target Action:action Title:nil];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButton;
}

@end
