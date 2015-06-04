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
//  ResetPasswordBoard_iPhone.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/27.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "ResetPasswordBoard_iPhone.h"

#pragma mark -

@interface ResetPasswordBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation ResetPasswordBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

@synthesize safeKey = _safeKey;
@synthesize phoneNumber = _phoneNumber;


DEF_MODEL(PasswordModel, passwdModel)
DEF_OUTLET(BeeUITextField, resetPasswd)
DEF_OUTLET(BeeUITextField, resettPasswdAgain)

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
    self.view.backgroundColor = [UIColor whiteColor];
    
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

#pragma mark-- textfield done
ON_SIGNAL3(BeeUITextField, RETURN, signal)
{
    if ( $(@"resetPasswd").focusing )
    {
        $(@"resettPasswdAgain").FOCUS();
        return;
    }
    [self.view endEditing:YES];
}

#pragma mark  -- 返回
ON_SIGNAL3(ResetPasswordBoard_iPhone, passwdBack, signal)
{
    [self.stack popBoardAnimated:YES];
}

#pragma mark  -- 确认修改
ON_SIGNAL3(ResetPasswordBoard_iPhone, confirm, signal)
{
    if(![self.resetPasswd.text isEqualToString:self.resettPasswdAgain.text])
    {
        [self presentFailureTips:@"两次密码不一致"];
        return;
    }
    
    [self.passwdModel modifyPassword:self.safeKey phoneNum:self.phoneNumber passwd:[self.resettPasswdAgain.text MD5]];
}



#pragma mark  -- 密码修改成功
ON_MESSAGE3(API, modifyPasswd, msg)
{
    if ( msg.succeed )
    {
         [self presentFailureTips:msg.errorDesc];
//        [self.stack popBoardAnimated:YES];
        [self.stack popToFirstBoardAnimated:YES];
    }
    
    if (msg.failed)
    {
        [self presentFailureTips:msg.errorDesc];

    }
}

@end
