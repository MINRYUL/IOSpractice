//
//  ViewController.swift
//  CombineExample
//
//  Created by 김민창 on 2022/01/06.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .preferredFont(forTextStyle: .title1, compatibleWith: .current)
        title.textColor = .systemBlue
        title.text = ""
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
    }()
    
    private let scriptLabel: UILabel = {
        let script = UILabel()
        script.font = .preferredFont(forTextStyle: .body, compatibleWith: .current)
        script.textColor = .systemGreen
        script.text = ""
        script.translatesAutoresizingMaskIntoConstraints = false
        script.textAlignment = .center
        script.numberOfLines = 0
        return script
    }()
    
    private var viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.updateText(title: "안녕하세요", script: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ")
    }
    
    private func configureView() {
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.scriptLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.scriptLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 30),
            self.scriptLabel.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            self.scriptLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.scriptLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor)
        ])
    }
    
    private func configureBinding() {
        self.viewModel.$titleText
            .receive(on: DispatchQueue.main)
            .sink( receiveValue: { [weak self] text in
                self?.titleLabel.text = text
            })
            .store(in: &self.cancellables)
        
        self.viewModel.$scriptText
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] text in
                self?.scriptLabel.text = text
            })
            .store(in: &self.cancellables)
    }
}

