#import <Foundation/Foundation.h>

@interface NSDistributedNotificationCenter
+(id)defaultCenter;
-(id)addObserverForName:(id)arg1 object:(id)arg2 suspensionBehavior:(unsigned long long)arg3 queue:(id)arg4 usingBlock:(id)arg5 ;
@end

@interface FBSSystemService
+(FBSSystemService *) sharedService;
- (int) pidForApplication: (NSString *)bundleId;
- (void) terminateApplication: (NSString*)bundleId forReason:(long long)reason andReport:(BOOL)reports withDescription:(id)arg4 ;
- (void) openApplication: (NSString *)bundleId options: (NSDictionary *)options withResult: (id)arg3 ;
@end

%ctor {
	[NSDistributedNotificationCenter.defaultCenter
		addObserverForName: @"com.zx02.relaunch"
		object: nil
		suspensionBehavior: 4
		queue: NSOperationQueue.mainQueue
		usingBlock: ^(NSNotification *notification) {
			NSString *bundleId = [notification.userInfo valueForKey: @"bundleId"];

            // Kill app if already launched
            int pid = [[%c(FBSSystemService) sharedService] pidForApplication: bundleId];
            if (pid) {
                [[%c(FBSSystemService) sharedService] terminateApplication: bundleId forReason: 2 andReport: false withDescription: nil];
            }

            // Launch app
            [[%c(FBSSystemService) sharedService] openApplication: bundleId options: nil withResult: nil];

		}
	];
}