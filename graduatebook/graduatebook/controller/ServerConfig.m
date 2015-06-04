//
//  ServerConfig.m
//  xiaoshutong
//
//  Created by wangkai on 15/4/9.
//  Copyright (c) 2015年 wangkai. All rights reserved.
//

#import "ServerConfig.h"

@implementation ServerConfig

DEF_SINGLETON(ServerConfig)
@synthesize host = _host;
@synthesize url = _url;

-(id)init
{
    self = [super init];
    if(self)
    {
#ifdef DEBUG
        
//        self.host =  @"115.29.232.231:8080/PreschoolEdu/rest";
//        self.host =  @"192.168.16.110:8080/PreschoolEdu/rest";
        self.host =  @"120.25.148.27/rest";

        //self.host = @"192.168.1.105:8080/PreschoolEdu/rest";
#else
//        self.host = @"115.29.232.231:8080/PreschoolEdu/rest";
        self.host =  @"120.25.148.27/rest";
#endif
        self.url = [NSString stringWithFormat:@"http://%@/", self.host];
    }
    return self;
}


@end
