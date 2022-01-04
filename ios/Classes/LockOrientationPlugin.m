#import "LockOrientationPlugin.h"
#if __has_include(<lock_orientation/lock_orientation-Swift.h>)
#import <lock_orientation/lock_orientation-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "lock_orientation-Swift.h"
#endif

@implementation LockOrientationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLockOrientationPlugin registerWithRegistrar:registrar];
}
@end
