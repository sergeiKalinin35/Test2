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
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float (currentAnswers.count - 1)
            rangedSlider.value = answerCount
        }
    }
    
    
    // создаем стэки для переменного включения их.
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    // Массив в оутлеты
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabes: [UILabel]!
    @IBOutlet var rangedLabes: [UILabel]!
    
    
    @IBOutlet var multipleSwitch: [UISwitch]!
    
    
    
    // приватные свойства ответов и вопросов
    private let questions = Question.getQuestions()
    private var  questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        //определяем индекс кнопки
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        // дальше отобразить другой стэк вью
        nextQuestion()
        
    }
    
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitch, currentAnswers) {
            
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
                
                
            }
        }
        nextQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let resultVC = segue.destination as! ResultsViewController
       resultVC.answers = answersChoosen
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
          showMultipleStackView(with: currentAnswers) // break
        case .ranged:
          showRangedStackView(with: currentAnswers)//  break
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
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabes, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabes.first?.text = answers.first?.text
        rangedLabes.last?.text = answers.last?.text
        
        }
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
           return
       }
        
         performSegue(withIdentifier: "segue" , sender: nil)
    }
    
    
}








//переход на следующий экран в тесте single с фиксацией ответа
























