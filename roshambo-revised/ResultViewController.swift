//
//  ResultViewController.swift
//  roshambo-revised
//
//  Created by Nitish on 13/10/16.
//  Copyright © 2016 Nitish. All rights reserved.
//

import UIKit
enum Shape: String{
    case Rock="Rock"
    case Paper="Paper"
    case Scissor="Scissor"
    
    static func randomShape()-> Shape{
        let shape=["Rock","Paper","Scissor"]
        let random=Int(arc4random_uniform(3))
        return Shape(rawValue: shape[random])!
    }
}

class ResultViewController: UIViewController {
    let opponentChoice:Shape=Shape.randomShape()
    var userChoice:Shape!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    private func displayResult() {
        var imageName:String
        var text:String
        let matchup="\(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        
        switch (userChoice!,opponentChoice) {
        case let (user,opponent) where user==opponent:
            imageName="\(userChoice.rawValue)-\(opponentChoice.rawValue)"
            text="\(matchup): It's a tie"
        case (.Rock, .Scissor),( .Paper, .Rock),( .Scissor, .Paper):
            imageName="\(userChoice.rawValue)-\(opponentChoice.rawValue)"
            text="\(matchup): You win. 😎"
        default:
            imageName="\(opponentChoice.rawValue)-\(userChoice.rawValue)"
            text="\(matchup): You lose. 😑"
        }
        imageName=imageName.lowercased()
        resultView.image=UIImage(named: imageName)
        resultLabel.text=text
    }
    @IBAction func playAgain(sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
}
