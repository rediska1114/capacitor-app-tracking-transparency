import AppTrackingTransparency
import Foundation

public enum ATTStatus: Int {
    case notDetermined = 0
    case restricted = 1
    case denied = 2
    case authorized = 3
}

@objc public class AppTrackingTransparency: NSObject {
    func getStatus() -> ATTStatus {
        if #available(iOS 14.0, *) {
            let status = ATTrackingManager.trackingAuthorizationStatus
            return ATTStatus(rawValue: Int(status.rawValue))!

        } else {
            return ATTStatus.authorized
        }
    }

    func requestPermission(_ completion: @escaping (_ status: ATTStatus) -> Void) {
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                completion(ATTStatus(rawValue: Int(status.rawValue))!)
            }
        } else {
            completion(ATTStatus.authorized)
        }
    }
}
