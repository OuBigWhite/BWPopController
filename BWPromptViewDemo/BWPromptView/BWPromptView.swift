//
//  BWPromptView.swift
//  BWPromptView
//
//  Created by 冉彬 on 2020/4/30.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import UIKit

//状态栏高度
let statusBarHeight = UIApplication.shared.statusBarFrame.height;

//导航栏高度
let navigationHeight = CGFloat(44)


class BWPromptView {
    
    var showTime: TimeInterval = 1.2
    
    lazy var view: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.size.width, height: navigationHeight + statusBarHeight))
        v.backgroundColor = .cyan
        return v
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: statusBarHeight, width:  UIScreen.main.bounds.size.width, height: navigationHeight))
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    init() {
        self.view.addSubview(self.textLabel)
    }
    
    /// 显示提示框
    /// - Parameters:
    ///   - message: 提示信息
    class func show(message: String) {
        let promptView = BWPromptView()
        promptView.textLabel.text = message
        promptView.showView()
        
    }
    
    /// 显示提示框
    /// - Parameters:
    ///   - message: 提示信息
    ///   - time: 保留时间
    class func show(message: String, time: TimeInterval) {
        let promptView = BWPromptView()
        promptView.showTime = time
        promptView.textLabel.text = message
        promptView.showView()
        
    }
    
    /// 将view加载到window上
    private func showView() {
        let app = UIApplication.shared.delegate as? AppDelegate
        let window = app?.window
        if (window != nil) {
            window!.addSubview(self.view)
            self.showAnimation()
        }
    }
    
    /// 展示动画
    private func showAnimation() {
        self.view.bw_y = -self.view.bw_height
        UIView.animate(withDuration: 0.15, animations: {
            self.view.bw_y = 0
        }) { (isCompletion) in
            if isCompletion {
                self.hiddenAnimation()
            }
        }
    }
    
    /// 隐藏动画
    private func hiddenAnimation() {
        UIView.animate(withDuration: 0.15, delay: self.showTime, options: .curveEaseIn, animations: {
            self.view.bw_y = -self.view.bw_height
        }) { (isCompletion) in
            if isCompletion {
                self.view.removeFromSuperview()
            }
        }
    }
    
    
}


extension UIView {
    
    /// 尺寸
    var bw_size: CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            self.frame.size = CGSize(width: newValue.width, height: newValue.height)
        }
    }
    
    /// 宽度
    var bw_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            self.frame.size.width = newValue
        }
    }
    
    /// 高度
    var bw_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newValue) {
            self.frame.size.height = newValue
        }
    }
    
    /// 横坐标
    var bw_x: CGFloat {
        get {
            return self.frame.minX
        }
        set(newValue) {
            self.frame = CGRect(x: newValue, y: bw_y, width: bw_width, height: bw_height)
        }
    }
    
    /// 纵坐标
    var bw_y: CGFloat {
        get {
            return self.frame.minY
        }
        set(newValue) {
            self.frame = CGRect(x: bw_x, y: newValue, width: bw_width, height: bw_height)
        }
    }
}


