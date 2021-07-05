//
//  Article.swift
//  MVVMExample
//
//  Created by 김민창 on 2021/07/05.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
