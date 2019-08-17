//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by JOY BEST on 8/17/19.
//  Copyright © 2019 JOY BEST. All rights reserved.
//

import Foundation

var questionIndex = 0

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing.  You surroun yourself with the peoole you love and enjoy activities with your friends."
        case .cat:
            return "Michievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's softy.  You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details.  Slow and steady wins the race."
        }
    }
}
var questions: [Question] = [
    Question(text: "Which food do you like the most?",
              type: .single,
              answers: [
                Answer (text: "Steak", type: .dog),
                Answer (text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
                ]),
    Question(text: "Which activities do you enjoy", type: .multiple, answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
                    ]),
    Question(text: "How much do you enjoy car rides", type: .ranged,
             answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .dog)
                ])
]

