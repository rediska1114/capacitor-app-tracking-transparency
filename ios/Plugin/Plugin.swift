import AppTrackingTransparency
import Capacitor
import Foundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorAppTrackingTransparency)
public class CapacitorAppTrackingTransparency: CAPPlugin {
    @objc func getStatus(_ call: CAPPluginCall) {
        if #available(iOS 14.0, *) {
            let status: ATTrackingManager.AuthorizationStatus = ATTrackingManager.trackingAuthorizationStatus
            call.success([
                "value": status.rawValue == 0 ? "unrequested" : status.rawValue == 1 ? "restricted" : status.rawValue == 2 ? "denied" : status.rawValue == 3 ? "authorized" : "",
            ])
        } else {
            call.success(["value": "authorized"])
        }
    }

    @objc func requestPermission(_ call: CAPPluginCall) {
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization { res in
                let status = res
                call.success([
                    "value": status.rawValue == 0 ? "unrequested" : status.rawValue == 1 ? "restricted" : status.rawValue == 2 ? "denied" : status.rawValue == 3 ? "authorized" : "",
                ])
            }
        } else {
            call.success(["value": "authorized"])
        }
    }
}
