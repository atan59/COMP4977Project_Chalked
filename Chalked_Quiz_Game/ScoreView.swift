//
//  ScoreView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-11-05.
//

import SwiftUI

struct ScoreView: View {
    var score: Int
    var correctAnswers: Int
    var totalAnswers: Int
    
    var body: some View {
        VStack {
            Text("CONGRATULATIONS")
                .font(.title)
                .fontWeight(.bold)
            VStack {
                Text("SCORE")
                    .fontWeight(.bold)
                Text("$\(score)")
                    .padding(.bottom)
                Text("CORRECT ANSWERS")
                    .fontWeight(.bold)
                    .padding(.top)
                Text(String(correctAnswers) + "/" + String(totalAnswers))
            }
            .frame(width: 250, height: 250)
            .foregroundColor(Color.white)
            .background(Color.gray)
            HStack{
                NavigationLink(destination: TitleView()) {
                    Text("Home")
                        .fontWeight(.bold)
                        .frame(width: 60, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .padding(.trailing)
                }
                .navigationBarHidden(true)
                NavigationLink(destination: CategoryView()) {
                    Text("PLAY AGAIN?")
                        .fontWeight(.bold)
                        .frame(width: 165, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                }
                .navigationBarHidden(true)
            }
            .padding()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 1000, correctAnswers: 5, totalAnswers: 10)
    }
}
