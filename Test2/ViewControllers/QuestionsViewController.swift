//
//  QuestionsViewController.swift
//  Test2
//
//  Created by Sergey on 25.07.2021.
//

import UIKit

class QuestionsViewController: UIViewController {

    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var rangedSlider: UISlider!
    
    
    // создаем стэки для переменного включения их.
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    // Массив в оутлеты
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabes: [UILabel]!
    @IBOutlet var rangedLabes: [UILabel]!
    
    // приватные свойства ответов и вопросов
    private let questions = Question.getQuestions()
    private var  questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI()
        
        
    }
    
    
}

// privat Methods

extension QuestionsViewController {
    
    private func updateUI() {
        //спрятать все стэки
        for stackView in [singleStackView, multipleStackView,rangedStackView] {
            stackView?.isHidden = true
            
        }
        // вопрос в лайбл  извлекаем из массива вопрос getQuestions
        let currentQuestion = questions[questionIndex]
        // передача значения в лайбл вопроса
        questionLabel.text = currentQuestion.text
        // и прогресс вьев в позицию и установить
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        //отобразить номер 1 из 3
        title = "ВОПРОС № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentStackView(for: currentQuestion.type)
        
        // последовательно отображаем скрытые стэки
        }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
                
        case .single:
          showSingleStackView(with: currentAnswers) // break
        case .multiple:
            break
        case .ranged:
            break
        }
        
    }
        //три доп метода под каждый стэк вью
    private func showSingleStackView(with answers: [Answer]) {
        // отобразить текущий стэк вью
        singleStackView.isHidden = false
        // кортеджи через zip
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
            
        }
        
    }
    
}

























