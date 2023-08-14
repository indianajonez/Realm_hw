//
//  JokeTableViewCell.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import UIKit

class JokesTableViewCell: UITableViewCell {

    // MARK: - Public properties

    private var labelJoke: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
        setupConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupSubview() {
        contentView.addSubview(labelJoke)
    }
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
        
            labelJoke.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelJoke.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            labelJoke.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelJoke.heightAnchor.constraint(equalToConstant: 20)
           
        ])
    }
    
    func update(joke: JokeRealm) {
        self.labelJoke.text = joke.value
    }
}


