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
            RemoteImage(url: "https://cdn.discordapp.com/attachments/883469381085036617/913236363837583381/Screen_Shot_2021-11-24_at_5.11.10_PM.png")
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            Text("Who Wants To Be A Programmer?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
            NavigationLink(destination: CategoryView()) {
                Text("START")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 150, height: 80)
                    .foregroundColor(Color.white)
                    .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            .navigationBarHidden(true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 184 / 255, green: 225 / 255, blue: 255 / 255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
