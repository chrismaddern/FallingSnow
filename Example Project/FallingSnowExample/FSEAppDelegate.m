#import "FSEAppDelegate.h"
#import "FallingSnow.h"
@implementation FSEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeItSnow];
    return YES;
}

@end
