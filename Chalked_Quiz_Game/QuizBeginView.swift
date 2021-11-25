//
//  QuizBeginView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-11-05.
//

import SwiftUI

struct QuizBeginView: View {
    @State var questions = [Question]()
    @State var tagName: String
    @State var isDone = false
    @State var currentScore = 0
    @State var correctAnswerCount = 0
    @State var isDisabled = true
    
    var body: some View {
        VStack {
            Text("\(tagName)")
                .font(.largeTitle)
                .fontWeight(.bold)
            RemoteImage(url: "https://cdn.discordapp.com/attachments/883469381085036617/913236363837583381/Screen_Shot_2021-11-24_at_5.11.10_PM.png")
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            NavigationLink(destination: QuizQuestionsView(questions: $questions, isDone: $isDone, currentScore: $currentScore, correctAnswerCount: $correctAnswerCount)) {
                Text("Begin Quiz")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 150, height: 80)
                    .foregroundColor(Color.white)
                    .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .padding()
            }
            .disabled(isDisabled)
            .navigationBarHidden(true)
        }
        .onAppear() {
            Api().getQuestionsByCategory(tag: tagName) { questions in
                self.questions = questions
                isDisabled = false
                print(questions)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 184 / 255, green: 225 / 255, blue: 255 / 255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct QuizBeginView_Previews: PreviewProvider {
    static var previews: some View {
        QuizBeginView(tagName: "Linux")
    }
}
