//
//  Answer.swift
//  Test2
//
//  Created by Sergey on 21.07.2021.
//


struct Answer {
    let text: String
    let type: AnimalType
    
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        
        case .dog:
            return "1"
        case .cat:
            return "2"
        case .rabbit:
            return "3"
        case .turtle:
           return "4"
        }
    }
    
}























































