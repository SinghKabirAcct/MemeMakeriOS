//
//  ViewController.swift
//  memeMaker
//
//  Created by Kabir Singh on 7/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    let segControlTop = UISegmentedControl(items: ["🕶", "💥", "💕"])
    
    let label1 = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 75, y: UIScreen.main.bounds.height / 3, width: 200, height: 30))
    
    let image = UIImageView()
    
    let label2 = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 60, y: UIScreen.main.bounds.height * 3/4.5, width: 200, height: 30))
    
    let segControlBot = UISegmentedControl(items: ["🐱", "🐶", "🐵"])

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segControlTop.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: UIScreen.main.bounds.height / 4, width: 100, height: 30)
        segControlTop.addTarget(self, action: #selector(topControl), for: .valueChanged)
        self.view.insertSubview(segControlTop, at: 0)
        segControlBot.addTarget(self, action: #selector(botControl), for: .valueChanged)
        
        label1.text = ""
        label1.textColor = .white
        label1.isUserInteractionEnabled = true
        self.view.insertSubview(label1, at: 0)
        self.view.bringSubviewToFront(label1)
        
        image.image = UIImage(named: "memeMan.jpg")
        image.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75, y: UIScreen.main.bounds.height / 2 - 100, width: 175, height: 220)
        self.view.insertSubview(image, at: 0)
        
        label2.text = ""
        label2.textColor = .white
        label2.isUserInteractionEnabled = true
        self.view.insertSubview(label2, at: 0)
        self.view.bringSubviewToFront(label2)
        
        segControlBot.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: UIScreen.main.bounds.height * 3 / 4, width: 100, height: 30)
        self.view.insertSubview(segControlBot, at: 0)
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(recognizer:)))
        let pan2 = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(recognizer:)))
        label1.addGestureRecognizer(pan)
        label2.addGestureRecognizer(pan2)
    }

    @objc func topControl() {
        if segControlTop.titleForSegment(at: segControlTop.selectedSegmentIndex) == "🕶"{
            label1.text = "You know what's cool?"
        } else if segControlTop.titleForSegment(at: segControlTop.selectedSegmentIndex) == "💥" {
            label1.text = "You know what angers?"
        } else {
            label1.text = "You know what I love?"
        }
            
    }
    
    @objc func botControl() {
        if segControlBot.titleForSegment(at: segControlBot.selectedSegmentIndex) == "🐱"{
            label2.text = "Cats like rats"
        } else if segControlBot.titleForSegment(at: segControlBot.selectedSegmentIndex) == "🐶" {
            label2.text = "Dogs on logs"
        } else {
            label2.text = "monkeys with keys"
        }
            
    }
    
    @objc
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: label1)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }

}

