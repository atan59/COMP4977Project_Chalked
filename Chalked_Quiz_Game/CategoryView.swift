//
//  CategoryView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-10-29.
//

import SwiftUI

struct CategoryView: View {
    let tags = [
        "Linux",
        "PHP",
        "Docker",
        "HTML",
        "MySQL",
        "WordPress",
        "Laravel",
        "JavaScript",
        "DevOps"
    ]

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    let data = (1...12)

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("CHOOSE A CATEGORY")
                    .font(.title)
                    .fontWeight(.bold)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(tags, id: \.self) {
                        tag in NavigationLink("\(tag)", destination: QuizBeginView(tagName: "\(tag)"))
                    }
                }
                .padding()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
