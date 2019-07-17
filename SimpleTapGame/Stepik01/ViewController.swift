//
//  ViewController.swift
//  Stepik01
//
//  Created by Dmitry Belyaev on 15/07/2019.
//  Copyright © 2019 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateUI()
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        if isGameActive {
            stopGame()
        } else {
            startGame()
        }
    }
    
    private var score = 0
    private var isGameActive = false
    private var gameTimeLeft: TimeInterval = 0
    private var gameTimer: Timer?
    private var timer: Timer?
    private let displayDuration: TimeInterval = 2
    
    @IBOutlet weak var gameObject: UIImageView!
    @IBOutlet weak var shapeX: NSLayoutConstraint!
    @IBOutlet weak var shapeY: NSLayoutConstraint!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gameFieldView: UIView!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func objectTapped(_ sender: UITapGestureRecognizer) {
        guard isGameActive else { return }
        repositionImage()
        score += 1
    }
    
    private func stopGame() {
        isGameActive = false
        updateUI()
        gameTimer?.invalidate()
        timer?.invalidate()
        scoreLabel.text = "Последний счет: \(score)"
    }
    
    private func startGame() {
        score = 0
        repositionImage()
        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(gameTimerTick),
                                         userInfo: nil,
                                         repeats: true)
        gameTimeLeft = stepper.value
        isGameActive = true
        updateUI()
    }
    
    private func updateUI() {
        gameObject.isHidden = !isGameActive
        stepper.isEnabled = !isGameActive
        if isGameActive {
            gameButton.setTitle("Остановить", for: .normal)
            timeLabel.text = "Осталось: \(Int(gameTimeLeft)) сек"
        } else {
            gameButton.setTitle("Начать", for: .normal)
            timeLabel.text = "Время: \(Int(stepper.value)) сек"
        }
    }
    
    @objc private func gameTimerTick() {
        gameTimeLeft-=1
        stepper.value = gameTimeLeft
        if gameTimeLeft <= 0 {
            stopGame()
        } else {
           updateUI()
        }
        
    }
    
    private func repositionImage() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: displayDuration,
                                     target: self,
                                     selector: #selector(moveImage),
                                     userInfo: nil,
                                     repeats: true)
        timer?.fire()
    }
    
    @objc private func moveImage() {
        let maxX = gameFieldView.bounds.maxX - gameObject.frame.maxX
        let maxY = gameFieldView.bounds.maxY - gameObject.frame.maxY
        shapeX.constant = CGFloat(arc4random_uniform(UInt32(maxX)))
        shapeY.constant = CGFloat(arc4random_uniform(UInt32(maxY)))
    }
    
    override func viewDidLoad() {
        gameFieldView.layer.borderWidth = 1
        gameFieldView.layer.borderColor = UIColor.gray.cgColor
        gameFieldView.layer.cornerRadius = 5
        updateUI()
        super.viewDidLoad()
    }


}

