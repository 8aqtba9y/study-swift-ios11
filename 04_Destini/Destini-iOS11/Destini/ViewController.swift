//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    let storyBank = StoryBank()
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextStroy()
    }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        let currentStory:Story = storyBank.list[currentIndex]
        if sender.tag == 1 {
            currentIndex = currentStory.answer_aTo
        }
        else if sender.tag == 2 {
            currentIndex = currentStory.answer_bTo
        }
        
        nextStroy()
    }
    
    
    func nextStroy() {
        updateUI()
    }
    
    func updateUI() {
        let currentStory:Story = storyBank.list[currentIndex]
        let storyText = currentStory.story
        let answer_aTitle = currentStory.answer_a
        let answer_bTitle = currentStory.answer_b
        
        storyTextView.text = storyText
        
        if(answer_aTitle != "" && answer_bTitle != "") {
            topButton.setTitle(answer_aTitle, for: .normal)
            bottomButton.setTitle(answer_bTitle, for: .normal)
        }
        else {
            topButton.isEnabled = false
            bottomButton.isEnabled = false
            UIView.animate(withDuration: 0.775, animations: {
                self.topButton.backgroundColor = UIColor.clear
                self.bottomButton.backgroundColor = UIColor.clear
                self.topButton.setTitleColor(UIColor.clear, for: .disabled)
                self.bottomButton.setTitleColor(UIColor.clear, for: .disabled)
            }, completion: { (Void) in
                self.topButton.isHidden = true
                self.bottomButton.isHidden = true
            })
        }
    }


}

