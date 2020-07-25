//
//  Created by c on 2020/7/25.
//  Copyright © 2020 c. All rights reserved.
//

import UIKit

let main_width = UIScreen.main.bounds.size.width
let main_height = UIScreen.main.bounds.size.height

class CBToast: NSObject {
    
    //显示菊花
    class func showToastAction() {
        if Thread.main.isMainThread {
            toastView = self.currentToastView()
            toastView?.removeFromSuperview()
            let AppDlgt = UIApplication.shared.delegate as! AppDelegate
            AppDlgt.window?.addSubview(toastView!)
            
            let indicatorView = toastView?.viewWithTag(10) as! UIActivityIndicatorView
            indicatorView.center = CGPoint.init(x: 70/2, y: 70/2)
            indicatorView.startAnimating()
            toastView?.frame = CGRect.init(x: (main_width-70)/2, y: (main_height-70)/2, width: 70, height: 70)
            toastView?.alpha = 1
        }else{
            DispatchQueue.main.async {
                self.showToastAction()
            }
            return
        }
    }
    
    //隐藏菊花
    class func hiddenToastAction() {
        if toastView != nil {
            let indicatorView = toastView?.viewWithTag(10) as! UIActivityIndicatorView
            indicatorView.stopAnimating()
            toastView?.alpha = 0
            toastView?.removeFromSuperview()
        }
    }
    
    
    
    //默认显示消息-->center
    class func showToastAction(message : NSString) {
        self.showToast(message: message, aLocationStr: "center", aShowTime: 2.0)
    }
 
    //显示消息
    class func showToast(message : NSString?, aLocationStr : NSString?, aShowTime : TimeInterval) {
        if Thread.current.isMainThread {
            toastLabel = self.currentToastLabel()
            toastLabel?.removeFromSuperview()
            
            let AppDlgt = UIApplication.shared.delegate as! AppDelegate
            AppDlgt.window?.addSubview(toastLabel!)
            
            var width = self.stringText(aText: message, aFont: 16, isHeightFixed: true, fixedValue: 40)
            var height : CGFloat = 0
            if width > (main_width - 20) {
                width = main_width - 20
                height = self.stringText(aText: message, aFont: 16, isHeightFixed: false, fixedValue: width)
            }else{
                height = 40
            }
            
            var labFrame = CGRect.zero
            if aLocationStr != nil, aLocationStr == "top" {
                labFrame = CGRect.init(x: (main_width-width)/2, y: main_height*0.15, width: width, height: height)
            }else if aLocationStr != nil, aLocationStr == "bottom" {
                labFrame = CGRect.init(x: (main_width-width)/2, y: main_height*0.85, width: width, height: height)
            }else{
                //default-->center
                labFrame = CGRect.init(x: (main_width-width)/2, y: main_height*0.5, width: width, height: height)
            }
            toastLabel?.frame = labFrame
            toastLabel?.text = message as String?
            toastLabel?.alpha = 1
            UIView.animate(withDuration: aShowTime, animations: {
                toastLabel?.alpha = 0;
            })
        }else{
            DispatchQueue.main.async {
                self.showToast(message: message, aLocationStr: aLocationStr, aShowTime: aShowTime)
            }
            return
        }
    }
    
    
    
    //显示(带菊花的消息)-->default center
    class func showIndicatorToastAction(message : NSString) {
        self.showIndicatorToast(message: message, aLocationStr: "center", aShowTime: 2.0)
    }
    
    
    //显示(带菊花的消息)
    class func showIndicatorToast(message : NSString?, aLocationStr : NSString?, aShowTime : TimeInterval) {
        if Thread.current.isMainThread {
            toastViewLabel = self.currentToastViewLabel()
            toastViewLabel?.removeFromSuperview()
            let appDlgt = UIApplication.shared.delegate as! AppDelegate
            appDlgt.window?.addSubview(toastViewLabel!)
           
            var width = self.stringText(aText: message, aFont: 16, isHeightFixed: true, fixedValue: 40)
            var height : CGFloat = 0
            if width > (main_width - 20) {
                width = main_width - 20
                height = self.stringText(aText: message, aFont: 16, isHeightFixed: false, fixedValue: width)
            }else{
                height = 40
            }
            
            var labFrame = CGRect.zero
            if aLocationStr != nil, aLocationStr == "top" {
                labFrame = CGRect.init(x: (main_width-width)/2, y: main_height*0.15, width: width, height: 60+height)
            }else if aLocationStr != nil, aLocationStr == "bottom" {
                labFrame = CGRect.init(x: (main_width-width)/2, y: main_height*0.85, width: width, height: 60+height)
            }else{
                //default-->center
                labFrame = CGRect.init(x: (main_width-width)/2, y: main_height*0.5, width: width, height: 60+height)
            }
            toastViewLabel?.frame = labFrame
            toastViewLabel?.alpha = 1
            
            let indicatorView = toastViewLabel?.viewWithTag(10) as! UIActivityIndicatorView
            indicatorView.center = CGPoint.init(x: width/2, y: 70/2)
            indicatorView.startAnimating()
            
            let aLabel = toastViewLabel?.viewWithTag(11) as! UILabel
            aLabel.frame = CGRect.init(x: 0, y: 60, width: width, height: height)
            aLabel.text = message as String?
        } else {
            DispatchQueue.main.async {
                self.showIndicatorToast(message: message, aLocationStr: aLocationStr, aShowTime: aShowTime)
            }
            return
        }
    }
    
