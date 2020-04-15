//
//  CollectionViewCell.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let reuseID = "CollectionViewCell"
    //создание properties ячейки
    let studentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "specialization")
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .systemBlue
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(studentImageView)
        addSubview(nameLabel)

        studentImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        studentImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        studentImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        studentImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        studentImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        nameLabel.topAnchor.constraint(equalTo: studentImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
