//
//  BaseCollectionViewCell.swift
//  yinuo
//
//  Created by 陈经伟 on 2019/3/4.
//  Copyright © 2019 yinuo. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    public func setupViews(){}
    public func setupLayout(){}
    public func configeModel(mode:Any){}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
