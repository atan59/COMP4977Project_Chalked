//
//  Questions.swift
//  Chalked_Quiz_Game
//
//  Created by Alkarim Jiwa on 2021-10-29.
//

import Foundation

struct Question: Codable, Identifiable {
    var id: Int
    var question: String
    var description: String?
    var answers: Answer
    var multiple_correct_answers: String
    var correct_answers: CorrectAnswer
    var correct_answer: String?
    var explanation: String?
    var tip: String?
    var tags: [Category]
    var category: String
    var difficulty: String
}

struct Answer: Codable {
    var answer_a: String
    var answer_b: String
    var answer_c: String?
    var answer_d: String?
    var answer_e: String?
    var answer_f: String?
}

struct CorrectAnswer: Codable {
    var answer_a_correct: String
    var answer_b_correct: String
    var answer_c_correct: String?
    var answer_d_correct: String?
    var answer_e_correct: String?
    var answer_f_correct: String?
}

struct Category: Codable {
    var name: String
}

class Api : ObservableObject{
    @Published var questions = [Question]()
    
    let apiKey = "3irkYEaVgYMh7aKY5CXEkczetHAnJGf8PMLqNi7h"
    
    func getAllQuestions(completion:@escaping ([Question]) -> ()) {
        guard let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=\(apiKey)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let questions = try! JSONDecoder().decode([Question].self, from: data!)
            DispatchQueue.main.async {
                completion(questions)
            }
        }.resume()
    }
    
    func getQuestionsByCategory(tag: String, completion:@escaping ([Question]) -> ()) {
        guard let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=\(apiKey)&tags=\(tag)&limit=10") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let questions = try! JSONDecoder().decode([Question].self, from: data!)
            //            print(questions)
            DispatchQueue.main.async {
                completion(questions)
            }
        }.resume()
    }
}

func getAnswers(question: Question) -> [String:String] {
    var answers: [String:String] = [:]
    let answersMirror = Mirror(reflecting: question.answers)
    let boolMirror = Mirror(reflecting: question.correct_answers)
    var tempAnswersArr = [String]()
    var tempBoolArr = [String]()
    
    for (_, child) in answersMirror.children.enumerated() {
        if let val = child.value as? String {
            tempAnswersArr.append(val)
        }
    }
    
    for (_, child) in boolMirror.children.enumerated() {
        if let val = child.value as? String {
            tempBoolArr.append(val)
        }
    }
    
    for n in 0...tempAnswersArr.count - 1 {
        answers[tempAnswersArr[n]] = tempBoolArr[n]
    }
    
    return answers
}

