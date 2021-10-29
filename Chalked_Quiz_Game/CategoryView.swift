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
        ScrollView {
            VStack {
                Text("Choose a Category")
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id:\.self) {_text in
                        RemoteImage(url: "https://avatars.githubusercontent.com/u/98681?v=4")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
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
