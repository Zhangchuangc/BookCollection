//
//  Book.swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//

import Foundation

enum BookCategory: String, CaseIterable, Identifiable {
    case fiction = "小说"
    case technology = "科技"
    case philosophy = "哲学"
    case art = "艺术"
    
    var id: Self { self }
}

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var category: BookCategory
    var rating: Int
    var isRead: Bool
}
