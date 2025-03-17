//
//  BookRowView..swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//

import SwiftUI

struct BookRowView: View {
    let book: Book
    @EnvironmentObject var store: BookStore
    
    var body: some View {
        HStack(spacing: 16) {
            statusIndicator
            bookInfo
            Spacer()
            toggleStatusButton
        }
        .padding(.vertical, 8)
        .opacity(book.isRead ? 0.8 : 1)
    }
    
    private var statusIndicator: some View {
        Image(systemName: book.isRead ? "book.closed.fill" : "book.fill")
            .foregroundColor(book.isRead ? .green : .gray)
    }
    
    private var bookInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(book.title)
                .font(.headline)
            
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                categoryTag
                RatingView(rating: book.rating)
            }
        }
    }
    
    private var categoryTag: some View {
        Text(book.category.rawValue)
            .padding(4)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(4)
    }
    
    private var toggleStatusButton: some View {
        Button {
            store.toggleReadStatus(for: book)
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath")
                .foregroundColor(.blue)
        }
    }
}
