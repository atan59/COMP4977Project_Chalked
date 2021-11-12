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
            RemoteImage(url: "https://api4all.azurewebsites.net/images/flintstone/fred.png")
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("Who Wants To Be A Programmer?")
                .font(.largeTitle)
                .fontWeight(.bold)
            NavigationLink(destination: CategoryView()) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("START")
                }
                .frame(width: 250, height: 50)
                .foregroundColor(Color.white)
                .background(Color.gray)
            }
            .navigationBarHidden(true)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
