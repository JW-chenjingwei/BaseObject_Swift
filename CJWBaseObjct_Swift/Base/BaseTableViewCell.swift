//
//  BaseTableViewCell.swift
//  yinuo
//
//  Created by 陈经伟 on 2018/11/7.
//  Copyright © 2018 yinuo. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    func configeWithModel(model:Any)
    
    func setupViews()
    
    func setupLayout()
}

class BaseTableViewCell: UITableViewCell, ConfigurableCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setupViews()
        setupLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configeWithModel(model:Any){
        
    }
    
    public func setupViews(){
        
    }
    
    public func setupLayout(){
        
    }
}
