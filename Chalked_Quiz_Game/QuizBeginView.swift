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
                .frame(width: 250, height: 50)
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
                .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
            NavigationLink(destination: QuizQuestionsView(questions: $questions, isDone: $isDone, currentScore: $currentScore, correctAnswerCount: $correctAnswerCount)) {
                Text("BEGIN QUIZ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 250, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .padding()
                    .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
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
