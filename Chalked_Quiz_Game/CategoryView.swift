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
        GridItem(.adaptive(minimum: 150))
    ]

    let data = (1...12)

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("CHOOSE A CATEGORY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(tags, id: \.self) {
                        tag in NavigationLink(destination: QuizBeginView(tagName: "\(tag)")) {
                            Text("\(tag)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(width: 150, height: 80)
                                .foregroundColor(Color.white)
                                .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        }
                        .navigationBarHidden(true)
                    }
                }
                .padding()
            }
        }
        .padding(.top, 150.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 184 / 255, green: 225 / 255, blue: 255 / 255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
