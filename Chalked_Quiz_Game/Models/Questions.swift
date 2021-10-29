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
}
