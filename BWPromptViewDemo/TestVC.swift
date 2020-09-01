//
//  TestVC.swift
//  BWPromptView
//
//  Created by 冉彬 on 2020/4/30.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import UIKit

class TestVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "顶部提示框"
        self.view.backgroundColor = .white
        
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        
        // Do any additional setup after loading the view.
    }
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        BWPromptView.show(message: "我是提示框")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "UITableViewCell")
        if indexPath.row == 0 {
            cell.textLabel?.text = "显示提示框"
        }
        else {
            cell.textLabel?.text = "自定义时间的提示框（5秒）"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            BWPromptView.show(message: "我是顶部提示框")
        }
        else {
            BWPromptView.show(message: "我会显示5秒钟", time: 5)
        }
    }

    
}
