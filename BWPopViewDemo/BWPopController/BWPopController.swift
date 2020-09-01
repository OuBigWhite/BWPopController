//
//  BWPopController.swift
//  BWPopViewDemo
//
//  Created by 冉彬 on 2020/9/1.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import UIKit

/// 动画效果
enum AnimateType {
    case alphaAnimate          // 透明度变化
    case bottomAnimate         // 从底部弹出
    case topAnimate            // 从顶部弹出
    case leftAnimate           // 从左侧弹出
    case rightAnimate          // 从右侧弹出
}


enum LocationType {
    case center        // 弹出到屏幕中间
    case bottom        // 弹出到屏幕底部
    case top           // 弹出到屏幕顶部
    case left          // 弹出到屏幕左侧
    case right         // 弹出到屏幕右侧
}



class BWPopController {
    // 全局变量
    static let shared = BWPopController()
    
    var animateType: AnimateType = .alphaAnimate           //动画效果
    var animateDuration: TimeInterval = 0.2                //动画持续时间
    var contentView: UIView?                               //弹出的view
    var isClickHidden: Bool = true                         //是否允许点击阴影消失
    
    private init() {
    }
    
    
    lazy var popView: BWPopView = {
        let window = BWPopController.getWindow()
        let view = BWPopView(frame: CGRect(x: 0, y: 0, width: window!.frame.size.width, height: window!.frame.size.height))
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        view.addTarget(self, action: #selector(popViewAction), for: .touchUpInside)
        
        return view
    }()
    
    @objc func popViewAction(sender: UIControl){
        if isClickHidden {
            self.hiddenAnimate()
        }
    }
    
    
    /// 弹出一个屏幕中间的view
    /// - Parameter view: 需要弹出的view
    class func showCenter(view: UIView) {
        self.showView(view: view, type: .center, isClick: false)
        
    }
    
    /// 弹出一个屏幕底部的view
    /// - Parameter view: 需要弹出的view
    class func showBottom(view: UIView) {
        view.center = CGPoint(x: self.shared.popView.frame.size.width/2, y: 0)
        self.showView(view: view, type: .bottom, isClick: true)
    }
    
    
    /// 弹出一个View
    /// - Parameters:
    ///   - view: 需要弹出的view
    ///   - type: 位置类型
    ///   - isClick: 是否允许点击隐藏
    class func showView(view: UIView, type: LocationType, isClick: Bool) {
        
        switch type {
        case .center:
            view.center = CGPoint(x: self.shared.popView.frame.size.width/2, y: self.shared.popView.frame.size.height/2)
            self.showView(view: view, origin: view.frame.origin, animateType: .alphaAnimate, duration: 0.2, isClickHidden: isClick)
        case .bottom:
            var frame = view.frame
            frame.origin.y = self.shared.popView.frame.size.height - frame.size.height
            view.frame = frame
            self.showView(view: view, origin: view.frame.origin, animateType: .bottomAnimate, duration: 0.2, isClickHidden: isClick)
        case .top:
            var frame = view.frame
            frame.origin.y = 0
            view.frame = frame
            self.showView(view: view, origin: view.frame.origin, animateType: .topAnimate, duration: 0.2, isClickHidden: isClick)
        case .left:
            var frame = view.frame
            frame.origin.x = 0
            view.frame = frame
            self.showView(view: view, origin: view.frame.origin, animateType: .leftAnimate, duration: 0.2, isClickHidden: isClick)
        case .right:
            var frame = view.frame
            frame.origin.x = self.shared.popView.frame.size.width - frame.size.width
            view.frame = frame
            self.showView(view: view, origin: view.frame.origin, animateType: .rightAnimate, duration: 0.2, isClickHidden: isClick)
            
        }
        
        
    }
    
    
    /// 弹出一个View
    /// - Parameters:
    ///   - view: 需要弹出的view
    ///   - frame: view的位置（相对于window）
    ///   - animateType: 弹出动画类型
    ///   - duration: 动画持续时间
    ///   - isClickHidden: 是否允许点击隐藏
    class func showView(view: UIView, origin: CGPoint, animateType: AnimateType, duration: TimeInterval, isClickHidden: Bool) {
        self.shared.removeSubViews()
        let window = UIApplication.shared.delegate?.window
        view.frame = CGRect(origin: origin, size: view.frame.size)
        self.shared.popView.addSubview(view)
        window??.addSubview(self.shared.popView)
        self.shared.contentView = view
        self.shared.animateType = animateType
        self.shared.animateDuration = duration
        self.shared.isClickHidden = isClickHidden
        self.shared.showAnimate()
    }
    
    
    
    /// 隐藏弹窗
    class func hidden() {
        
        self.shared.hiddenAnimate()
        
    }
    
    
    /// 展示时的动画
    private func showAnimate() {
        switch self.animateType {
        case .alphaAnimate:
            self.popView.alpha = 0
            self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
            UIView.animate(withDuration: self.animateDuration) {
                //                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                self.popView.alpha = 1
            }
        case .bottomAnimate:
            self.popView.alpha = 1
            self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            var frame = self.contentView?.frame ?? CGRect()
            // 记录动画结束时的纵坐标
            let endY = frame.origin.y
            frame.origin.y = self.popView.frame.size.height
            self.contentView?.frame = frame
            UIView.animate(withDuration: self.animateDuration) {
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                frame.origin.y = endY
                self.contentView?.frame = frame
            }
        case .topAnimate:
            self.popView.alpha = 1
            self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            var frame = self.contentView?.frame ?? CGRect()
            // 记录动画结束时的纵坐标
            let endY = frame.origin.y
            frame.origin.y = -frame.size.height
            self.contentView?.frame = frame
            UIView.animate(withDuration: self.animateDuration) {
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                frame.origin.y = endY
                self.contentView?.frame = frame
            }
        case .leftAnimate:
            self.popView.alpha = 1
            self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            var frame = self.contentView?.frame ?? CGRect()
            // 记录动画结束时的横坐标
            let endX = frame.origin.x
            frame.origin.x = -frame.size.width
            self.contentView?.frame = frame
            UIView.animate(withDuration: self.animateDuration) {
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                frame.origin.x = endX
                self.contentView?.frame = frame
            }
        case .rightAnimate:
            self.popView.alpha = 1
            self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            var frame = self.contentView?.frame ?? CGRect()
            // 记录动画结束时的横坐标
            let endX = frame.origin.x
            frame.origin.x = self.popView.frame.size.width
            self.contentView?.frame = frame
            UIView.animate(withDuration: self.animateDuration) {
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                frame.origin.x = endX
                self.contentView?.frame = frame
            }
            
        }
    }
    
    /// 隐藏时的动画
    private func hiddenAnimate() {
        
        UIView.animate(withDuration: 0.2, animations: {
            switch self.animateType {
            case .alphaAnimate:
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.popView.alpha = 0
            case .bottomAnimate:
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                var frame = self.contentView?.frame ?? CGRect()
                frame.origin.y = self.popView.frame.size.height
                self.contentView?.frame = frame
            case .topAnimate:
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                var frame = self.contentView?.frame ?? CGRect()
                frame.origin.y = -frame.size.height
                self.contentView?.frame = frame
            case .leftAnimate:
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                var frame = self.contentView?.frame ?? CGRect()
                frame.origin.x = -frame.size.width
                self.contentView?.frame = frame
            case .rightAnimate:
                self.popView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                var frame = self.contentView?.frame ?? CGRect()
                frame.origin.x = self.popView.frame.size.width
                self.contentView?.frame = frame
            }
        }) { (_) in
            self.removeSubViews()
        }
    }
    
    
    private func removeSubViews() {
        for view in self.popView.subviews {
            view.removeFromSuperview()
        }
        self.popView.removeFromSuperview()
        self.contentView = nil
    }
    
    
}

extension BWPopController {
    
