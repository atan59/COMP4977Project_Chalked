//
//  TitleView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-10-29.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            RemoteImage(url: "https://avatars.githubusercontent.com/u/98681?v=4")
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("Title Game").font(.largeTitle)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Start")
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
