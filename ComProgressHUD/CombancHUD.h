//
//  CombancHUD.h
//  TeachAssistant
//
//  Created by 王楠 on 2018/11/12.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CombancHUD : NSObject

+ (void)showTipMessageInWindow:(NSString *)message;
+ (void)showTipMessageInView:(NSString *)message;
+ (void)showTipMessageInWindow:(NSString *)message delay:(NSTimeInterval)delay;
+ (void)showTipMessageInView:(NSString *)message delay:(NSTimeInterval)delay;


+ (void)showActivityMessageInWindow:(NSString *)message;
+ (void)showActivityMessageInView:(NSString *)message;
+ (void)showActivityMessageInWindow:(NSString *)message delay:(NSTimeInterval)delay;
+ (void)showActivityMessageInView:(NSString *)message delay:(NSTimeInterval)delay;


+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showInfoMessage:(NSString *)Message;
+ (void)showWarnMessage:(NSString *)Message;


+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;

+ (void)showInWindowAnimatedImage:(UIImageView *)imgView;
+ (void)showInViewAnimatedImage:(UIImageView *)imgView;


/**
 三色小球loading
 */
+ (void)showBallAnimateHUD;

+ (void)hideHUD;


@end

NS_ASSUME_NONNULL_END
