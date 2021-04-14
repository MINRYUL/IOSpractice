//
//  ViewController.swift
//  Alert
//
//  Created by 김민창 on 2021/04/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchUpShowAlertButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style: UIAlertController.Style) {
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        //handler는 사용자가 ok 버튼을 눌렀을때 실행될 클로저이다.
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        //액션을 어떤순서로 넣던지 위치는 얼럿컨트롤러가 알아서 배정해준다.
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        //액션추가
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "another", style: UIAlertAction.Style.default, handler: handler)
        //다른 스타일은 상관없으나 cancel 스타일을 하나만 가능하므로 오류가 발생한다.
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField(configurationHandler: {(field: UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
            //텍스트 필드를 넣어줄 수 있다.
        })
        
        self.present(alertController, animated: true, completion: {
            //모달이 끝나고 실행될 블럭이다.
            print("Alert controller shown")
        })
        //present해서 모달을 올려준다.
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

