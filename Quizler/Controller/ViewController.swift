//
//  ViewController.swift
//  Quizler
//
//  Created by Meddor on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var labelScore: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Score"
        
        return view
    }()
    var quationLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Quations"
        view.numberOfLines = 0
        
        return view
    }()
    lazy var fitstButton: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("True", for: .normal)
        view.tintColor = .black
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 5
        view.addTarget(self, action: #selector(buttonsPressed), for: .touchUpInside)
        view.layer.cornerRadius = 16
        
        return view
    }()
    lazy var secondtButton: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("False", for: .normal)
        view.tintColor = .black
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 5
        view.addTarget(self, action: #selector(buttonsPressed), for: .touchUpInside)
        view.layer.cornerRadius = 16

        
        return view
    }()
    lazy var threetButton: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("VariantThree", for: .normal)
        view.tintColor = .black
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 5
        view.addTarget(self, action: #selector(buttonsPressed), for: .touchUpInside)
        view.layer.cornerRadius = 16

        
        
        return view
    }()
    var progressView: UIProgressView = {
        var view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false

        
        return view
    }()
    
    var quizBrain = QuizBrain()
    
    func nslConfigs () {
        view.addSubview(labelScore)
        NSLayoutConstraint.activate([
            labelScore.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            labelScore.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16)
        ])
        view.addSubview(quationLabel)
        NSLayoutConstraint.activate([
            quationLabel.topAnchor.constraint(equalTo: labelScore.bottomAnchor,constant: 16),
            quationLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            quationLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            quationLabel.heightAnchor.constraint(equalToConstant: 400)
        ])
        view.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            progressView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            progressView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            progressView.heightAnchor.constraint(equalToConstant: 25)
        ])
        view.addSubview(fitstButton)
        NSLayoutConstraint.activate([
            fitstButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            fitstButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            fitstButton.bottomAnchor.constraint(equalTo: progressView.topAnchor,constant: -16),
            fitstButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        view.addSubview(secondtButton)
        NSLayoutConstraint.activate([
            secondtButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            secondtButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            secondtButton.bottomAnchor.constraint(equalTo: fitstButton.topAnchor,constant: -16),
            secondtButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        view.addSubview(threetButton)
        NSLayoutConstraint.activate([
            threetButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            threetButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            threetButton.bottomAnchor.constraint(equalTo: secondtButton.topAnchor,constant: -16),
            threetButton.heightAnchor.constraint(equalToConstant: 60)

        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        nslConfigs()
        updateUI()
    }
    
    @objc func buttonsPressed(sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.chackAnswer(userAnswer: userAnswer ?? "Error user answer")
        
        if userGotItRight{
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuetion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

    }
    
    @objc func updateUI() {
        quationLabel.text = quizBrain.getQuetionText()
        progressView.progress = quizBrain.getProgress()
        labelScore.text = "Score \(quizBrain.geScore()) "
        fitstButton.backgroundColor = .clear
        secondtButton.backgroundColor = .clear
        threetButton.backgroundColor = .clear
        fitstButton.setTitle(quizBrain.quiz[quizBrain.quationNumber].answer[0],for: .normal)
        secondtButton.setTitle(quizBrain.quiz[quizBrain.quationNumber].answer[1],for: .normal)
        threetButton.setTitle(quizBrain.quiz[quizBrain.quationNumber].answer[2],for: .normal)
    }
    
}
