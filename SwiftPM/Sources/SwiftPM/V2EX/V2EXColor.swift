//
//  V2EXColor.swift
//  V2ex-Swift
//
//  Created by huangfeng on 1/11/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit
//import KVOController

func colorWith255RGB(_ r:CGFloat , g:CGFloat, b:CGFloat) ->UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 255)
}
func colorWith255RGBA(_ r:CGFloat , g:CGFloat, b:CGFloat,a:CGFloat) ->UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255)
}

func createImageWithColor(_ color:UIColor) -> UIImage{
    return createImageWithColor(color, size: CGSize(width: 1, height: 1))
}
func createImageWithColor(_ color:UIColor,size:CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(rect.size);
    let context = UIGraphicsGetCurrentContext();
    context?.setFillColor(color.cgColor);
    context?.fill(rect);
    
    let theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage!;
}


//使用协议 方便以后切换颜色配置文件、或者做主题配色之类乱七八糟产品经理最爱的功能

public protocol V2EXColorProtocol{
    var v2_backgroundColor: UIColor { get }
    var v2_TopicListTitleColor : UIColor { get }
    var v2_TopicListUserNameColor : UIColor { get }
    var v2_TopicListDateColor : UIColor { get }
    var v2_LinkColor : UIColor { get }
    var v2_TextViewBackgroundColor: UIColor { get }
    var v2_CellWhiteBackgroundColor : UIColor { get }
    var v2_NodeBackgroundColor : UIColor { get }
    var v2_SeparatorColor : UIColor { get }
    var v2_LeftNodeBackgroundColor : UIColor { get }
    var v2_LeftNodeBackgroundHighLightedColor : UIColor { get }
    var v2_LeftNodeTintColor: UIColor { get }
    /// 小红点背景颜色
    var v2_NoticePointColor : UIColor { get }
    var v2_ButtonBackgroundColor : UIColor { get }
    var mainColor:UIColor { get }               // 主色调 蓝色
    var mainBgColor:UIColor { get }             // 主背景色
    var mainTextColor:UIColor { get }           // 文字颜色
    var mainDetailTextColor:UIColor { get }     // 详情、提示文字颜色
    var cellTextColor:UIColor { get } // cell的文本颜色
    var navigationBarTintColor: UIColor { get } // 导航栏背景色
    // 2个都是黑色时，浮在上面的颜色
    var frontColor:UIColor { get}
    // 2个都是黑色时，浮在上面的颜色 背景色
    var backColor:UIColor{ get }
    var shadowColor:UIColor {get} // 阴影颜色
    var menuTitleColor: UIColor { get }        // 菜单栏文本默认颜色
    var whiteColor:UIColor { get }         // 默认是白色
    var blackColor:UIColor { get }              // 默认是黑色
    var cellLineColor:UIColor { get }          // cell 线颜色
    var searchBgColor:UIColor {get}// textField、textView背景色
    var textFieldHoldColor:UIColor { get } // textField、textView 文本颜色 提示颜色
    var textFieldTextColor:UIColor { get } // textField、textView 文本颜色
    var lineColor:UIColor { get }               // 线、placeholder颜色
    var progressColor:UIColor { get }           // 进度边框颜色
    var progressLineColor:UIColor { get }       // 进度颜色
    var color_2fbdff:UIColor{ get }             // 蓝色的文字
    var color_2f9fff:UIColor{ get }             // 蓝色的文字
    var color_97c0ff:UIColor { get }            // 蓝色
    var color_83dac9:UIColor { get }            // 绿色
    var color_ff3333:UIColor { get }            // 红色
    var color_7a9198:UIColor { get }            // 主色调
    var color_09fbfe:UIColor { get }            // 主色调
    var color_328bfe:UIColor { get }            // 蓝色的文字
    var color_999999:UIColor { get }
}

class V2EXDefaultColor: NSObject,V2EXColorProtocol {
    static let sharedInstance = V2EXDefaultColor()
    fileprivate override init(){
        super.init()
    }
    
