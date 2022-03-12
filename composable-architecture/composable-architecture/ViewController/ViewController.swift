//
//  ViewController.swift
//  composable-architecture
//
//  Created by 신동규 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    private let funFactLabel: UILabel = {
        let view = UILabel()
        view.text = "Fun fact"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(configuration: .tinted(), primaryAction: .init(handler: { _ in
            print("DEBUG: plus button")
        }))
        view.setTitle("+", for: .normal)
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(configuration: .tinted(), primaryAction: .init(handler: { _ in
            print("DEBUG: minus button")
        }))
        view.setTitle("-", for: .normal)
        return view
    }()
    
    private let countLabel: UILabel = {
        let view = UILabel()
        view.text = "0"
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plusButton, countLabel, minusButton])
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [funFactLabel, horizontalStackView])
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
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
        view.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

