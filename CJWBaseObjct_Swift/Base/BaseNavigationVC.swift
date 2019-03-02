//
//  YiNuoNavigationViewController.swift
//  yinuo
//
//  Created by Tim on 2018/1/26.
//  Copyright © 2018年 yinuo. All rights reserved.
//

import UIKit

class BaseNavigationVC: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //状态栏颜色
        navigationBar.barStyle = .black
        
        // 导航颜色
        navigationBar.barTintColor = ColorWithTheme
        
        //设置右划手势的代理为自己
        self.interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    
    // 通过拦截push方法来设置每个push进来的控制器的返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            let btn = UIButton(type: .custom)
            btn.setImage(UIImage(named: "back_btn"), for: .normal)
            btn.sizeToFit()
            btn.contentHorizontalAlignment = .left
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
            btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            btn.adjustsImageWhenHighlighted = false
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
            
            //设置右划返回为true
            self.interactivePopGestureRecognizer?.isEnabled = true
        }
        
        
        super.pushViewController(viewController, animated: true)
    }
    
    // 避免pop到rootVC还能响应手势,一拉就蹦的情况
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewControllers.count == 1 {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    @objc private func backClick() {
        self.popViewController(animated: true)
    }
    
}

