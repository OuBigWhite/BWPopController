# BWPopController
超方便的弹框（swift）一句话实现弹窗
## 使用
```
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
    
```
