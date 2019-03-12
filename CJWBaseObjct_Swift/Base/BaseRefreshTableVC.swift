//
//  BaseRefreshTableViewController.swift
//  yinuo
//
//  Created by 陈经伟 on 2018/11/7.
//  Copyright © 2018 yinuo. All rights reserved.
//

import UIKit
class BaseRefreshTableVC: BaseViewController {

    public let tableView = UITableView()
    public var dataSource = [Any]()
    public var pageIndex = 0
    public func refreshData(completionHandler: @escaping (_ response:[Any]) ->() ){}
    

    private var cell : AnyClass?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.estimatedRowHeight = 60;
        tableView.separatorInset = UIEdgeInsets()
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            self.pageIndex = 0;
            self.refreshData(completionHandler: { (obj) in
                self.dataSource = obj
                self.tableView.reloadData()
            })
        })
        
        tableView.mj_footer = MJRefreshAutoFooter.init(refreshingBlock: {
            self.tableView.mj_header.endRefreshing()
            self.pageIndex += 1
            self.refreshData(completionHandler: { (obj) in
                self.dataSource.append(contentsOf: obj)
                self.tableView.reloadData()
            })
            
        })
        
        
        tableView.mj_header.beginRefreshing()
    }
    

    public func setup(estimatedRowHeight height:CGFloat , cell:AnyClass){
        self.cell = cell;
        self.tableView.estimatedRowHeight = height
        tableView.register(cell.self , forCellReuseIdentifier: String(describing: cell.self))

    }
    

}

extension BaseRefreshTableVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier:String(describing: self.cell.self) , for: indexPath) as! BaseTableViewCell
        
        cell.configeWithModel(model: dataSource[indexPath.row])
        return cell
    }
    
    
}
