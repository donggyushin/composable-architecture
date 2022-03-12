//
//  ViewController.swift
//  composable-architecture
//
//  Created by 신동규 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configUI()
    }
    
    private func configUI() {
        
    }
}

