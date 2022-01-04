import Flutter
import UIKit

public class SwiftLockOrientationPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "lock_orientation", binaryMessenger: registrar.messenger())
        let instance = SwiftLockOrientationPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        //         let interfaceOrientation
        
        //       if #@available(iOS 13.0,*){
        //         guard interfaceOrientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation else
        //             result("none")}
        //       else{
        //           interfaceOrientation=UIDevice.current.orientation
        //       }
        
        var interfaceOrientation:UIInterfaceOrientation?
        if #available(iOS 13.0,*){
            interfaceOrientation=UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
        }else{
                interfaceOrientation=UIApplication.shared.statusBarOrientation}
        switch interfaceOrientation {
        case .landscapeLeft:
            result("left")
            return
        case .landscapeRight:
            result("right")
            return
        case .portrait:
            result("down")
            return
        case .portraitUpsideDown:
            result("up")
            return
        default:
            result("none")
        }
        
        
        
    }
}
