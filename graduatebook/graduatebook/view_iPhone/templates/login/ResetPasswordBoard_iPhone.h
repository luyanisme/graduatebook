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
//  ResetPasswordBoard_iPhone.h
//  xiaoshutong
//
//  Created by wangkai on 15/4/27.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "Bee.h"

#pragma mark -

@interface ResetPasswordBoard_iPhone : BeeUIBoard

AS_MODEL(PasswordModel, passwdModel)
AS_OUTLET(BeeUITextField, resetPasswd)
AS_OUTLET(BeeUITextField, resettPasswdAgain)

@property(nonatomic, strong) NSString* safeKey;
@property(nonatomic, strong) NSString* phoneNumber;

@end
