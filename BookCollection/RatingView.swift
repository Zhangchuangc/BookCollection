//
//  RatingView.swift
//  BookCollection
//
//  Created by 张闯闯 on 2025/3/18.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { number in
                Image(systemName: "star.fill")
                    .foregroundColor(number <= rating ? .yellow : .gray)
                    .font(.caption)
            }
        }
    }
}
