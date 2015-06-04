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
//  PasswordModel.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/27.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "PasswordModel.h"

#pragma mark -

@implementation PasswordModel

@synthesize verifyInfo = _verifyInfo;

- (void)load
{
}

- (void)unload
{
}

#pragma mark -

- (void)reload
{
}

#pragma mark - get verify code

-(void)getVerifyCode:(NSString *)phoneNum
{
    self.CANCEL_MSG(API.verifyCode);
    self.MSG(API.verifyCode)
    .INPUT(@"phoneNum",phoneNum);
}

#pragma mark -- 验证码获取成功
ON_MESSAGE3(API, verifyCode, msg)
{
    if (msg.sending)
    {
        
    }
    else if (msg.succeed)
    {
        NSNumber* resultCode = msg.GET_OUTPUT(@"resultCode");
        NSString* resultMessage = msg.GET_OUTPUT(@"resultMessage");
        
        if(0 != resultCode.intValue)
        {
            msg.errorDesc = resultMessage;
            msg.failed = YES;
            return;
        }
        self.verifyInfo = msg.GET_OUTPUT(@"verifyInfo");
    }
    else if (msg.failed)
    {
        if(0 == msg.errorDesc.length)
        {
            msg.errorDesc = @"网络异常";
        }
        
    }
}

-(void)modifyPassword:(NSString *)safeKey phoneNum:(NSString *)phoneNum passwd:(NSString *)passwd
{
    
    self.CANCEL_MSG(API.modifyPasswd);
    self.MSG(API.modifyPasswd)
    .INPUT(@"safeKey",safeKey)
    .INPUT(@"phoneNum",phoneNum)
    .INPUT(@"passwd",passwd);
}

ON_MESSAGE3(API, modifyPasswd, msg)
{
    if (msg.sending)
    {
        
    }
    else if (msg.succeed)
    {
        NSNumber* resultCode = msg.GET_OUTPUT(@"resultCode");
        NSString* resultMessage = msg.GET_OUTPUT(@"resultMessage");
        
        if(0 != resultCode.intValue)
        {
            msg.errorDesc = resultMessage;
            msg.failed = YES;
            return;
        }
        msg.errorDesc = resultMessage;
    }
    else if (msg.failed)
    {
        if(0 == msg.errorDesc.length)
        {
            msg.errorDesc = @"网络异常";
        }
        
    }
}

@end