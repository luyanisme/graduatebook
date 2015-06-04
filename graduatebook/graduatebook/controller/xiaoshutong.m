//
//  xiaoshutong.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/9.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "xiaoshutong.h"
#import "ServerConfig.h"

@implementation API

#pragma mark - POST user/login
DEF_MESSAGE_( userLogin, msg )
{
    if ( msg.sending )
    {
        NSString* accountName = msg.GET_INPUT(@"accountName");
        NSString* password = msg.GET_INPUT(@"password");
        DEVICE_INFO* deviceInfo = msg.GET_INPUT(@"deviceInfo");
        
        NSMutableDictionary * requestBody = [NSMutableDictionary dictionary];
        requestBody.APPEND(@"username",accountName);
        requestBody.APPEND(@"password",password);
        requestBody.APPEND(@"memberDeviceInfoBean",deviceInfo);
        
        NSString* url = @"v1/login";
        NSString * requestURI = [NSString stringWithFormat:@"%@%@", [ServerConfig sharedInstance].url, url];
        NSData* data = [NSJSONSerialization dataWithJSONObject:[requestBody objectToDictionary] options:NSJSONWritingPrettyPrinted error:nil];
        
        msg.HTTP_POST( requestURI ).HEADER(@"Content-Type", @"application/json").BODY(data);
        
    }
    else if ( msg.succeed )
    {
        NSLog(@"登录成功");
        
        NSDictionary* response = msg.responseJSONDictionary;
        NSNumber* resultCode = [response objectAtPath:@"resultCode"];
        NSString* resultMessage = [response objectAtPath:@"resultMessage"];
        USER_INFO* userInfo =  [USER_INFO objectFromDictionary:[response dictAtPath:@"rows"]];
        
        
        msg.OUTPUT( @"resultCode", resultCode );
        msg.OUTPUT( @"resultMessage", resultMessage );
        msg.OUTPUT( @"userInfo", userInfo );
        
        
    }
    else if ( msg.failed )
    {
        NSLog(@"登录失败");
    }
    else if ( msg.cancelled )
    {
    }
}

#pragma mark -- verify code
DEF_MESSAGE_(verifyCode, msg)
{
    if(msg.sending)
    {
        NSString* phoneNum = msg.GET_INPUT(@"phoneNum");
        NSString* url = @"v1/requestVCode";
        NSString* requestURL = [NSString stringWithFormat:@"%@%@/%@",[ServerConfig sharedInstance].url,url,phoneNum];
        msg.HTTP_GET( requestURL ).HEADER(@"Content-Type", @"application/json");
    }
    else if (msg.succeed)
    {
        NSLog(@"获取验证码信息成功");
        NSDictionary* response = msg.responseJSONDictionary;
        NSNumber* resultCode = [response objectAtPath:@"resultCode"];
        NSString* resultMessage = [response objectAtPath:@"resultMessage"];
        
        VERIFICATION_INOF* verifyInfo = [VERIFICATION_INOF objectFromDictionary:[response objectAtPath:@"rows"]];
        msg.OUTPUT(@"resultCode",resultCode);
        msg.OUTPUT(@"resultMessage",resultMessage);
        msg.OUTPUT(@"verifyInfo",verifyInfo);
        
    }
    else if (msg.failed)
    {
        
    }
    else if (msg.cancelled)
    {
        
    }
}

#pragma mark -- modify password
DEF_MESSAGE_(modifyPasswd, msg)
{
    if(msg.sending)
    {
        NSString* safeKey = msg.GET_INPUT(@"safeKey");
        NSString* phoneNumber = msg.GET_INPUT(@"phoneNum");
        NSString* password = msg.GET_INPUT(@"passwd");
        
        NSMutableDictionary* requestBody = [NSMutableDictionary dictionary];
        requestBody.APPEND(@"safeKey",safeKey);
        requestBody.APPEND(@"phoneNumber",phoneNumber);
        requestBody.APPEND(@"password",password);
        
        NSString* url = @"v1/resetPassword";
        NSString* requestURL = [NSString stringWithFormat:@"%@%@",[ServerConfig sharedInstance].url,url];
        NSData* data = [NSJSONSerialization dataWithJSONObject:[requestBody objectToDictionary] options:NSJSONWritingPrettyPrinted error:nil];
        msg.HTTP_POST(requestURL).HEADER(@"Content-Type",@"application/json").BODY(data);
    }
    else if (msg.succeed)
    {
        NSLog(@"修改密码成功");
        NSDictionary* response = msg.responseJSONDictionary;
        NSNumber* resultCode = [response objectAtPath:@"resultCode"];
        NSString* resultMessage = [response objectAtPath:@"resultMessage"];
        
        msg.OUTPUT(@"resultCode",resultCode);
        msg.OUTPUT(@"resultMessage",resultMessage);
        
    }
    else if (msg.failed)
    {
        
    }
    else if (msg.cancelled)
    {
        
    }
}

@end



