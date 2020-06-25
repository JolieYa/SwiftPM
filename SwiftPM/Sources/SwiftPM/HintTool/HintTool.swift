//
//  HintTool.swift
//  Mara
//
//  Created by 周际航 on 2016/11/28.
//  Copyright © 2016年 com.maramara. All rights reserved.
//

import UIKit

// MARK: -- 屏幕尺寸
let Screen_height:CGFloat       = UIScreen.main.bounds.size.height
let Screen_width:CGFloat        = UIScreen.main.bounds.size.width
let Hint_IS_iPhone_10    = Int(Screen_height/Screen_width*100) == 216 ? true: false

public enum HintShowType {
    case bottom
    case top
    case center
}

extension String {
    @discardableResult
    public func ext_hint(_ showType:HintShowType) -> String {
        HintTool.hint(self, showType)
        return self
    }
    
    @discardableResult
    public func ext_debugPrintAndHint() -> String {
        return self.ext_debugPrint().ext_hint(HintShowType.bottom)
    } 
    
    @discardableResult
    public func ext_debugPrintAndHint(_ showType:HintShowType) -> String {
        return self.ext_debugPrint().ext_hint(showType)
    }
//    @discardableResult
//    func ext_hint(_ center:CGPoint) -> String {
//        HintTool.hint(self)
//        return self
//    }
//
//    @discardableResult
//    func ext_debugPrintAndHint(_ center:CGPoint) -> String {
//        return self.ext_debugPrint().ext_hint(CGPoint(x: CGFloat(ceilf(Float(UIScreen.main.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(UIScreen.main.bounds.size.height-100.0))))
//)
//    }
    
//     CGPoint(x: CGFloat(ceilf(Float(UIScreen.main.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(UIScreen.main.bounds.size.height-100.0))))
}

class HintTask {
    let id = UUID().uuidString
    var isDismissed = false
    let message: String
    init(_ message: String) {
        self.message = message
    }
}

class HintTool {
    
    private var hintView: UIView?
    
    static let shared = HintTool()
    var hintTaskArray: [HintTask] = []
    var isHinting = false
    
//    static func hintWithCenter(_ center:CGPoint)  {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
////            let shared = self.shared
////            let task = HintTask(message)
////            shared.hintTaskArray.append(task)
////            shared.activeHint(task)
//
//            self.hintView.center = center
//        }
//
//    }
   
    public static func hint(_ message: String, _ showType:HintShowType) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            let shared = self.shared
            let task = HintTask(message)
            shared.hintTaskArray.append(task)
            shared.activeHint(task, showType)
        }
    }
    private func activeHint(_ newTask: HintTask?, _ showType:HintShowType) {
        // 0 不再有下一个需要显示的信息时，退出队列
        guard let firstTask = self.hintTaskArray.first else {return}
        
        if let _newTask = newTask {
            // 1 插入新的任务
            if self.hintTaskArray.count == 1 {
                // 1.1 直接开始新任务
                self.showHint(_newTask, showType)
            } else {
                // 1.2 先结束现在的任务，再开始新任务
                if !firstTask.isDismissed {
                    self.dismissHint(interrupted: true, firstTask, showType)
                    return
                }
            }
        } else {
            // 2 处理之前就在队列中的人物
            self.showHint(firstTask, showType)
            if self.hintTaskArray.count > 1 {
                if !firstTask.isDismissed {
                    self.dismissHint(interrupted: true, firstTask, showType)
                }
            }
        }
    }
    
    private func currentWindow() -> UIWindow? {
        var window:UIWindow? = nil
        if #available(iOS 13.0, *) {
            for windowScene:UIWindowScene in ((UIApplication.shared.connectedScenes as?  Set<UIWindowScene>)!) { // UISceneActivationState
                if windowScene.activationState == .foregroundActive {
                    for win:UIWindow in windowScene.windows {
                        if win.isHidden == false {
                            window = win
                            break
                        }
                    }
                    break
                }
            }
            return window
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    private func showHint(_ hintTask: HintTask, _ showType:HintShowType) {
        
        let window:UIWindow? = self.currentWindow()
        if window == nil {
            return
        }
        
//        guard let window = UIApplication.shared.delegate?.window else {return}
        self.isHinting = true
        
        let hintView = HintTool.hintView(with: hintTask.message, showType)
        window!.addSubview(hintView)
        window!.bringSubviewToFront(hintView)
        self.hintView = hintView
        
        // 消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            [weak self] in
            if !hintTask.isDismissed {
                self?.dismissHint(interrupted: false, hintTask, showType)
            }
        }
    }
    
    private func dismissHint(interrupted: Bool, _ hintTask: HintTask, _ showType:HintShowType) {
        hintTask.isDismissed = true
        let alpha: CGFloat = interrupted ? 0.99 : 0.5
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.hintView?.alpha = alpha
        }, completion: { [weak self] (finished) in
            self?.hintView?.removeFromSuperview()
            self?.hintView = nil
            self?.isHinting = false
            self?.hintTaskArray.removeFirst()
            self?.activeHint(nil, showType)
        })
    }
    
    private static func hintView(with message: String, _ showType:HintShowType) -> UIView {
        let minWidth = 180.0
        let maxWidth = 260.0
        let padding = 10.0
        let font = UIFont.systemFont(ofSize: 14)
        
        let messageSize = message.ext_size(withBoundingSize: CGSize(width: maxWidth-2*padding, height: 0) , font: font)
        
        let labelFrame = CGRect(x: 0, y: 0, width: CGFloat(ceilf(Float(messageSize.width))), height: CGFloat(ceilf(Float(messageSize.height))))
        let viewFrame = CGRect(x: 0, y: 0, width: max(minWidth, Double(messageSize.width) + padding*2), height: Double(messageSize.height) + padding*2)
        
        let hintView = UIView()
        hintView.isUserInteractionEnabled = false
        hintView.backgroundColor = V2EXColor.colors.blackColor//UIColor(white: 0, alpha: 0.7)
        hintView.layer.cornerRadius = 8
        hintView.layer.masksToBounds = true
        hintView.frame = viewFrame
        if showType == .bottom {
            hintView.center = CGPoint(x: CGFloat(ceilf(Float(UIScreen.main.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(UIScreen.main.bounds.size.height-100.0))))
        } else if showType == .center {
            hintView.center = CGPoint(x: CGFloat(ceilf(Float(UIScreen.main.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(UIScreen.main.bounds.size.height/2.0)-64.0)))
        } else {
            hintView.center = CGPoint(x: CGFloat(ceilf(Float(UIScreen.main.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(Hint_IS_iPhone_10 ? 88 : 64))))
        }
        
        let hintLabel = UILabel()
        hintView.addSubview(hintLabel)
        hintView.isUserInteractionEnabled = false
        hintLabel.text = message
        hintLabel.textColor = V2EXColor.colors.whiteColor
        hintLabel.textAlignment = .center
        hintLabel.font = font
        hintLabel.preferredMaxLayoutWidth = messageSize.width
        hintLabel.numberOfLines = 0
        hintLabel.frame = labelFrame
        hintLabel.center = CGPoint(x: CGFloat(ceilf(Float(hintView.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(hintView.bounds.size.height*0.5))))
        
        return hintView
    }
}

