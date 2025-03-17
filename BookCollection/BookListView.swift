//
//  BookListView.swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//


import SwiftUI

struct BookListView: View {
    @EnvironmentObject var store: BookStore
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.books) { book in
                    BookRowView(book: book)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                if let index = store.books.firstIndex(where: { $0.id == book.id }) {
                                    store.deleteBook(at: IndexSet([index]))
                                }
                            } label: {
                                Label("删除", systemImage: "trash")
                            }
                        }
                }
            }
            .navigationTitle("我的藏书")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddBookView()
                    .environmentObject(store)
            }
        }
    }
}
