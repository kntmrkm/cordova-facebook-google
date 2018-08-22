//
//  AppDelegate+OauthLogin.m
//  OauthLogin
//
//  Created by 村上 健太 on 2018/08/22.
//

#import "AppDelegate+OauthLogin.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "GooglePlus.h"

@implementation AppDelegate (FacebookConnectPlugin)

- (BOOL)application:(UIApplication *)application
openURL:(NSURL *)url
options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if ([url.absoluteString hasPrefix:@"fb"]) {
        BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
            openURL:url
            sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
            annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
                        ];
        return handled;
    } else {
        BOOL handled = false;
        GooglePlus* gp = (GooglePlus*) [self.viewController pluginObjects][@"GooglePlus"];
        
        if ([gp isSigningIn]) {
            gp.isSigningIn = NO;
            handled = [[GIDSignIn sharedInstance]
                       handleURL:url
                       sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                       annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
        }
        return handled;
    }
}
@end
