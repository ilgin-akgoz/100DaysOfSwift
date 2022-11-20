//
//  ViewController.swift
//  Milestone Challenge - 3
//
//  Created by Ilgın Akgöz on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    var usedLetters = [String]()
    var wrongAnswers = 0
    var currentWord = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(getLetterFromUser))
        
        loadWords()
        
    }
    
    func checkForLetter(word: String) {
        var promptWord = ""
        
        for letter in word {
            let strLetter = String(letter)
            
            if usedLetters.contains(strLetter) {
                promptWord += strLetter
            } else {
                promptWord += "?"
            }
        }
        
        title = "\(promptWord)"
    }
    
    func loadWords() {
        if let wordsFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let wordsContents = try? String(contentsOf: wordsFileURL) {
                var lines = wordsContents.components(separatedBy: "\n")
                
                if let randomWord = lines.randomElement() {
                    currentWord = randomWord
                    checkForLetter(word: currentWord)
                    print(randomWord)
                }
            }
        }
    }
    
    @objc func getLetterFromUser() {
        let ac = UIAlertController(title: "Enter a letter...", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Enter", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            
            if answer.count != 1 {
                let ac = UIAlertController(title: "", message: "Please enter a single letter!", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(ac, animated: true)
            }
            
            let answerUppercased = answer.uppercased()
            self?.usedLetters.append(answerUppercased)
        }
        checkForLetter(word: currentWord)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }


}

