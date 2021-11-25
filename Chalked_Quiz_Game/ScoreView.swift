//
//  ScoreView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-11-05.
//

import SwiftUI

struct ScoreView: View {
    @Binding var score: Int
    @Binding var correctAnswerCount: Int
    var totalAnswers: Int
    
    var body: some View {
        VStack {
            Text("CONGRATULATIONS")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
            VStack {
                Text("SCORE")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("$\(score)")
                    .font(.title2)
                    .padding(.bottom)
                Text("CORRECT ANSWERS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                Text(String(correctAnswerCount) + "/" + String(totalAnswers))
            }
            .padding(.top)
            .font(.title2)
            .frame(width: 250, height: 250)
            .foregroundColor(Color.white)
            .background(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
            HStack{
                NavigationLink(destination: TitleView()) {
                    Text("Home")
                        .fontWeight(.bold)
                        .frame(width: 70, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding()
                }
                .navigationBarHidden(true)
                NavigationLink(destination: CategoryView()) {
                    Text("PLAY AGAIN?")
                        .fontWeight(.bold)
                        .frame(width: 165, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color(red: 72 / 255, green: 200 / 255, blue: 166 / 255))
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }
                .navigationBarHidden(true)
            }
            .padding()
            if (correctAnswerCount < 5) {
                RemoteImage(url: "https://cdn.discordapp.com/emojis/883471964960878643.png?size=240")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
            } else if (correctAnswerCount > 5 && correctAnswerCount <= 7) {
                RemoteImage(url: "https://cdn.discordapp.com/emojis/883474617484841011.png?size=240")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
            } else if (correctAnswerCount > 7) {
                RemoteImage(url: "https://cdn.discordapp.com/emojis/890839419626606593.png?size=240")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 184 / 255, green: 225 / 255, blue: 255 / 255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: .constant(1000), correctAnswerCount: .constant(1), totalAnswers: 10)
    }
}
