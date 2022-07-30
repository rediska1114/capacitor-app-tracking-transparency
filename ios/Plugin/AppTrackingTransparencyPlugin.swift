import Capacitor
import Foundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AppTrackingTransparencyPlugin)
public class AppTrackingTransparencyPlugin: CAPPlugin {
    private let implementation = AppTrackingTransparency()

    @objc func getStatus(_ call: CAPPluginCall) {
        call.resolve(["value": String(describing: implementation.getStatus())])
    }

    @objc func requestPermission(_ call: CAPPluginCall) {
        implementation.requestPermission { status in
            call.resolve(["value": String(describing: status)])
        }
    }
}
