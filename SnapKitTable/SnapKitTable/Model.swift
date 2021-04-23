//
//  Model.swift
//  SnapKitTable
//
//  Created by 김민창 on 2021/04/23.
//

import Foundation

struct Category {
    let name: String
    let boards: [Board]
}

struct Board {
    let title: String
    let subTitle: String?
    let isFavorite: Bool
}
