import UIKit
import Flutter
import flutter_background_executor

// e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"ca.bc.gov.offsite_trial_establishment_app.sync"]

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        SwiftFlutterBackgroundExecutorPlugin.refreshTask = "ca.bc.gov.offsite_trial_establishment_app.sync"
        GeneratedPluginRegistrant.register(with: self)
        SwiftFlutterBackgroundExecutorPlugin.setPluginRegistrantCallback { registry in
            GeneratedPluginRegistrant.register(with: registry)
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

