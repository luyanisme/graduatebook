//
//  xiaoshutong.h
//  xiaoshutong
//
//  Created by wangkai on 15/4/9.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//


#import "Bee.h"
#import "MetaData.h"

@interface API : BeeController

#pragma mark - userLogin  用户登录
AS_MESSAGE(userLogin)

#pragma mark -- verify code
AS_MESSAGE(verifyCode)

#pragma mark -- modify password
AS_MESSAGE(modifyPasswd)
@end
