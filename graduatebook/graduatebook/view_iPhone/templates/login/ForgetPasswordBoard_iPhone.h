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
//  ForgetPasswordBoard_iPhone.h
//  xiaoshutong
//
//  Created by wangkai on 15/4/27.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "Bee.h"

#pragma mark -

@interface ForgetPasswordBoard_iPhone : BeeUIBoard
AS_OUTLET(BeeUITextField, phoneNum)
AS_OUTLET(BeeUITextField, VerifyCode)
AS_MODEL(PasswordModel, passwdModel)
@end
