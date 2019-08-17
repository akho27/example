//
//  TVShowCell.swift
//  NavigationController
//
//  Created by Akingson Chun on 16/07/2019.
//

import UIKit

class TVShowCell: UITableViewCell {
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(cellImageView)
        addSubview(cellTitleLabel)
        addSubview(cellDescriptionLabel)
    }
    
    private func setupConstraints() {
        cellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        cellImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        cellImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cellTitleLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor).isActive = true
        cellTitleLabel.leftAnchor.constraint(equalTo: cellImageView.rightAnchor, constant: 20).isActive = true
        cellTitleLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -10).isActive = true
        
        cellDescriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor,constant: 5).isActive = true
        cellDescriptionLabel.leftAnchor.constraint(equalTo: cellTitleLabel.leftAnchor).isActive = true
        cellDescriptionLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -10).isActive = true
        cellDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
    }
    
}
