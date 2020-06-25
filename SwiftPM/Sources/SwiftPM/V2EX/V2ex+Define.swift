//
//  V2ex+Define.swift
//  V2ex-Swift
//
//  Created by huangfeng on 1/11/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit
//import DeviceKit

//NavagationBar高度
//let NavigationBarHeight:CGFloat = {
//    let device = Device()
//    if device.isOneOf([.iPhoneX, Device.simulator(.iPhoneX)]) {
//        return 88
//    }
//    return 64
//}()
//用户代理，使用这个切换是获取 m站点 还是www站数据
let USER_AGENT = "Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4";
let MOBILE_CLIENT_HEADERS = ["user-agent":USER_AGENT]


//站点地址,客户端只有https,禁用http
let V2EXURL = "https://www.v2ex.com/"

let SEPARATOR_HEIGHT = 1.0 / UIScreen.main.scale

public func localized(string key:String ) -> String {
    return NSLocalizedString(key, comment: "") // 名字必须Localizable.strings
}

public func localized(string key:String, bundleName:String, bundle:Bundle) -> String {
    
    let mainBundlePath:NSString = bundle.resourcePath! as NSString
    let languageBundlePath:String = mainBundlePath.appendingPathComponent(bundleName)
    let targetBundlePath:Bundle = Bundle.init(path: languageBundlePath)!
//    targetBundlePath = [NSBundle bundleWithPath:languageBundlePath];
    //    if ([[NSFileManager defaultManager] fileExistsAtPath:languageBundlePath]) {
    //          NSLog(@"targetBundlePath:%@ 地址不存在", targetBundlePath);
    //    }
//    NSLocalizedString(key, tableName: <#T##String?#>, bundle: <#T##Bundle#>, value: <#T##String#>, comment: "")
//    return NSLocalizedStringFromTableInBundle(key, nil, targetBundlePath, nil)
    return NSLocalizedString(key, comment: "") // 名字必须Localizable.strings
}

public func dispatch_sync_safely_main_queue(_ block: @escaping ()->()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async {
            block()
        }
    }
}

func v2Font(_ fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize);
}

//func v2ScaleFont(_ fontSize: CGFloat) -> UIFont{
//    return v2Font(fontSize * CGFloat(V2Style.sharedInstance.fontScale))
//}
//
//
//extension UIDevice {
//    var isIphoneX:Bool {
//        get {
//            let device = Device()
//            if device.isOneOf([.iPhoneX, Device.simulator(.iPhoneX)]) {
//                return true
//            }
//            return false
//        }
//    }
//}

extension UITableView {
    func cancelEstimatedHeight(){
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
    }
}

