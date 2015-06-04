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
//  LoginBoard_iPhone.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/3.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "LoginBoard_iPhone.h"
#import "AppBoard_iPhone.h"
#import "AppDelegate.h"
#import "ForgetPasswordBoard_iPhone.h"

#pragma mark -

@interface LoginBoard_iPhone()
{
	//<#@private var#>
//    NSString* _loginUserName;//切换账号保存的用户名
//    NSString* _loginPassword;//切换账号保存的密码
}


@end

@implementation LoginBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )


DEF_NOTIFICATION(LOGIN_IN)
DEF_OUTLET(BeeUITextField, userName)
DEF_OUTLET(BeeUITextField, userPasswd)
DEF_MODEL(LoginModel, loginModel)

- (void)load
{
    self.loginModel = [LoginModel modelWithObserver:self];
    [self observeNotification:LoginBoard_iPhone.LOGIN_IN];
//    [self observeNotification:AccountChangeBoard_iPhone.ACCOUNT_CHANGE];
//    self.isNotification = NO;
}

- (void)unload
{
    [self unobserveNotification:LoginBoard_iPhone.LOGIN_IN];
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.userName.keyboardType = UIKeyboardTypePhonePad;
    
    self.allowedSwipeToBack = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.88f blue:0.88f alpha:1.00f];
    
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    if (IS_IPHONE_6P) {
        $(@"#bottom_image").ATTR(@"height",@"187px");
    }
}

ON_WILL_APPEAR( signal )
{
    
    self.userName.placeholder = @"手机号";
    [self.userName setValue:[UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f] forKeyPath:@"_placeholderLabel.textColor"];
    self.userPasswd.placeholder = @"密码";
    [self.userPasswd setValue:[UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f] forKeyPath:@"_placeholderLabel.textColor"];
    
}

ON_DID_APPEAR( signal )
{
}

ON_LOAD_DATAS(signal){
    
    [self.loginModel getLocationInfo];
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
    
}

#pragma mark-- textfield done
ON_SIGNAL3(BeeUITextField, RETURN, signal)
{
    if ( $(@"userName").focusing )
    {
        $(@"userPasswd").FOCUS();
        return;
    }
    
    if((0 != self.userName.text.length) && (0 != self.userPasswd.text.length))
    {
        [self userLogin];
    }
}

#pragma mark-- 登录
ON_SIGNAL3(LoginBoard_iPhone, login_button, signal)
{
    [self.view endEditing:YES];
    [self userLogin];
}

-(void)userLogin
{
    NSString* account = self.userName.text;
    NSString* password = self.userPasswd.text;
    
    if( 0 == account.length)
    {
        [self presentMessageTips:@"账号不能为空"];
        return;
    }
    
    if( 0 == password.length)
    {
        [self presentMessageTips:@"请输入密码"];
        return;
    }
    
    NSString* encrypPassword = [password MD5];
    
    [LoginModel sharedInstance].changeUserName = account;
    [LoginModel sharedInstance].changePassword = password;
    [self.loginModel userLogin:account password:encrypPassword];
}

#pragma mark 登录成功事件
ON_NOTIFICATION3(LoginBoard_iPhone, LOGIN_IN, notification)
{
    {
        if([[LoginModel sharedInstance].userInfo.memberType isEqualToString:@"patriarch"])
        {
            [bee.ui.router open:@"parents" animated:YES];
            
        }
        else
        {
            [bee.ui.router open:@"teacher" animated:YES];
        }
    }
}

#pragma mark  -- 忘记密码
ON_SIGNAL3(LoginBoard_iPhone, forgotPasswd, signal)
{
    ForgetPasswordBoard_iPhone* board = [ForgetPasswordBoard_iPhone board];
    [self.stack pushBoard:board animated:YES];
}

#pragma mark  -- login success
ON_MESSAGE3(API, userLogin, msg)
{
    if(msg.sending)
    {
//        [bee.ui.appBoard presentLoading];
    }
    else
    {
//        [bee.ui.appBoard dismissTips];
    }
    
    if(msg.succeed)
    {
        
    }
    else if (msg.failed)
    {
        
    } else if (msg.timeout)
    {

    }
}

@end
