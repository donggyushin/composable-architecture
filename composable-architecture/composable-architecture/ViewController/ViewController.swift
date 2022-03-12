//
//  ViewController.swift
//  composable-architecture
//
//  Created by 신동규 on 2022/03/13.
//

import UIKit
import Combine
import ComposableArchitecture

class ViewController: UIViewController {
    
    private let viewStore: ViewStore<CounterState, CounterAction>
    private var cancellables: Set<AnyCancellable> = []
    
    private let funFactLabel: UILabel = {
        let view = UILabel()
        view.text = "Fun fact"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(configuration: .tinted(), primaryAction: .init(handler: { [weak self] _ in
            self?.viewStore.send(.incrementButtonTapped)
        }))
        view.setTitle("+", for: .normal)
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(configuration: .tinted(), primaryAction: .init(handler: { [weak self] _ in
            self?.viewStore.send(.decrementButtonTapped)
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
    
    init(store: Store<CounterState, CounterAction>) {
        self.viewStore = ViewStore(store)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configUI()
        bind()
    }
    
    private func configUI() {
        view.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func bind() {
        self.viewStore.publisher
            .map({ "\($0.count)" })
            .assign(to: \.text, on: countLabel)
            .store(in: &self.cancellables)
    }
}

