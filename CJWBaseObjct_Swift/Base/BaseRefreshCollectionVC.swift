//
//  BaseRefreshCollectionVC.swift
//  yinuo
//
//  Created by 陈经伟 on 2019/2/24.
//  Copyright © 2019 yinuo. All rights reserved.
//

import UIKit


class BaseRefreshCollectionVC: BaseViewController {

    public var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout: UICollectionViewFlowLayout())
    public var dataSource = [Any]()
    public var pageIndex = 1
    public func refreshData(completionHandler: @escaping (_ response:[Any]) ->() ){}

    private var cell : AnyClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func setupFollowLayout(_ layout:UICollectionViewFlowLayout){
//        layout.itemSize = CGSize(width: (SCREEN_WIDTH - 30 ) * 0.5, height: 240);
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout);
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.dataSource = self as UICollectionViewDataSource;
        collectionView.delegate = self as UICollectionViewDelegate;
        view.addSubview(collectionView)
        
        collectionView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.collectionView.mj_header.endRefreshing()
            self.collectionView.mj_footer.endRefreshing()
            self.pageIndex = 1;
            self.refreshData(completionHandler: { (obj) in
                self.dataSource = obj
                self.collectionView.reloadData()
            })
        })
        
        collectionView.mj_footer = MJRefreshAutoFooter.init(refreshingBlock: {
            self.collectionView.mj_header.endRefreshing()
            self.pageIndex += 1
            self.refreshData(completionHandler: { (obj) in
                self.dataSource.append(contentsOf: obj)
                self.collectionView.reloadData()
            })
            
        })
        
        collectionView.mj_header.beginRefreshing()
    }

    
}

extension BaseRefreshCollectionVC :UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: self.cell.self), for: indexPath)
        
        (collectionCell as? BaseCollectionViewCell)?.configeModel(mode: self.dataSource[indexPath.item])
        
        return collectionCell
    }
}
