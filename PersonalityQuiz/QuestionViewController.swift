//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by JOY BEST on 8/17/19.
//  Copyright © 2019 JOY BEST. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var answersChosen: [Answer] = []
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    
    @IBOutlet weak var singleButton2: UIButton!
   
    @IBOutlet weak var singleButton3: UIButton!
    
    
    @IBOutlet weak var singleButton4: UIButton!
    
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
   
    @IBOutlet weak var multilabel1: UILabel!
    
    @IBOutlet weak var multilabel2: UILabel!
    
    
    @IBOutlet weak var multilabel3: UILabel!
    
    @IBOutlet weak var multilabel4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
   
    @IBOutlet weak var rangedLabel1: UILabel!
    
    @IBOutlet weak var rangedLabel2: UILabel!
    
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
        
        
    }
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: . normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multilabel1.text = answers[0].text
        multilabel2.text = answers[1].text
        multilabel3.text = answers[2].text
        multilabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
 
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
            updateSingleStack(using: currentAnswers)
        case .multiple:
            multipleStackView.isHidden = false
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            rangedStackView.isHidden = false
            updateRangedStack(using: currentAnswers)
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    
    
    
    
    

}
