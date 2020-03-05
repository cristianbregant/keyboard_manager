#import "KeyboardManagerPlugin.h"
#if __has_include(<keyboard_manager/keyboard_manager-Swift.h>)
#import <keyboard_manager/keyboard_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "keyboard_manager-Swift.h"
#endif

@implementation KeyboardManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKeyboardManagerPlugin registerWithRegistrar:registrar];
}
@end
