//
//  UIViewExtension.swift
//  yinuo
//
//  Created by 陈经伟 on 2018/12/6.
//  Copyright © 2018 yinuo. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    public  func cjw_layerCornerRadius(whit cornerRadius:CGFloat , borderWidth:CGFloat , borderColor:Int) {
        self.layer.cornerRadius = cornerRadius;
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = UIColor.jk_color(withHex: UInt32(borderColor)).cgColor
        self.clipsToBounds = true
    }
}
extension UIButton{
    public class func cjw_buttonTitle(whit title:String,fontSize:Int,textColor:Int) ->(UIButton){
        let btn = UIButton()
        btn .setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        btn.setTitleColor(UIColor.jk_color(withHex: UInt32(textColor)), for: .normal)
        return btn
    }
    
    public class func cjw_buttonImage(whit image:String) ->(UIButton){
        let btn = UIButton()
        btn.setImage(UIImage(named: image), for: .normal)
        return btn
    }
}

extension UILabel{
    public class func cjw_text(whit title:String,fontSize:Int,textColor:Int) -> (UILabel){
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        label.textColor = UIColor.jk_color(withHex: UInt32(textColor))
        return label
    }
}

extension UIImageView{
    public class func cjw_imageName(whit image:String) ->(UIImageView){
        let imageV = UIImageView()
        imageV.image = UIImage(named: image)
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }
    
    public class func cjw_backgoundColor(whit backgoundColor:Int) ->(UIImageView){
        let imageV = UIImageView()
        imageV.backgroundColor = UIColor.jk_color(withHex: UInt32(backgoundColor))
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }
}

