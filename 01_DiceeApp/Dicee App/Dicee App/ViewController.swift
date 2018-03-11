//
//  ViewController.swift
//  Dicee App
//
//  Created by Qi Jsb on 2018/03/11.
//  Copyright © 2018年 Qi Jsb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceArray = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        updateDiceImagesWithAnim()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImagesWithAnim()
    }
    
    /// update dice
    func updateDiceImages() {
        self.diceImageView1.image = self.diceArray[Int(arc4random_uniform(6))]
        self.diceImageView2.image = self.diceArray[Int(arc4random_uniform(6))]
    }
    
    /// update dice with Anim
    func updateDiceImagesWithAnim() {
        
        UIView.animate(withDuration: 0.2, animations: {() -> Void in
            self.diceImageView1?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.diceImageView2?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.2, animations: {() -> Void in
                self.diceImageView1?.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.diceImageView2?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            self.updateDiceImages()
        })
    }
    
    
}
