//
//  ViewController.swift
//  SnapKitTable
//
//  Created by 김민창 on 2021/04/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let category: [Category] = [
        Category(name: "관심있는 글", boards: [
            Board(title: "내가 쓴 글", subTitle: nil, isFavorite: false),
            Board(title: "댓글 단 글", subTitle: nil, isFavorite: false),
            Board(title: "스크랩 한 글", subTitle: nil, isFavorite: false)
        ]),
        Category(name: "정보", boards: [
            Board(title: "정보, 질문", subTitle: "각종 정보 및 질문 게시판", isFavorite: false),
            Board(title: "자유게시판", subTitle: nil, isFavorite: false),
            Board(title: "취업, 진로", subTitle: "취업, 창업, 진로 게시판", isFavorite: false),
            Board(title: "공시생", subTitle: "5/7/9급 공무원 준비생 게시판", isFavorite: false),
        ]),
        Category(name: "홍보", boards: [
            Board(title: "홍보게시판", subTitle: nil, isFavorite: false),
            Board(title: "동아리", subTitle: nil, isFavorite: false)
        ])
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(SnpTableViewCell.self, forCellReuseIdentifier: SnpTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        createUI()
    }
    
    private func createUI() {
//        let rightButtonItem = UIBarButtonItem(image: system.folder, style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>)
        self.navigationItem.title = "SnapKit"
//        self.navigationItem.rightBarButtonItem
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category[section].boards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SnpTableViewCell.identifier, for: indexPath) as! SnpTableViewCell
        
        cell.boardTitleLabel.text = category[indexPath.section].boards[indexPath.row].title
        cell.boardSubTitleLabel.text = category[indexPath.section].boards[indexPath.row].subTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        headerView.backgroundColor = .systemBackground
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = category[section].name
        headerView.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.equalTo(headerView.snp.left).offset(20)
            make.centerY.equalTo(headerView)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))
        let lineView = UIView()
        
        footerView.addSubview(lineView)
        footerView.backgroundColor = .systemBackground
        lineView.backgroundColor = .lightGray
        
        lineView.snp.makeConstraints { make in
            make.left.right.equalTo(footerView).inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
            make.height.equalTo(1)
            make.centerY.equalTo(footerView)
        }
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}

