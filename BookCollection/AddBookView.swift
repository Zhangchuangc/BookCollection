//
//  AddBookView.swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: BookStore
    
    @State private var title = ""
    @State private var author = ""
    @State private var selectedCategory = BookCategory.fiction
    @State private var rating = 3
    
    var body: some View {
        NavigationView {
            Form {
                bookInfoSection
                categorySection
                ratingSection
                submitButton
            }
            .navigationTitle("添加")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var bookInfoSection: some View {
        Section("信息") {
            TextField("书名", text: $title)
            TextField("作者", text: $author)
        }
    }
    
    private var categorySection: some View {
        Section("分类") {
            Picker("分类", selection: $selectedCategory) {
                ForEach(BookCategory.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
    private var ratingSection: some View {
        Section("评分") {
            Stepper(value: $rating, in: 1...5) {
                HStack {
                    Text("评分：")
                    RatingView(rating: rating)
                }
            }
        }
    }
    
    private var submitButton: some View {
        Section {
            Button("添加") {
                let newBook = Book(
                    title: title,
                    author: author,
                    category: selectedCategory,
                    rating: rating,
                    isRead: false
                )
                store.addBook(newBook)
                dismiss()
            }
            .disabled(title.isEmpty || author.isEmpty)
        }
    }
}
