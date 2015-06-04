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
//  LoginModel.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/9.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "LoginModel.h"
#import "xiaoshutong.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "sys/utsname.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#pragma mark -

@interface LoginModel()

@property(nonatomic, strong) CLLocationManager* locationManager;

@property(nonatomic, strong) DEVICE_INFO* deviceInfo;

@end


@implementation LoginModel

DEF_SINGLETON(LoginModel)

@synthesize deviceInfo = _deviceInfo;
@synthesize childInfoList = _childInfoList;

- (void)load
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.deviceInfo = [[DEVICE_INFO alloc] init];
    self.childInfoList = [[NSMutableArray alloc] init];
    [self loadCache];

}

- (void)unload
{
    [self.locationManager stopUpdatingLocation];
}
-(void)loadCache
{
    self.userInfo = [USER_INFO readFromUserDefaults:@"userInfo"];
}

-(void)saveCache
{
    [USER_INFO userDefaultsWrite:[self.userInfo objectToString] forKey:@"userInfo"];
}

- (void)clearCache
{
    [USER_INFO userDefaultsRemove:@"userInfo"];
    
    self.userInfo = nil;
    self.loaded = NO;
}

#pragma mark -

- (void)reload
{
}

-(void)getLocationInfo
{
    if([CLLocationManager locationServicesEnabled])
    {
        NSLog(@"开始执行定位服务");
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        
        //设置定位权限 仅ios8有意义
        if([[[UIDevice currentDevice] systemVersion] doubleValue] > 8.0)
        {
            [self.locationManager requestWhenInUseAuthorization];  // 前台定位
            
            //            [self.locationManager requestAlwaysAuthorization];// 前后台同时定位
        }
        [self.locationManager startUpdatingHeading];
        [self.locationManager startUpdatingLocation];
    }
    else
    {
        NSLog(@"无法使用定位服务");
    }
}

#pragma mark - login
-(void)userLogin:(NSString *)userName password:(NSString *)password
{
//    //保存登录的密码
//    self.chatUserName = userName;
//    self.chatPassword = password;
    
    [self getDeviceInfo];

//        FOREGROUND_BEGIN
//        {
//            [self getLocationInfo];
//        }
//        FOREGROUND_COMMIT
    
    self.CANCEL_MSG(API.userLogin);
    self.MSG(API.userLogin)
    .INPUT(@"accountName",userName)
    .INPUT(@"password",password)
    .INPUT(@"deviceInfo",self.deviceInfo);
}


#pragma mark - 登录信息返回
ON_MESSAGE3(API, userLogin, msg)
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
        
        self.userInfo = msg.GET_OUTPUT(@"userInfo");
        [self setOnline:YES];
        self.childInfoList = [NSMutableArray arrayWithArray:self.userInfo.studentInfos];
    }
    else if (msg.failed)
    {
        if(0 == msg.errorDesc.length)
        {
            msg.errorDesc = @"网络异常";
        }
        
    }
    
}
- (void)setOnline:(BOOL)notify
{
    [USER_INFO userDefaultsWrite:[self.userInfo objectToString] forKey:@"userInfo"];
}
- (void)setOffline:(BOOL)notify
{
    
    [USER_INFO userDefaultsRemove:@"userInfo"];
    
    self.userInfo = nil;
}
-(void)signout
{
    [self setOffline:YES];
}
+ (BOOL)online
{
    if ( [LoginModel sharedInstance].userInfo ){
        return YES;
    }
    
    return NO;
}

