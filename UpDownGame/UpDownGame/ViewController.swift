//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김민창 on 2021/03/13.
//

import UIKit

class ViewController: UIViewController {
    //Outlet은 UI Interface에 올라와있는 어떠한 값을 가져오고 싶거나 코드에서 활용하고 싶을때 활용
    @IBOutlet weak var slider: UISlider!    //스토리보드 위에 올려져있는 요소와 연결할 때 쓰는 어노테이션
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //인터페이스 빌더에 요소들이 이벤트를 받았을때 거기에 반응하기 위한 것.
    @IBAction func sliderValueChanged(_ sender: UISlider){  //이벤트에 반응하는 액션 어노테이션
        print(sender.value)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        slider.value = 15
        print("touch up reset button")
    }
}

