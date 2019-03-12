//
//  TestRefreshTableView.swift
//  CJWBaseObjct_Swift
//
//  Created by 陈经伟 on 2019/3/2.
//  Copyright © 2019 陈经伟. All rights reserved.
//

import UIKit

class TestRefreshVC: BaseRefreshTableVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup(estimatedRowHeight: 100, cell: TestTableViewCell.self)
        
    }
    
    override func refreshData(completionHandler: @escaping ([Any]) -> ()) {
        
        //网络请求获取数据，pageIndex是基类自动计算好的页数，直接传给网络请求参数即可
        var index = [""]
        for item in  0...pageIndex * 10{
            index.append("\(item)")
        }
        completionHandler(index)
    }

    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Test2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
