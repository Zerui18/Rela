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

void terminateApp(NSString *bundleId) {
	@try {
		int pid = [[%c(FBSSystemService) sharedService] pidForApplication: bundleId];
		if (pid) {
			[[%c(FBSSystemService) sharedService] terminateApplication: bundleId forReason: 2 andReport: false withDescription: nil];
		}
	}
	@catch (NSException *exception) {
		NSLog(@"[RELA] (terminateApp) Exception: %@", exception);
	}
}

void launchApp(NSString *bundleId) {
	@try {
		[[%c(FBSSystemService) sharedService] openApplication: bundleId options: nil withResult: nil];
	}
	@catch (NSException *exception) {
		NSLog(@"[RELA] (launchApp) Exception: %@", exception);
	}
}

%ctor {
	[NSDistributedNotificationCenter.defaultCenter
		addObserverForName: @"com.zx02.relaunch"
		object: nil
		suspensionBehavior: 4
		queue: NSOperationQueue.mainQueue
		usingBlock: ^(NSNotification *notification) {
			NSString *bundleId = [notification.userInfo valueForKey: @"bundleId"];
            terminateApp(bundleId);
			launchApp(bundleId);
		}
	];
}