//
//  CombancHUD.m
//  TeachAssistant
//
//  Created by 王楠 on 2018/11/12.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "CombancHUD.h"
#import "MBProgressHUD.h"

@implementation CombancHUD

+ (MBProgressHUD *)createMBProgressHUDviewWithMessage:(NSString *)message isWindiw:(BOOL)isWindow
{
    UIView *view = isWindow? (UIView *)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message?message:@"加载中.....";
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString *)message
{
    [self showTipMessage:message isWindow:true delay:2];
}
+ (void)showTipMessageInView:(NSString *)message
{
    [self showTipMessage:message isWindow:false delay:2];
}
+ (void)showTipMessageInWindow:(NSString *)message delay:(NSTimeInterval)delay
{
    [self showTipMessage:message isWindow:true delay:delay];
}
+ (void)showTipMessageInView:(NSString *)message delay:(NSTimeInterval)delay
{
    [self showTipMessage:message isWindow:false delay:delay];
}
+ (void)showTipMessage:(NSString *)message isWindow:(BOOL)isWindow delay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:delay];
}

#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString *)message
{
    [self showActivityMessage:message isWindow:true delay:0];
}

+ (void)showActivityMessageInView:(NSString *)message
{
    [self showActivityMessage:message isWindow:false delay:0];
}

+ (void)showActivityMessageInWindow:(NSString *)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:true delay:aTimer];
}

+ (void)showActivityMessageInView:(NSString *)message delay:(NSTimeInterval)delay
{
    [self showActivityMessage:message isWindow:false delay:delay];
}

+ (void)showActivityMessage:(NSString *)message isWindow:(BOOL)isWindow delay:(NSTimeInterval)delay
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
}

#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    NSString *name =@"success";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showErrorMessage:(NSString *)Message
{
    NSString *name =@"error";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showInfoMessage:(NSString *)Message
{
    NSString *name =@"info";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showWarnMessage:(NSString *)Message
{
    NSString *name =@"info";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:true];
}

+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:false];
}

+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:2];
    
}

+ (void)showInWindowAnimatedImage:(UIImageView *)imgView {
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:@"" isWindiw:YES];
    //设置hud模式
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imgView;
    //设置在hud影藏时将其从SuperView上移除,自定义情况下默认为NO
    hud.removeFromSuperViewOnHide = YES;
    //设置方框view为该模式后修改颜色才有效果
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置方框view背景色
    hud.bezelView.backgroundColor = [UIColor clearColor];
    //设置总背景view的背景色，并带有透明效果
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [hud showAnimated:YES];
    
}
+ (void)showInViewAnimatedImage:(UIImageView *)imgView {
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:@"" isWindiw:NO];
    //设置hud模式
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imgView;
    //设置在hud影藏时将其从SuperView上移除,自定义情况下默认为NO
    hud.removeFromSuperViewOnHide = YES;
    //设置方框view为该模式后修改颜色才有效果
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置方框view背景色
    hud.bezelView.backgroundColor = [UIColor clearColor];
    //设置总背景view的背景色，并带有透明效果
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [hud showAnimated:YES];
}

+ (void)showBallAnimateHUD {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:25];
    for (NSInteger i = 1; i <= 25; i++) {
        NSString *str = [NSString stringWithFormat:@"CombancHUD.bundle/loading_%ld.png", (long)i];
        UIImage *image = [UIImage imageNamed:str];
        [arr addObject:image];
    }
    //定义imageView
    UIImageView *cusImageV = [[UIImageView alloc] init];
    cusImageV.animationImages = arr.copy;
    cusImageV.animationDuration = 2.0;
    cusImageV.animationRepeatCount = 0;
    [cusImageV startAnimating];
    [self showInViewAnimatedImage:cusImageV];
}

+ (void)hideHUD
{
    UIView *winView = (UIView *)[UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideHUDForView:winView animated:YES];
    [MBProgressHUD hideHUDForView:[self getCurrentUIVC].view animated:YES];
}

#pragma mark --- 获取当前Window试图---------
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    //1、通过present弹出VC，appRootVC.presentedViewController不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        //2、通过navigationcontroller弹出VC
        //        NSLog(@"subviews == %@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    return nextResponder;
}

+ (UINavigationController *)getCurrentNaVC
{
    
    UIViewController *viewVC = (UIViewController *)[ self getCurrentWindowVC ];
    UINavigationController *naVC;
    if ([viewVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)viewVC;
        naVC = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        if (naVC.presentedViewController) {
            while (naVC.presentedViewController) {
                naVC = (UINavigationController *)naVC.presentedViewController;
            }
        }
    }else
        if ([viewVC isKindOfClass:[UINavigationController class]]) {
            
            naVC  = (UINavigationController *)viewVC;
            if (naVC.presentedViewController) {
                while (naVC.presentedViewController) {
                    naVC = (UINavigationController *)naVC.presentedViewController;
                }
            }
        }else
            if ([viewVC isKindOfClass:[UIViewController class]])
            {
                if (viewVC.navigationController) {
                    return viewVC.navigationController;
                }
                return  (UINavigationController *)viewVC;
            }
    return naVC;
}

+ (UIViewController *)getCurrentUIVC
{
    UIViewController *cc;
    UINavigationController *na = (UINavigationController *)[[self class] getCurrentNaVC];
    if ([na isKindOfClass:[UINavigationController class]]) {
        cc =  na.viewControllers.lastObject;
        
        if (cc.childViewControllers.count>0) {
            
            cc = [[self class] getSubUIVCWithVC:cc];
        }
    }else
    {
        cc = (UIViewController *)na;
    }
    return cc;
}

+ (UIViewController *)getSubUIVCWithVC:(UIViewController *)vc
{
    UIViewController *cc;
    cc =  vc.childViewControllers.lastObject;
    if (cc.childViewControllers>0) {
        [[self class] getSubUIVCWithVC:cc];
    }else {
        return cc;
    }
    return cc;
}

@end
