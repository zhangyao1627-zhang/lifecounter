//
//  ViewController.swift
//  lifecounter
//
//  Created by Yao Zhang on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var playerOneInfo: UILabel!
    
    @IBOutlet weak var playerTwoInfo: UILabel!
    
    @IBOutlet weak var playerInfo: UILabel!
    
    var label = true;
    var playerOneNum = 20;
    var playerTwoNum = 20;
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        if (label == false) {
            return
        }
        
        let buttonValue = sender.titleLabel?.text
        
        if sender.tag == 1 {
            switch buttonValue {
            case "+":
                playerOneNum += 1
            case "-":
                playerOneNum -= 1
            case "+5":
                playerOneNum += 5
            case "-5":
                playerOneNum -= 5
            default:
                print("failed")
            }
        } else if sender.tag == 2 {
            switch buttonValue {
            case "+":
                playerTwoNum += 1
            case "-":
                playerTwoNum -= 1
            case "+5":
                playerTwoNum += 5
            case "-5":
                playerTwoNum -= 5
            default:
                print("failed")
            }
        }
        
        playerOneInfo.text = "Player 1 Score: " + String(playerOneNum)
        playerTwoInfo.text = "Player 2 Score: " + String(playerTwoNum)
        
        if (playerOneNum <= 0) {
            playerInfo.text = "Player 1 LOSS"
            label = false
        }
        if (playerTwoNum <= 0) {
            playerInfo.text = "Player 2 LOSS"
            label = false
        }
    }
    
    @IBAction func Reset(_ sender: UIButton) {
//        label = true
//        playerOneNum = 20
//        playerTwoNum = 20
//        playerInfo.text = "Keep Going !"
//        playerOneInfo.text = "Player 1 Score: " + String(playerOneNum)
//        playerTwoInfo.text = "Player 2 Score: " + String(playerTwoNum)
        self.performSegue(withIdentifier: "goToMain", sender: self)
    }
}

