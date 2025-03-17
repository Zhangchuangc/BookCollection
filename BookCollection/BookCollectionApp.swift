//
//  BookCollectionApp.swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//

import SwiftUI

@main
struct BookCollectionApp: App {
    @StateObject private var store = BookStore()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(store)
        }
    }
}
