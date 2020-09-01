//
//  ViewController.swift
//  BWPopViewDemo
//
//  Created by 冉彬 on 2020/9/1.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var centerBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 10, y: 60, width: 80, height: 40))
        btn.backgroundColor = .cyan
        btn.setTitle("中心", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(centerAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var bottomBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 60, width: 80, height: 40))
        btn.backgroundColor = .cyan
        btn.setTitle("底部", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(bottomAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var topBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 190, y: 60, width: 80, height: 40))
        btn.backgroundColor = .cyan
        btn.setTitle("顶部", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(topAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var leftBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 10, y: 110, width: 80, height: 40))
        btn.backgroundColor = .cyan
        btn.setTitle("左侧", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var rightBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 110, width: 80, height: 40))
        btn.backgroundColor = .cyan
        btn.setTitle("右侧", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var custemBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 190, y: 110, width: 80, height: 40))
        btn.backgroundColor = .cyan
        btn.setTitle("自定义", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.centerBtn)
        self.view.addSubview(self.bottomBtn)
        self.view.addSubview(self.topBtn)
        self.view.addSubview(self.leftBtn)
        self.view.addSubview(self.rightBtn)
        self.view.addSubview(self.custemBtn)
        // Do any additional setup after loading the view.
    }
    
    
    // 弹出到屏幕中心
    @objc func centerAction(sender: UIButton) -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        view.backgroundColor = .white
        BWPopController.showView(view: view, type: .center, isClick: true)
    }
    
    // 弹出到屏幕底部
    @objc func bottomAction(sender: UIButton) -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        view.backgroundColor = .white
        BWPopController.showView(view: view, type: .bottom, isClick: true)
    }
    
    // 弹出到屏幕顶部
    @objc func topAction(sender: UIButton) -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        view.backgroundColor = .white
        BWPopController.showView(view: view, type: .top, isClick: true)
    }
    
    // 弹出到屏幕左侧
    @objc func leftAction(sender: UIButton) -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        view.backgroundColor = .white
        BWPopController.showView(view: view, type: .left, isClick: true)
    }
    
    // 弹出到屏幕右侧
    @objc func rightAction(sender: UIButton) -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        view.backgroundColor = .white
        BWPopController.showView(view: view, type: .right, isClick: true)
    }
    
    // 弹出到指定位置
    @objc func clickAction(sender: UIButton) -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        view.backgroundColor = .white
        BWPopController.showView(view: view, origin: CGPoint(x: 80, y: 100), animateType: .topAnimate, duration: 0.2, isClickHidden: true)
    }
    
    
}
