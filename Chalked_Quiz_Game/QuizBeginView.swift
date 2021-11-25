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
            RemoteImage(url: "https://api4all.azurewebsites.net/images/flintstone/fred.png")
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            NavigationLink(destination: QuizQuestionsView(questions: $questions, isDone: $isDone, currentScore: $currentScore, correctAnswerCount: $correctAnswerCount)) {
                Text("Begin Quiz")
                    .frame(width: 250, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .padding()
            }
            .disabled(isDisabled)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            Api().getQuestionsByCategory(tag: tagName) { questions in
                self.questions = questions
                isDisabled = false
                print(questions)
            }
        }
    }
}

struct QuizBeginView_Previews: PreviewProvider {
    static var previews: some View {
        QuizBeginView(tagName: "Linux")
    }
}
