//
//  YiNuoTabBarController.swift
//  yinuo
//
//  Created by Tim on 2018/1/10.
//  Copyright © 2018年 yinuo. All rights reserved.
//  自定义TabBar

import UIKit
import SnapKit

class BaseTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //设置全局颜色
        UITabBar.appearance().tintColor = ColorWithTheme

    
       
        // 添加子控制器
        addChildViewControllers()
        
        
        
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(TestRefreshVC(), title: "tabbar1", imageName: "home_tabbar")
        setChildViewController(Test2ViewController(), title: "tabbar2", imageName: "home_tabbar")
        //        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage")
        setChildViewController(Test2ViewController(), title: "tabbar3", imageName: "home_tabbar")
        setChildViewController(Test3ViewController(), title: "tabbar4", imageName: "home_tabbar")

    }
    
    
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_press")
        
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        addChild(BaseNavigationVC(rootViewController: childController))
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
