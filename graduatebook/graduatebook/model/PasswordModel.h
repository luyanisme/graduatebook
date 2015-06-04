//
//   ______    ______    ______    
//  /\  __ \  /\  ___\  /\  ___\   
//  \ \  __<  \ \  __\_ \ \  __\_ 
//   \ \_____\ \ \_____\ \ \_____\ 
//    \/_____/  \/_____/  \/_____/ 
//
//  Powered by BeeFramework
//
//
//  PasswordModel.h
//  xiaoshutong
//
//  Created by wangkai on 15/4/27.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "Bee_OnceViewModel.h"

#pragma mark -

@interface PasswordModel : BeeOnceViewModel

@property(nonatomic, strong) VERIFICATION_INOF* verifyInfo;

//获取验证码
-(void)getVerifyCode:(NSString*)phoneNum;

//修改密码
-(void)modifyPassword:(NSString*)safeKey phoneNum:(NSString*)phoneNum passwd:(NSString*)passwd;

@end