#pragma mark - 获取设备信息
-(void)getDeviceInfo
{
    NSLocale* currentLocale = [NSLocale currentLocale];
    //获取国家码
    self.deviceInfo.isoCountryCode = [currentLocale objectForKey:NSLocaleCountryCode];
    
    CTTelephonyNetworkInfo* networkInfo = [CTTelephonyNetworkInfo new];
    CTCarrier* carrier = networkInfo.subscriberCellularProvider;
    //运行商名称
    self.deviceInfo.carrierName = carrier.carrierName?carrier.carrierName:@"";

    //移动国家码
    self.deviceInfo.mobileCountryCode = carrier.mobileCountryCode?carrier.mobileCountryCode : @"";
    self.deviceInfo.deviceName = [[UIDevice currentDevice] name];
    self.deviceInfo.deviceModel = [[UIDevice currentDevice] model];
    self.deviceInfo.uuid = [BeeSystemInfo deviceUUID];
    self.deviceInfo.osName = [[UIDevice currentDevice] systemName];
    self.deviceInfo.deviceOs = [[UIDevice currentDevice] systemName];
    self.deviceInfo.osVersion = [[UIDevice currentDevice] systemVersion];
    self.deviceInfo.macAddress = [self getMacAddress];
    //userName
    self.deviceInfo.userName = [[UIDevice currentDevice] name];
    //获取当前系统使用语言
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defaults objectForKey:@"AppleLanguages"];
    self.deviceInfo.localLanguage = [languages objectAtIndex:0];
    self.deviceInfo.appver = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
    //设备id
    self.deviceInfo.appid = @"123456";
    

    #ifdef DEBUG
        self.deviceInfo.env = @"debug";
    #else
        self.deviceInfo.env = @"release";
    #endif
    
    self.deviceInfo.deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    
    NSTimeZone* localZone = [NSTimeZone localTimeZone];
    
    self.deviceInfo.timezone = localZone.name;
    NSLog(@"local timezone is%@  %@",localZone.name,localZone.description);
}



- (NSString *)getMacAddress
{
    int                 mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = NULL;
    
    // Setup the management Information Base (mib)
    mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    mgmtInfoBase[2] = 0;
    mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    // With all configured interfaces requested, get handle index
    if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0)
        errorFlag = @"if_nametoindex failure";
    else
    {
        // Get the size of the data available (store in len)
        if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0)
            errorFlag = @"sysctl mgmtInfoBase failure";
        else
        {
            // Alloc memory based on above call
            if ((msgBuffer = malloc(length)) == NULL)
                errorFlag = @"buffer allocation failure";
            else
            {
                // Get system information, store in buffer
                if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
                    errorFlag = @"sysctl msgBuffer failure";
            }
        }
    }
    
    // Befor going any further...
    if (errorFlag != NULL)
    {
        NSLog(@"Error: %@", errorFlag);
        return errorFlag;
    }
    
    // Map msgbuffer to interface message structure
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    
    // Map to link-level socket structure
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    
    // Copy link layer address data in socket structure to an array
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    
    // Read from char array into a string object, into traditional Mac address format
    NSString *macAddressString = [NSString stringWithFormat:@"%X:%X:%X:%X:%X:%X",
                                  macAddress[0], macAddress[1], macAddress[2],
                                  macAddress[3], macAddress[4], macAddress[5]];
    NSLog(@"Mac Address: %@", macAddressString);
    
    // Release the buffer memory
    free(msgBuffer);
    
    return macAddressString;
}


#pragma mark - location delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.locationManager stopUpdatingLocation];
    CLLocation *currLocation = [locations lastObject];
    
    self.deviceInfo.latitude = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.latitude];
    self.deviceInfo.longitude = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.longitude];
    
    self.deviceInfo.altitude = [NSString stringWithFormat:@"%3.5f",currLocation.altitude];
    self.deviceInfo.speed = [NSString stringWithFormat:@"%3.5f",currLocation.speed];
    
    self.deviceInfo.accuracy = [NSString stringWithFormat:@"%3.5f",currLocation.horizontalAccuracy];
    self.deviceInfo.altitudeAccuracy = [NSString stringWithFormat:@"%3.5f",currLocation.verticalAccuracy];
}


//获取方向信息不会提示用户(不需要授权), 因为不会泄露隐私
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    [self.locationManager stopUpdatingHeading];
    CLLocationDirection heading = newHeading.trueHeading;
    //朝向
    self.deviceInfo.heading = [NSString stringWithFormat:@"%3.5f",heading];
    self.deviceInfo.timestamp = [NSString stringWithFormat:@"%@",newHeading.timestamp];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败: %@",error);
}

@end