//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 김민창 on 2021/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("button tapped")
    }
    
    @IBAction func sliderValueChanged(_sender: UISlider) {
        print("slider value changed")
    }

}

