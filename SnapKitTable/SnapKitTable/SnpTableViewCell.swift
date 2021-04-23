//
//  SnpTableViewCell.swift
//  SnapKitTable
//
//  Created by 김민창 on 2021/04/23.
//

import UIKit
import SnapKit

class SnpTableViewCell: UITableViewCell {
    
    static let identifier = "SnpTableViewCell"
    
    let pinButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pin"), for: .normal)
        button.tintColor = .darkGray
        
        return button
    }()
    
    let boardTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    let boardSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [boardTitleLabel, boardSubTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        contentView.addSubview(pinButton)
        contentView.addSubview(stackView)
        
        pinButton.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 0))
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(pinButton.snp.right).offset(20)
            make.centerY.equalTo(pinButton)
        }
    }
}
