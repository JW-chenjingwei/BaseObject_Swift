//
//  BaseTableViewHeaderFooterView.swift
//  yinuo
//
//  Created by 陈经伟 on 2019/1/27.
//  Copyright © 2019 yinuo. All rights reserved.
//

import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupViews(){
        
    }
    public func setupLayout(){
        
    }

    public func configeWithModel(model:Any){
        
    }
}
