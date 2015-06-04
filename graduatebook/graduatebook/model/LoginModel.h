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
//  LoginModel.h
//  xiaoshutong
//
//  Created by wangkai on 15/4/9.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "Bee_OnceViewModel.h"
#import <CoreLocation/CoreLocation.h>

#pragma mark -

@interface LoginModel : BeeOnceViewModel<CLLocationManagerDelegate>

AS_SINGLETON(LoginModel)

@property(nonatomic, strong) USER_INFO* userInfo;
@property(nonatomic, strong) NSMutableArray* childInfoList;
//@property(nonatomic, strong) NSString* chatUserName;
//@property(nonatomic, strong) NSString* chatPassword;
@property(nonatomic, strong) NSString* changeUserName;   //当前登录者的用户名
@property(nonatomic, strong) NSString* changePassword;   //当前登录者的密码


-(void)getLocationInfo;
-(void)userLogin:(NSString*)userName password:(NSString*)password;
-(void)signout;
+ (BOOL)online;
@end