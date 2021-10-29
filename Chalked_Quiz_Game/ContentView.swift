//
//  ContentView.swift
//  TestQuiz
//
//  Created by Amy Tan on 2021-10-08.
//

import SwiftUI

struct ContentView: View {
    @State var questions = [Question]()
    
    var body: some View {
        VStack {
            Text("What does HTML stand for?")
                .foregroundColor(.black)
                .padding(.top)
                .font(.system(size: 30))
            Spacer()
            VStack {
                Button("Hypertext Markup Language") {
                    
                }
                .padding(10)
                
                Button("Hypertext Makeup Language") {
                    
                }
                .padding(5)
                
                Button("HyperMark Text Language") {
                    
                }
                .padding(5)
                
                Button("Hypertext Mandatory Language") {
                    
                }
                .padding(5)
            }
            .font(.system(size: 23))
            Spacer()
        }
        .onAppear() {
            Api().loadData { (questions) in
                self.questions = questions
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
