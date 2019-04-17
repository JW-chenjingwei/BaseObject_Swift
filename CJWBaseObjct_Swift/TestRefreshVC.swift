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

        
        setup(estimatedRowHeight: 100, cell: TestTableViewCell.self) { (idp) -> (Any?) in
            return self.dataSource[idp.row]
        }
    }
    
    override func refreshData(completionHandler: @escaping ([Any]) -> ()) {
        
        //网络请求获取数据，pageIndex是请求页数直接传
        var index = [""]
        for item in  0...pageIndex * 10{
            index.append("\(item)")
        }
        completionHandler(index)
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestTableViewCell.self), for: indexPath) as! TestTableViewCell
//
//        cell.configeWithModel(model: dataSource[indexPath.row])
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Test2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
