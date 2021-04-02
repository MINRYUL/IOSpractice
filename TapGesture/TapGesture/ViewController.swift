//
//  ViewController.swift
//  TapGesture
//
//  Created by 김민창 on 2021/04/02.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
//    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
//        self.view.endEditing(true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let tapGesture: UITapGestureRecognizer =
//            UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//        self.view.addGestureRecognizer(tapGesture)
        let tapGesture: UITapGestureRecognizer =
                UITapGestureRecognizer()
        tapGesture.delegate = self  //delegate를 사용하면 다양한 상황에 맞는 동작들을 제어할 수 있다.
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return false
    }


}

