//
//  BaseViewController.swift
//  yinuo
//
//  Created by 陈经伟 on 2018/11/7.
//  Copyright © 2018 yinuo. All rights reserved.
//

import UIKit
import SnapKit
class BaseViewController: UIViewController {

    
    public func setupViews(){}
    public func setupLayout(){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupViews()
        setupLayout()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
