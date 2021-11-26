//
//  QuizQuestionsView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-11-05.
//

import SwiftUI

struct QuizQuestionsView: View {
    @Binding var questions: [Question]
    @State var randomQuestion: Question?
    @State var answers = [String:String]()
    @Binding var isDone: Bool
    @Binding var currentScore: Int
    @Binding var correctAnswerCount: Int
    @State private var timerStop: Bool = false
    
    let answerColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let lifelineColumns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    let answerData = (1...4)
    let lifelineData = (1...3)
    
    @State var counter: Int = 0
    var countTo: Int = 30
    
    var body: some View {
        ZStack {
            if !isDone {
                VStack {
                    HStack {
                        NavigationLink(destination: CategoryView()) {
                            Text("QUIT")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
                        }
                        .navigationBarHidden(true)
                        
                        Spacer()
                        VStack{
                            ZStack{
                                ProgressTrack()
                                    .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
                                ProgressBar(counter: counter, countTo: countTo)
                                Clock(counter: counter, countTo: countTo)
                                    .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
                            }
                        }.onReceive(timer) { time in
                            if (!timerStop) {
                                if (counter < countTo) {
                                    counter += 1
                                } else if (counter == countTo) {
                                    isDone = true
                                }
                            }
                        }
                    }
                    .padding()
                    Text(verbatim: "\(currentScore)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
                        .frame(width: 150, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), lineWidth: 5)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                )
                        )
                    VStack {
                        if let question = randomQuestion {
                            Text("\(question.question)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
                        }
                    }
                    .onAppear() {
                        if questions.isEmpty {
                            isDone = true
                            return
                        }
                        randomQuestion = questions.removeFirst()
                        print(questions)
                        answers = getAnswers(question: randomQuestion!)
                    }
                    .padding()
                    
                    LazyVGrid(columns: answerColumns, spacing: 10) {
                        ForEach(answers.sorted(by: >), id:\.key) { answer, correct in
                            NavigationLink(destination: QuizQuestionsView(questions: $questions, isDone: $isDone, currentScore: $currentScore, correctAnswerCount: $correctAnswerCount).onAppear {
                                self.timerStop = true
                                if correct == "true" {
                                    currentScore += 1000
                                    correctAnswerCount += 1
                                } else {
                                    isDone = true
                                }
                            }) {
                                Text("\(answer)")
                                    .fontWeight(.bold)
                                    .frame(minWidth: 175, minHeight: 100)
                                    .foregroundColor(Color.white)
                                    .background(Color(red: 72 / 255, green: 169 / 255, blue: 166 / 255))
                                    .padding()
                            }
                            .navigationBarHidden(true)
                        }
                    }
                    .padding()
                }
            } else {
                ScoreView(score: $currentScore, correctAnswerCount: $correctAnswerCount, totalAnswers: 10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 184 / 255, green: 225 / 255, blue: 255 / 255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}


struct QuizQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionsView(questions: .constant([]), isDone: .constant(false), currentScore: .constant(0), correctAnswerCount: .constant(0))
    }
}
