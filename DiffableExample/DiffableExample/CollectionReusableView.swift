//
//  CollectionReusableView.swift
//  DiffableExample
//
//  Created by 김민창 on 2022/01/06.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    static let identifier = "Header"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureView() {
        self.backgroundColor = .systemBlue
    }
}
