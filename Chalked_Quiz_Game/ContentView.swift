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
        NavigationView {
            TitleView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
