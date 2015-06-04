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
//  LoginBoard_iPhone.h
//  xiaoshutong
//
//  Created by wangkai on 15/4/3.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "Bee.h"
#import "LoginModel.h"

#pragma mark -

@interface LoginBoard_iPhone : BeeUIBoard

AS_NOTIFICATION(LOGIN_IN)

AS_OUTLET(BeeUITextField, userName)
AS_OUTLET(BeeUITextField, userPasswd)
AS_MODEL(LoginModel, loginModel)
//@property (nonatomic, assign) BOOL isNotification;

@end
