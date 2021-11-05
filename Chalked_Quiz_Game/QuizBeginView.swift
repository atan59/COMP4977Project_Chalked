//
//  QuizBeginView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-11-05.
//

import SwiftUI

struct QuizBeginView: View {
    var body: some View {
        VStack {
            Text("CATEGORY")
                .font(.largeTitle)
                .fontWeight(.bold)
            RemoteImage(url: "https://api4all.azurewebsites.net/images/flintstone/fred.png")
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            NavigationLink(destination: QuizQuestionsView()) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Begin Quiz")
                }
                .frame(width: 250, height: 50)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct QuizBeginView_Previews: PreviewProvider {
    static var previews: some View {
        QuizBeginView()
    }
}