    //隐藏(带菊花的消息)
    class func hiddenIndicatorToastAction() {
        if toastViewLabel != nil {
            let indicatorView = toastViewLabel?.viewWithTag(10) as! UIActivityIndicatorView
            indicatorView.stopAnimating()
            toastViewLabel?.alpha = 0
            toastViewLabel?.removeFromSuperview()
        }
    }
    
    
    
}

//MARK: init UI
extension CBToast {
    
    static var toastView : UIView?
    class func currentToastView() -> UIView {
        objc_sync_enter(self)
        if toastView == nil {
            toastView = UIView.init()
            toastView?.backgroundColor = UIColor.darkGray
            toastView?.layer.masksToBounds = true
            toastView?.layer.cornerRadius = 5.0
            toastView?.alpha = 0
            
            let indicatorView = UIActivityIndicatorView.init(style: .whiteLarge)
            indicatorView.tag = 10
            indicatorView.hidesWhenStopped = true
            indicatorView.color = UIColor.white
            toastView?.addSubview(indicatorView)
        }
        objc_sync_exit(self)
        return toastView!
    }
    
    static var toastLabel : UILabel?
    class func currentToastLabel() -> UILabel {
        objc_sync_enter(self)
        if toastLabel == nil {
            toastLabel = UILabel.init()
            toastLabel?.backgroundColor = UIColor.darkGray
            toastLabel?.font = UIFont.systemFont(ofSize: 16)
            toastLabel?.textColor = UIColor.white
            toastLabel?.numberOfLines = 0;
            toastLabel?.textAlignment = .center
            toastLabel?.lineBreakMode = .byCharWrapping
            toastLabel?.layer.masksToBounds = true
            toastLabel?.layer.cornerRadius = 5.0
            toastLabel?.alpha = 0;
        }
        objc_sync_exit(self)
        return toastLabel!
    }
    
    static var toastViewLabel : UIView?
    class func currentToastViewLabel() -> UIView {
        objc_sync_enter(self)
        if toastViewLabel == nil {
            toastViewLabel = UIView.init()
            toastViewLabel?.backgroundColor = UIColor.darkGray
            toastViewLabel?.layer.masksToBounds = true
            toastViewLabel?.layer.cornerRadius = 5.0
            toastViewLabel?.alpha = 0
            
            let indicatorView = UIActivityIndicatorView.init(style: .whiteLarge)
            indicatorView.tag = 10
            indicatorView.hidesWhenStopped = true
            indicatorView.color = UIColor.white
            toastViewLabel?.addSubview(indicatorView)
            
            let aLabel = UILabel.init()
            aLabel.tag = 11
            aLabel.backgroundColor = UIColor.clear
            aLabel.font = UIFont.systemFont(ofSize: 16)
            aLabel.textColor = UIColor.white
            aLabel.textAlignment = .center
            aLabel.lineBreakMode = .byCharWrapping
            aLabel.layer.masksToBounds = true
            aLabel.layer.cornerRadius = 5.0
            aLabel.numberOfLines = 0;
            toastViewLabel?.addSubview(aLabel)
        }
        objc_sync_exit(self)
        return toastViewLabel!
    }
}

//MARK: config
extension CBToast {
    
    //根据字符串长度获取对应的宽度或者高度
    class func stringText(aText : NSString?, aFont : CGFloat, isHeightFixed : Bool, fixedValue : CGFloat) -> CGFloat {
        var size = CGSize.zero
        if isHeightFixed == true {
            size = CGSize.init(width: CGFloat(MAXFLOAT), height: fixedValue)
        }else{
            size = CGSize.init(width: fixedValue, height: CGFloat(MAXFLOAT))
        }
        //返回计算出的size
        let resultSize = aText?.boundingRect(with: size, options: (NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue | NSStringDrawingOptions.truncatesLastVisibleLine.rawValue)), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: aFont)], context: nil).size
        if isHeightFixed == true {
            return resultSize!.width + 20 //增加左右20间隔
        } else {
            return resultSize!.height + 20 //增加上下20间隔
        }
    }
}


