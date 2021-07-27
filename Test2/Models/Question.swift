//
//  Question.swift
//  Test2
//
//  Created by Sergey on 21.07.2021.
//


enum ResponseType {
    case single
    case multiple
    case ranged
}


struct Question {
    let text : String
    let type: ResponseType
    let answers : [Answer]
    
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle)
                
                ]
                ),
         
            Question(
                text: "Что вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                
                ]
                ),
        
        
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(text: "Обожаю", type: .dog),
                    Answer(text: "Ненавижу", type: .cat),
                    Answer(text: "Нервничаю", type: .rabbit),
                    Answer(text: "Не замечаю", type: .turtle)
                
                ]
                ),
        
            ]
        
    }
    
}












