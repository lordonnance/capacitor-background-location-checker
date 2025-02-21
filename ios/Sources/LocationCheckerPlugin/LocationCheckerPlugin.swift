import Foundation
import Capacitor
import CoreLocation


/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(LocationCheckerPlugin)
public class LocationCheckerPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "LocationCheckerPlugin"
    public let jsName = "LocationChecker"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "checkPermission", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = LocationChecker()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func checkPermission(_ call: CAPPluginCall) {
        let status = CLLocationManager.authorizationStatus()
        var result: String

        switch status {
            case .authorizedAlways:
                result = "granted"
            default:
                result = "denied"
        }

        call.resolve(["status": result])
    }
}
