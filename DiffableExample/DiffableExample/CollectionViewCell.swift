//
//  CollectionViewCell.swift
//  DiffableExample
//
//  Created by 김민창 on 2022/01/06.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.backgroundColor = .systemGreen
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
