//
//  ViewController.swift
//  AsyncExample
//
//  Created by 김민창 on 2021/04/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        //이미지 다운 구현 -> 이미지 뷰에 세팅
        
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/ESC_large_ISS022_ISS022-E-11387-edit_01.JPG/1600px-ESC_large_ISS022_ISS022-E-11387-edit_01.JPG")!
        //http는 사용이 안될 수 있음 Info에 세팅해야함
        
        OperationQueue().addOperation { //비동기 방식으로 이미지를 받아오기. 큰 용량의 데이터는 비동기로 받아오는 것이 좋음.
            let imageData: Data = try! Data.init(contentsOf: imageURL) //이 작업이 끝나기 전까지 코드가 넘어가지 않는다. 따라서 비동기 방식으로 이미지를 받아와야 한다.
            let image: UIImage = UIImage(data: imageData)!
            //self.imageView.image = image <- 여기서 돌면 메인에서 도는 것이 아님.
            OperationQueue.main.addOperation {
                self.imageView.image = image //UI에 영향을 미치는 코드는 메인에서 돌아야 한다.
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

