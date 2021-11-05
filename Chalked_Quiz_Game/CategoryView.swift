//
//  CategoryView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-10-29.
//

import SwiftUI

struct CategoryView: View {
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
                    ForEach(data, id:\.self) {_text in
                        NavigationLink(destination: QuizBeginView()) {
                            RemoteImage(url: "https://api4all.azurewebsites.net/images/flintstone/fred.png")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 130, height: 130)
                        }
                        .navigationBarHidden(true)
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
