//
//  BaseView.swift
//  yinuo
//
//  Created by 陈经伟 on 2019/2/22.
//  Copyright © 2019 yinuo. All rights reserved.
//

import UIKit

class BaseView: UIView {

    public func setupViews(){}
    public func setupLayout(){}
    public func configeModel(_ mode: Any){}
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
