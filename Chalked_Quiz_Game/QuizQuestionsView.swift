//
//  QuizQuestionsView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-11-05.
//

import SwiftUI

//struct QuizQuestionsView: View {
//    var currentScore: Int = 0
//
//    let answerColumns = [
//        GridItem(.adaptive(minimum: 100))
//    ]
//    let lifelineColumns = [
//        GridItem(.adaptive(minimum: 90))
//    ]
//
//    let answerData = (1...4)
//    let lifelineData = (1...3)
//
//    @State var counter: Int = 0
//    var countTo: Int = 30
//
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {}) {
//                    Text("QUIT")
//                }
//                .frame(width: 100, height: 30)
//                .foregroundColor(Color.white)
//                .background(Color.gray)
//                Spacer()
//                VStack{
//                    ZStack{
//                        ProgressTrack()
//                        ProgressBar(counter: counter, countTo: countTo)
//                        Clock(counter: counter, countTo: countTo)
//                    }
//                }.onReceive(timer) { time in
//                    if (counter < countTo) {
//                        counter += 1
//                    } else if (counter == countTo) {
//
//                    }
//                }
//            }
//            .padding()
//            Text("\(currentScore)")
//            VStack {
//                RemoteImage(url: "https://api4all.azurewebsites.net/images/flintstone/fred.png")
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 200)
//            }
//            LazyVGrid(columns: answerColumns, spacing: 20) {
//                ForEach(answerData, id:\.self) {_text in
//                    NavigationLink(destination: ScoreView(score: 7000, correctAnswers: 7, totalAnswers: 10)) {
//                        Button(action: {}) {
//                            Text("ANSWER")
//                        }
//                        .frame(width: 100, height: 30)
//                        .foregroundColor(Color.white)
//                        .background(Color.gray)
//                    }
//                    .navigationBarHidden(true)
//                }
//            }
//            .padding()
//            HStack {
//                LazyVGrid(columns: lifelineColumns, spacing: 20) {
//                    ForEach(lifelineData, id:\.self) {_text in
//                        NavigationLink(destination: ScoreView(score: 7000, correctAnswers: 7, totalAnswers: 10)) {
//                                Button(action: {}) {
//                                    Text("LIFELINE")
//                                }
//                                .frame(width: 90, height: 30)
//                                .foregroundColor(Color.white)
//                                .background(Color.gray)
//                                }
//                        .navigationBarHidden(true)
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//}

struct QuizQuestionsView: View {
    @State var questions = [Question]()
    @State var randomQuestion: Question?
    
    var currentScore: Int = 0
    
    let answerColumns = [
        GridItem(.adaptive(minimum: 100))
    ]
    let lifelineColumns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    let answerData = (1...4)
    let lifelineData = (1...3)
    
    @State var counter: Int = 0
    var countTo: Int = 30
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Text("QUIT")
                }
                .frame(width: 100, height: 30)
                .foregroundColor(Color.white)
                .background(Color.gray)
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
                        
                    }
                }
            }
            .padding()
            Text("\(currentScore)")
            VStack {
                if let question = randomQuestion {
                    Text("\(question.question)")
                }
            }
            .onAppear() {
                Api().loadData { questions in
                    self.questions = questions
                    randomQuestion = questions.randomElement()!
                }
            }
            LazyVGrid(columns: answerColumns, spacing: 20) {
                ForEach(answerData, id:\.self) {_text in
                    NavigationLink(destination: ScoreView(score: 7000, correctAnswers: 7, totalAnswers: 10)) {
                        Button(action: {}) {
                            Text("ANSWER")
                        }
                        .frame(width: 100, height: 30)
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
                        NavigationLink(destination: ScoreView(score: 7000, correctAnswers: 7, totalAnswers: 10)) {
                            Button(action: {}) {
                                Text("LIFELINE")
                            }
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
    }
}

struct QuizQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionsView()
    }
}
