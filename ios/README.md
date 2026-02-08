# Metrolist iOS Preview

This folder contains a SwiftUI preview of the Metrolist iOS experience. The goal is to mirror the Android feature set while providing a native iOS design language.

## Compatibility

- Minimum target: iOS 13+ (iPhone 6s and newer)
- SwiftUI-based layout optimized for smaller screens

## Next Steps

### Implemented scaffolding

- Service stubs for syncing, background audio session setup, downloads, and now playing metadata.
- A lightweight queue and sync view model to connect the UI with service layers.
- A WidgetKit widget preview for now-playing surfaces (iOS 14+).

### Build an IPA for device testing

You will need Xcode on macOS to generate a signed IPA.

1. Create an Xcode project (iOS App + Widget Extension) and add the Swift files from this folder.
2. Set the deployment target to iOS 13.0 for the app and iOS 14.0 for the widget extension.
3. Configure the bundle identifier and signing team.
4. Select **Product → Archive** in Xcode, then export an IPA from the Organizer.