    //主色调 蓝色
    var mainColor:UIColor {
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#5B5B5B")
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#2f82ff")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#2f82ff")
            }
        }
    }
    var mainBgColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.black
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 文字颜色
    var mainTextColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#000000")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#000000")
            }
        }
    }
    // cell的文本颜色
    var cellTextColor:UIColor {
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#1A1A1A")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#1A1A1A")
            }
        }
    }
    // 详情、提示文字颜色
    var mainDetailTextColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#a3a3a3")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#a3a3a3")
            }
        }
    }
    // 导航栏背景色
    var navigationBarTintColor : UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.black
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 2个都是黑色时，浮在上面的颜色
    var frontColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#262626")
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 2个都是黑色时，浮在上面的颜色 背景色
    var backColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#111111")
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 阴影颜色
    var shadowColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.clear
                    } else {
                        return UIColor(red: 0, green: 0.11, blue: 0.59, alpha: 0.18)
                    }
                }
            } else {
                return UIColor(red: 0, green: 0.11, blue: 0.59, alpha: 0.18)
            }
        }
    }
    // 菜单栏文本默认颜色
    var menuTitleColor : UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#CCCCCC")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#CCCCCC")
            }
        }
    }
    // 默认是白色
    var whiteColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.black
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 默认是黑色
    var blackColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor.black
                    }
                }
            } else {
                return UIColor.black
            }
        }
    }
    // cell 线的颜色
    var cellLineColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.black
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#CCCCCC")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#CCCCCC")
            }
        }
    }
    // textField、textView 背景色
    var searchBgColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#3C3C3C")
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#EDEFF2")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#EDEFF2")
            }
        }
    }
    
    // textField、textView 文本颜色 提示颜色
    var textFieldHoldColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#A3A3A3")
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#A3A3A3")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#A3A3A3")
            }
        }
    }
    // textField、textView 文本颜色
    var textFieldTextColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor.black
                    }
                }
            } else {
                return UIColor.black
            }
        }
    }
    var lineColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#797979") // 线、placeholder颜色
        }
    }
    var progressColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2f82ff") //进度边框颜色
        }
    }
    var progressLineColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2f82ff") //进度颜色
        }
    }
    var color_2fbdff:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2fbdff") // 蓝色的文字
        }
    }
    var color_2f9fff:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2f9fff") // 蓝色的文字
        }
    }
    var color_97c0ff:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#97c0ff") // 蓝色
        }
    }
    var color_83dac9:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#83dac9") // 绿色
        }
    }
    var color_ff3333:UIColor {
        get{
            return UIColor().colorWithHexString(colorStr: "#ff3333") // 红色
        }
    }
    var color_7a9198:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#7a9198") //主色调
        }
    }
    var color_09fbfe:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#09fbfe") //主色调
        }
    }
    var color_328bfe:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#328bfe") // 蓝色的文字
        }
    }
    var color_999999:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#999999") // 蓝色的文字
        }
    }
/////////////
    
    var v2_backgroundColor : UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#eff2f5")
        }
    }
    
    var v2_TopicListTitleColor : UIColor{
        get{
            return colorWith255RGB(15, g: 15, b: 15);
        }
    }
    
    var v2_TopicListUserNameColor : UIColor{
        get{
            return colorWith255RGB(53, g: 53, b: 53);
        }
    }
    
    var v2_TopicListDateColor : UIColor{
        get{
            return colorWith255RGB(173, g: 173, b: 173);
        }
    }
    
    var v2_LinkColor : UIColor {
        get {
            return colorWith255RGB(119, g: 128, b: 135)
        }
    }
    
    var v2_TextViewBackgroundColor :UIColor {
        get {
            return colorWith255RGB(255, g: 255, b: 255)
        }
    }
    
    var v2_CellWhiteBackgroundColor :UIColor {
        get {
            return colorWith255RGB(255, g: 255, b: 255)
        }
    }
    
    var v2_NodeBackgroundColor : UIColor {
        get {
            return colorWith255RGB(242, g: 242, b: 242)
        }
    }
    var v2_SeparatorColor : UIColor {
        get {
            return UIColor().colorWithHexString(colorStr: "#797979")
        }
    }
    
    var v2_LeftNodeBackgroundColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 76)
        }
    }
    var v2_LeftNodeBackgroundHighLightedColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 56)
        }
    }
    var v2_LeftNodeTintColor : UIColor {
        get {
            return colorWith255RGBA(0, g: 0, b: 0, a: 140)
        }
    }
    
    var v2_NoticePointColor : UIColor {
        get {
            return colorWith255RGB(207, g: 70, b: 71)
        }
    }
    var v2_ButtonBackgroundColor : UIColor {
        get {
            return colorWith255RGB(85, g: 172, b: 238)
        }
    }
}


