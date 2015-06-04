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
//  AppBoard_iPhone.m
//  graduatebook
//
//  Created by 卢棪 on 6/4/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "AppBoard_iPhone.h"
#import "LoginBoard_iPhone.h"

#pragma mark -
DEF_UI(AppBoard_iPhone, appBoard)
@implementation AppBoard_iPhone

DEF_SINGLETON( AppBoard_iPhone )

- (void)load
{
}

- (void)unload
{
}

#pragma mark Signal

ON_CREATE_VIEWS( signal )
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bee.ui.router.view];
    
    [bee.ui.router map:@"login" toClass:[LoginBoard_iPhone class]];
    [bee.ui.router open:@"login"];
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

@end
