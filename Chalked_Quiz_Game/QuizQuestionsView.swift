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
                                .frame(width: 100, height: 30)
                                .foregroundColor(Color.white)
                                .background(Color.gray)
                        }
                        
                        Spacer()
                        VStack{
                            ZStack{
                                ProgressTrack()
                                ProgressBar(counter: counter, countTo: countTo)
                                Clock(counter: counter, countTo: countTo)
                            }
                        }.onReceive(timer) { time in
                            if (counter < countTo) {
                                counter += 1
                            } else if (counter == countTo) {
                                isDone = true
                            }
                        }
                    }
                    .padding()
                    Text(verbatim: "\(currentScore)")
                    VStack {
                        if let question = randomQuestion {
                            Text("\(question.question)")
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
                    
                    LazyVGrid(columns: answerColumns, spacing: 10) {
                        ForEach(answers.sorted(by: >), id:\.key) { answer, correct in
                            NavigationLink(destination: QuizQuestionsView(questions: $questions, isDone: $isDone, currentScore: $currentScore, correctAnswerCount: $correctAnswerCount).onAppear {
                                if correct == "true" {
                                    currentScore += 1000
                                    correctAnswerCount += 1
                                }
                            }) {
                                Text("\(answer)")
                                    .padding()
                                    .frame(width: 175)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray)
                            }
                            .navigationBarHidden(true)
                        }
                    }
                    .padding()
                    HStack {
                        LazyVGrid(columns: lifelineColumns, spacing: 20) {
                            ForEach(lifelineData, id:\.self) {_text in
                                NavigationLink(destination: ScoreView(score: $currentScore, correctAnswerCount: $correctAnswerCount, totalAnswers: 10)) {
                                    Text("LIFELINE")
                                        .frame(width: 90, height: 30)
                                        .foregroundColor(Color.white)
                                        .background(Color.gray)
                                }
                                .navigationBarHidden(true)
                            }
                        }
                        .padding()
                    }
                }
            } else {
                ScoreView(score: $currentScore, correctAnswerCount: $correctAnswerCount, totalAnswers: 10)
            }
        }
    }
}


struct QuizQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionsView(questions: .constant([]), isDone: .constant(false), currentScore: .constant(0), correctAnswerCount: .constant(0))
    }
}
