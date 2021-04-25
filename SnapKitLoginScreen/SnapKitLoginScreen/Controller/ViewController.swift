//
//  ViewController.swift
//  SnapKitLoginScreen
//
//  Created by 김민창 on 2021/04/25.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private var titleimage = UIImageView().then {
        $0.image = UIImage(named: "PriceLabelpng")
        $0.contentMode = .scaleAspectFit
    }
    private var idField = SloyTextField().then {
        $0.placeholder = "이메일"
        $0.tintColor = .systemTeal
    }
    private var pwField = SloyTextField().then {
        $0.placeholder = "비밀번호"
        $0.tintColor = .systemTeal
    }
    private var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemTeal
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.setupMainLayoutWithSnapKit()
    }
    
    private func setupMainLayoutWithSnapKit() {
        view.addSubview(titleimage)
        view.addSubview(idField)
        view.addSubview(pwField)
        view.addSubview(loginButton)
        
        titleimage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().offset(-3)
            make.height.equalTo(150)
        }
        
        idField.snp.makeConstraints { make in
            make.top.equalTo(titleimage.snp.bottom).offset(90)
            make.leading.equalTo(titleimage.snp.leading).offset(35)
            make.trailing.equalTo(titleimage.snp.trailing).offset(-35)
            make.height.equalTo(55)
        }
        pwField.snp.makeConstraints { make in
            make.top.equalTo(idField.snp.bottom).offset(16)
            make.leading.equalTo(idField.snp.leading)
            make.trailing.equalTo(idField.snp.trailing)
            make.height.equalTo(55)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwField.snp.bottom).offset(16)
            make.leading.equalTo(pwField.snp.leading).offset(-5)
            make.trailing.equalTo(pwField.snp.trailing).offset(5)
            make.height.equalTo(44)
        }
    }
}