/// Dark Colors
class V2EXDarkColor: NSObject,V2EXColorProtocol {
    static let sharedInstance = V2EXDarkColor()
    fileprivate override init(){
        super.init()
    }
    // 主色调 蓝色
    var mainColor:UIColor {
        get{
            return colorWith255RGB(165, g: 165, b: 165)
        }
    }
    // 主背景色
    var mainBgColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#eff2f5")
        }
    }
    // 文字颜色
    var mainTextColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#ff00ff")
        }
    }
    // cell的文本颜色
    var cellTextColor:UIColor {
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#1A1A1A")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#1A1A1A")
            }
        }
    }
    // 详情、提示文字颜色
    var mainDetailTextColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#a3a3a3")
        }
    }
    // 导航栏背景色
    var navigationBarTintColor : UIColor{
        get{
            return colorWith255RGB(165, g: 165, b: 165);
        }
    }
    // 2个都是黑色时，浮在上面的颜色
    var frontColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#262626")
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 2个都是黑色时，浮在上面的颜色 背景色
    var backColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#111111")
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 阴影颜色
    var shadowColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.clear
                    } else {
                        return UIColor(red: 0, green: 0.11, blue: 0.59, alpha: 0.18)
                    }
                }
            } else {
                return UIColor(red: 0, green: 0.11, blue: 0.59, alpha: 0.18)
            }
        }
    }
    // 菜单栏文本默认颜色
    var menuTitleColor : UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#CCCCCC")
        }
    }
    // 默认是白色
    var whiteColor:UIColor{
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.black
                    } else {
                        return UIColor.white
                    }
                }
            } else {
                return UIColor.white
            }
        }
    }
    // 默认是黑色
    var blackColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor.black
                    }
                }
            } else {
                return UIColor.black
            }
        }
    }
    // cell 线的颜色
    var cellLineColor:UIColor {
        get {
            return UIColor().colorWithHexString(colorStr: "#CCCCCC")
        }
    }
    // textField、textView 背景色
    var searchBgColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#3C3C3C")
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#EDEFF2")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#EDEFF2")
            }
        }
    }
    // textField、textView 文本 提示颜色
    var textFieldHoldColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor().colorWithHexString(colorStr: "#A3A3A3")
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#A3A3A3")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#A3A3A3")
            }
        }
    }
    // textField、textView 文本颜色
    var textFieldTextColor:UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (trainCollection) -> UIColor in
                    if trainCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    } else {
                        return UIColor().colorWithHexString(colorStr: "#9CA0A4")
                    }
                }
            } else {
                return UIColor().colorWithHexString(colorStr: "#9CA0A4")
            }
        }
    }
    var lineColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#797979") // 线、placeholder颜色
        }
    }
    var progressColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2f82ff") //进度边框颜色
        }
    }
    var progressLineColor:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2f82ff") //进度颜色
        }
    }
    var color_2fbdff:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2fbdff") // 蓝色的文字
        }
    }
    var color_2f9fff:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#2f9fff") // 蓝色的文字
        }
    }
    var color_97c0ff:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#97c0ff") // 蓝色
        }
    }
    var color_83dac9:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#83dac9") // 绿色
        }
    }
    var color_ff3333:UIColor {
        get{
            return UIColor().colorWithHexString(colorStr: "#ff3333") // 红色
        }
    }
    var color_7a9198:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#7a9198") //主色调
        }
    }
    var color_09fbfe:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#09fbfe") //主色调
        }
    }
    var color_328bfe:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#328bfe") // 蓝色的文字
        }
    }
    var color_999999:UIColor{
        get{
            return UIColor().colorWithHexString(colorStr: "#999999") // 蓝色的文字
        }
    }
    /////////////
    
    var v2_backgroundColor : UIColor{
        get{
            return colorWith255RGB(32, g: 31, b: 35);
        }
    }
    
    
    var v2_TopicListTitleColor : UIColor{
        get{
            return colorWith255RGB(145, g: 145, b: 145);
        }
    }
    
    var v2_TopicListUserNameColor : UIColor{
        get{
            return colorWith255RGB(125, g: 125, b: 125);
        }
    }
    
    var v2_TopicListDateColor : UIColor{
        get{
            return colorWith255RGB(100, g: 100, b: 100);
        }
    }
    
    var v2_LinkColor : UIColor {
        get {
            return colorWith255RGB(119, g: 128, b: 135)
        }
    }
    
    var v2_TextViewBackgroundColor :UIColor {
        get {
            return colorWith255RGB(35, g: 34, b: 38)
        }
    }
    
    var v2_CellWhiteBackgroundColor :UIColor {
        get {
            return colorWith255RGB(35, g: 34, b: 38)
        }
    }
    
    var v2_NodeBackgroundColor : UIColor {
        get {
            return colorWith255RGB(40, g: 40, b: 40)
        }
    }
    var v2_SeparatorColor : UIColor {
        get {
            return colorWith255RGB(46, g: 45, b: 49)
        }
    }
    
    var v2_LeftNodeBackgroundColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 76)
        }
    }
    var v2_LeftNodeBackgroundHighLightedColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 56)
        }
    }
    var v2_LeftNodeTintColor : UIColor {
        get {
            return colorWith255RGBA(0, g: 0, b: 0, a: 140)
        }
    }
    
    var v2_NoticePointColor : UIColor {
        get {
            return colorWith255RGB(207, g: 70, b: 71)
        }
    }
    var v2_ButtonBackgroundColor : UIColor {
        get {
            return colorWith255RGB(207, g: 70, b: 71)
        }
    }
}


