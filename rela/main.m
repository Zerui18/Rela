#include <stdio.h>
#include <Foundation/Foundation.h>

@interface NSDistributedNotificationCenter
+(id)defaultCenter;
-(id)postNotificationName: (id)name  object: (id)object userInfo: (id)userInfo deliverImmediately: (bool)flag;
@end

int main(int argc, char *argv[], char *envp[]) {
	@autoreleasepool {
		if (argc != 2) {
            printf("Usage:\n%s com.app.bundle.identifier\n", argv[0]);
            return -1;
        }

		NSDistributedNotificationCenter *center = NSDistributedNotificationCenter.defaultCenter;
		[center postNotificationName: @"com.zx02.relaunch" object: nil userInfo: @{
			@"bundleId" : [NSString stringWithCString: argv[1] encoding: NSUTF8StringEncoding]
		} deliverImmediately: true];
	}
}
