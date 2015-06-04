//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  ForgetPasswordBoard_iPhone.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/27.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "ForgetPasswordBoard_iPhone.h"
#import "ResetPasswordBoard_iPhone.h"

#pragma mark -

@interface ForgetPasswordBoard_iPhone()
{
    int _timeCount;
    NSTimer* _timer; //验证码获取定时器
}
@end

@implementation ForgetPasswordBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

DEF_OUTLET(BeeUITextField, phoneNum)
DEF_OUTLET(BeeUITextField, VerifyCode)
DEF_MODEL(PasswordModel, passwdModel)

- (void)load
{
    self.passwdModel = [PasswordModel modelWithObserver:self];
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
     self.phoneNum.keyboardType = UIKeyboardTypePhonePad;
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
}

ON_WILL_APPEAR( signal )
{
}

ON_DID_APPEAR( signal )
{
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}



#pragma mark  -- 返回
ON_SIGNAL3(ForgetPasswordBoard_iPhone, verifyBack, signal)
{
    [self.stack popBoardAnimated:YES];
}


#pragma mark  -- 下一步
ON_SIGNAL3(ForgetPasswordBoard_iPhone, nextSetp, signal)
{
    
    if(0 == $(@"#phoneNum").text.length)
    {
        [self presentFailureTips:@"请输入手机号码"];
        return;
    }
    
    //验证码判空操作
    NSString* validateCode = self.VerifyCode.text.trim;
    if (validateCode.length == 0)
    {
        [self presentFailureTips:@"请输入验证码"];
        return;
    }
    
    if(![validateCode isEqualToString:self.passwdModel.verifyInfo.validateCode])
    {
        [self presentFailureTips:@"验证码错误"];
        return;
    }
    
    ResetPasswordBoard_iPhone* resetBoard = [ResetPasswordBoard_iPhone board];
    resetBoard.safeKey = self.passwdModel.verifyInfo.safeKey;
    resetBoard.phoneNumber = self.passwdModel.verifyInfo.phoneNumber;
    [self.stack pushBoard:resetBoard animated:YES];
    [self resetBtn];
}

#pragma mark  -- 获取验证码
ON_SIGNAL3(ForgetPasswordBoard_iPhone, VerifyCodeClick, signal)
{
//    if(![BeeReachability isReachable])
//    {
//        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前没有网络，请稍后再试" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alertView show];
//        return;
//    }
    NSLog(@"获取验证码");
    NSString* phoneNum = self.phoneNum.text;
    if(0 == phoneNum.length)
    {
        [self presentFailureTips:@"请输入手机号码"];
        return;
    }
    if(phoneNum.length < 6 || NO == [phoneNum isTelephone])
    {
        [self presentFailureTips:@"手机号码格式错误"];
        return;
    }
    
    [self.passwdModel getVerifyCode:phoneNum];
    
    _timeCount = 60;//60s获取验证码
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
}

-(void)handleTimer:(NSTimer *)timer
{
    _timeCount --;
    NSString* tipMessage = @"s后重新获取验证码";
    $(@"#VerifyCodeClick").TEXT([NSString stringWithFormat:@"%d%@",_timeCount,tipMessage]);
    
    if(0 == _timeCount)
    {
        [self resetBtn];
    }
}

-(void)resetBtn
{
    [_timer invalidate];
    $(@"#VerifyCodeClick").TEXT(@"获取验证码");

}

#pragma mark  -- 验证码获取
ON_MESSAGE3(API, verifyCode, msg)
{
    if ( msg.succeed )
    {
        if(0 == self.passwdModel.verifyInfo.validateCode.length)
        {
            [self resetBtn];
            [self presentFailureTips:msg.errorDesc];
        }
    }
    
    if (msg.failed)
    {
        [self resetBtn];
        [self presentFailureTips:msg.errorDesc];
    }
}
@end
