//
//  BookStore.swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//

import Combine
import Foundation

class BookStore: ObservableObject {
    @Published var books: [Book] = []
    
    init() { loadSampleData() }
    
    private func loadSampleData() {
        books = [
            Book(title: "1", author: "张", category: .technology, rating: 5, isRead: true),
            Book(title: "2", author: "闯", category: .art, rating: 4, isRead: false),
            Book(title: "3", author: "闯", category: .philosophy, rating: 5, isRead: true)
        ]
        sortBooks()
    }
    
    func addBook(_ book: Book) {
        books.append(book)
        sortBooks()
    }
    
    func deleteBook(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
    }
    
    func toggleReadStatus(for book: Book) {
        if let index = books.firstIndex(where: { $0.id == book.id }) {
            books[index].isRead.toggle()
        }
    }
    
    private func sortBooks() {
        books.sort { $0.rating > $1.rating }
    }
}