open class V2EXColor :NSObject  {
    fileprivate static let STYLE_KEY = "styleKey"
    
    public static let V2EXColorStyleDefault = "Default"
    static let V2EXColorStyleDark = "Dark"
    
    fileprivate static var _colors:V2EXColorProtocol?
    public static var colors :V2EXColorProtocol {
        get{
            
            if let c = V2EXColor._colors {
                return c
            }
            else{
                if V2EXColor.sharedInstance.style == V2EXColor.V2EXColorStyleDefault{
                    return V2EXDefaultColor.sharedInstance
                }
                else{
                    return V2EXDarkColor.sharedInstance
                }
            }
        }
        set{
            V2EXColor._colors = newValue
        }
    }
    
    @objc open dynamic var style:String
    public static let sharedInstance = V2EXColor()
    fileprivate override init(){
        if let style = V2EXSettings.sharedInstance[V2EXColor.STYLE_KEY] {
            self.style = style
        }
        else{
            self.style = V2EXColor.V2EXColorStyleDefault
        }
        super.init()
    }
    func setStyleAndSave(_ style:String){
        if self.style == style {
            return
        }
        
        if style == V2EXColor.V2EXColorStyleDefault {
            V2EXColor.colors = V2EXDefaultColor.sharedInstance
        }
        else{
            V2EXColor.colors = V2EXDarkColor.sharedInstance
        }
        
        self.style = style
        V2EXSettings.sharedInstance[V2EXColor.STYLE_KEY] = style
    }
    
}

//MARK: - 主题更改时，自动执行
extension NSObject {
    fileprivate struct AssociatedKeys {
        static var thmemChanged = "thmemChanged"
    }
    
    /// 当前主题更改时、第一次设置时 自动调用的闭包
    public typealias ThemeChangedClosure = @convention(block) (_ style:String) -> Void
    
    /// 自动调用的闭包
    /// 设置时，会设置一个KVO监听，当V2Style.style更改时、第一次赋值时 会自动调用这个闭包
//    open var themeChangedHandler:ThemeChangedClosure? {
//        get {
//            let closureObject: AnyObject? = objc_getAssociatedObject(self, &AssociatedKeys.thmemChanged) as AnyObject?
//            guard closureObject != nil else{
//                return nil
//            }
//            let closure = unsafeBitCast(closureObject, to: ThemeChangedClosure.self)
//            return closure
//        }
//        set{
//            guard let value = newValue else{
//                return
//            }
//            let dealObject: AnyObject = unsafeBitCast(value, to: AnyObject.self)
//            objc_setAssociatedObject(self, &AssociatedKeys.thmemChanged,dealObject,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            //设置KVO监听
//            self.kvoController.observe(V2EXColor.sharedInstance, keyPath: "style", options: [.initial,.new] , block: {[weak self] (nav, color, change) -> Void in
//                self?.themeChangedHandler?(V2EXColor.sharedInstance.style)
//                }
//            )
//        }
//    }
}
