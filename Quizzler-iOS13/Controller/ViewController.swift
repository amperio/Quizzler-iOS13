//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txt_question: UILabel!
    @IBOutlet weak var answ1: UIButton!
    @IBOutlet weak var answ2: UIButton!
    @IBOutlet weak var answ3: UIButton!
    @IBOutlet weak var pgbEstado: UIProgressView!
    @IBOutlet weak var score: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func btn_answers(_ sender: UIButton) {
        
        let result = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        if result{
            delayy(boton: sender, colorin: UIColor.green)
        }
        else{
            delayy(boton: sender, colorin: UIColor.red)
        }
        
        quizBrain.checkEnd()
        updateUI()
    }
    
    func updateUI() {
        txt_question.text = quizBrain.getQuestion()
        pgbEstado.progress = quizBrain.setProgresBarState()
        score.text = quizBrain.getScore()
        answ1.setTitle(quizBrain.getAnswers(indice: 0), for: .normal)
        answ2.setTitle(quizBrain.getAnswers(indice: 1), for: .normal)
        answ3.setTitle(quizBrain.getAnswers(indice: 2), for: .normal)
        
        // OPCION 2
        /*
        answ1.setTitle(quizzBrain.getAnswers()[0], for: .normal)
        answ2.setTitle(quizzBrain.getAnswers()[1], for: .normal)
        answ3.setTitle(quizzBrain.getAnswers()[2], for: .normal)
        */
    }
    
    func delayy(boton: UIButton, colorin: UIColor) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            boton.backgroundColor = UIColor.clear
        }
        boton.backgroundColor = colorin
    }
}








//                ___                  ___ 
//               -   -________________-   -
//             /----.       AMP        .----\
//            (  __  |                |  __  )
//            | (@ ) |                | ( @) |
//           /\\____//                \\____//\
//          /              *:   :*             \
//          \`\ ____________________________ /`/
//           \                                /
//            \    $$$$$$$$$$$$$$$$$$$$$$    /
//             \    $$$$$$$$$$$$$$$$$$$$    /
//              -__  $$$$$$$$$$$$$$$$$$  __-
//                  -_$$$$$$$$$$$$$$$$_-


