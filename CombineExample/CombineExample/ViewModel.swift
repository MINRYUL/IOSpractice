//
//  ViewModel.swift
//  CombineExample
//
//  Created by 김민창 on 2022/01/06.
//

import Foundation
import Combine

final class ViewModel {
    @Published var titleText = String()
    @Published var scriptText = String()
    
    func updateText(title: String, script: String) {
        self.titleText = title
        self.scriptText = script
    }
}
