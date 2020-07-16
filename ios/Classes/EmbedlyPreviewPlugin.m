#import "EmbedlyPreviewPlugin.h"
#if __has_include(<embedly_preview/embedly_preview-Swift.h>)
#import <embedly_preview/embedly_preview-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "embedly_preview-Swift.h"
#endif

@implementation EmbedlyPreviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEmbedlyPreviewPlugin registerWithRegistrar:registrar];
}
@end
