//
//  AppDelegate+OauthLogin.h
//  OauthLogin
//
//  Created by 村上 健太 on 2018/08/22.
//

#import "AppDelegate.h"

@interface AppDelegate (FacebookConnectPlugin)
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options;

@end

@interface AppDelegate (GooglePlus)
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options;

@end


