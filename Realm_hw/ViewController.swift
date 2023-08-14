//
//  ViewController.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var networkService: NetworkService!
    
    private lazy var refrashButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(pushReloadAction))
    
    private lazy var lable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Шутки про Чака"
        layout()
        pushReloadAction()
        navigationItem.rightBarButtonItem = refrashButton
    }
    
    private func layout() {
        view.addSubview(lable)
        
        
        NSLayoutConstraint.activate([
            lable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            lable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            lable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc private func pushReloadAction() {
        refrashButton.isEnabled = false
        networkService.downloadRandomJoke { [weak self] result in
            guard let self = self else { return }
            refrashButton.isEnabled = true
            DispatchQueue.main.async {
                switch result {
                case .success(let joke):
                    self.lable.text = joke.value
                    Storage.shared.create(joke: joke)
                case .failure(let error):
                    self.lable.text = "Something went wrong: \(error.localizedDescription)"
                    
                }
            }
        }
    }
}
