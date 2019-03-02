//
//  YiNuoHelpers.swift
//  yinuo
//
//  Created by Tim on 2018/1/26.
//  Copyright © 2018年 yinuo. All rights reserved.
//

import Foundation

//屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width;

//屏幕高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;

//屏幕缩放比
let SCREEN_SCALE = UIScreen.main.scale

// 宽高度缩小系数 (UI设计尺寸iphone 6尺寸)
let UI_WIDTH_SCALE:CGFloat = SCREEN_WIDTH / 375     // 弃用
let UI_HEIGHT_SCALE:CGFloat = SCREEN_HEIGHT / 667   // 弃用
let UI_SCALE:CGFloat = SCREEN_WIDTH / 375

//NavagationBar高度
let NavigationBarHeight: CGFloat = {

    if #available(iOS 11.0, *) {
        if UIApplication.shared.keyWindow!.safeAreaInsets.bottom > 0.0{
            return 88
        }else{
            return 64
        }
    } else {
        return 64
    }
}()



// Tabbar高度
let TabbarHeight: CGFloat = {
    
    if #available(iOS 11.0, *) {
        if UIApplication.shared.keyWindow!.safeAreaInsets.bottom > 0.0{
            return 83
        }else{
            return 49
        }
    } else {
        return 49
    }
}()

// 适配iPhone X Tabbar距离底部的距离(如：底部有操作按钮等使用场景)
let TabbarSafeBottomMargin: CGFloat = {
    if #available(iOS 11.0, *) {
        if UIApplication.shared.keyWindow == nil{
            return 0
        }
        if UIApplication.shared.keyWindow!.safeAreaInsets.bottom > 0.0{
            return 34
        }else{
            return 0
        }
    } else {
        return 0
    }
}()

// 字体
func yinuoFont(_ fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize);
}

/// 底部间距
func bottomMargin(_ margin:Int) -> Int {
    if #available(iOS 11.0, *) {
        if UIApplication.shared.keyWindow!.safeAreaInsets.bottom > 0.0{
            return margin - Int(TabbarSafeBottomMargin);
        }else{
            return margin
        }
    } else {
        return margin
    }
}


let ColorWithTheme = UIColor.jk_color(withHex: 0x009688)!
let ColorWhitBG = UIColor.jk_color(withHex: 0xeeeeee)!
let ColorWithRandom = UIColor.jk_random()!

/*颜色*/
func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}