    // MARK: - 查找顶层控制器、
    // 获取顶层控制器 根据window
    class func getTopVC() -> (UIViewController?) {
        let window = self.getWindow()
        let vc = window?.rootViewController
        return getTopVC(withCurrentVC: vc)
    }
    ///根据控制器获取 顶层控制器
    class func getTopVC(withCurrentVC VC :UIViewController?) -> UIViewController? {
        if VC == nil {
            print("找不到顶层控制器")
            return nil
        }
        if let presentVC = VC?.presentedViewController {
            //modal出来的 控制器
            return getTopVC(withCurrentVC: presentVC)
        }else if let tabVC = VC as? UITabBarController {
            // tabBar 的跟控制器
            if let selectVC = tabVC.selectedViewController {
                return getTopVC(withCurrentVC: selectVC)
            }
            return nil
        } else if let naiVC = VC as? UINavigationController {
            // 控制器是 nav
            return getTopVC(withCurrentVC:naiVC.visibleViewController)
        } else {
            // 返回顶控制器
            return VC
        }
    }
    
    
    //MARK:获取window
    class func getWindow() -> UIWindow? {
        var window: UIWindow? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        //是否为当前显示的window
        if window?.windowLevel != UIWindow.Level.normal{
            let windows = UIApplication.shared.windows
            for  windowTemp in windows{
                if windowTemp.windowLevel == UIWindow.Level.normal{
                    window = windowTemp
                    break
                }
            }
        }
        return window
    }
    
    
}



class BWPopView: UIControl {
    
    
    
}
