//
//  TableJokeTableViewController.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import UIKit
import RealmSwift

class TableJokeViewController: UIViewController {
    
    // MARK: - Public properties
    
    // свойство объкта , в котором будут храниться все шутки (вычислимое свойство)
    private var listJokes: [JokeRealm]
    
    
    
    // MARK: - Private properties
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.delegate = self
        table.dataSource = self
        table.register(JokesTableViewCell.self, forCellReuseIdentifier: String(describing: JokesTableViewCell.self))
        return table
    }()
    
    
    // MARK: - Lifecycles
    
    init(){
        self.listJokes =  Storage.shared.fetchAll()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraits()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listJokes =  Storage.shared.fetchAll()
        tableView.reloadData()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        title = "Список шуток"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сортировка", style: .plain, target: self, action: #selector(didTapSortingButton))
        view.addSubview(tableView)
    }
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            
        ])
    }
    
    @objc private func didTapSortingButton() {
        listJokes =  Storage.shared.fetchAll()
        listJokes.sort(by: {$0.downloadDate > $1.downloadDate})
        
        tableView.reloadData()
       
    }
}
        
        
        
        // MARK: - UITableViewDelegate, UITableViewDataSource
        
        extension TableJokeViewController: UITableViewDataSource {
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                listJokes.count
                
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: JokesTableViewCell.self), for: indexPath) as? JokesTableViewCell else { return UITableViewCell() }
                cell.update(joke: listJokes[indexPath.row])
                //cell.update(joke: Joke(id: "efwfwef", value: "Joke value", created_at:" Date()"))
                return cell
            }
        }
        
        extension TableJokeViewController: UITableViewDelegate {
            
        }
    
        
