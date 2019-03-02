//
//  TestTableViewCell.swift
//  CJWBaseObjct_Swift
//
//  Created by 陈经伟 on 2019/3/2.
//  Copyright © 2019 陈经伟. All rights reserved.
//

import UIKit

class TestTableViewCell: BaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configeWithModel(model: Any) {
        let text = model as! String
        textLabel?.text = text
    }

}
