//
//  ResultsViewController.swift
//  Test2
//
//  Created by Sergey on 25.07.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        updateResult()
        
        
    }
}
extension ResultsViewController {
    
    private func updateResult() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        
        updateUI(With: mostFrequencyAnimal)
        
 }
   
    private func updateUI( With animal: AnimalType?) {
        animalTypeLabel.text = "ВЫ -\(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
    
}
