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
            Text("Who Wants to Be a Programmer?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 125)
                .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), lineWidth: 5)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                        )
                )
            RemoteImage(url: "https://cdn.discordapp.com/attachments/823140268252332042/913911396431966228/logo-removebg-preview_1.png")
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding()
                .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
            NavigationLink(destination: CategoryView()) {
                Text("START")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 250, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
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
