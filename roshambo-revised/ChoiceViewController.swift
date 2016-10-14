//
//  ViewController.swift
//  roshambo-revised
//
//  Created by Nitish on 13/10/16.
//  Copyright © 2016 Nitish. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBAction func playRock(sender: UIButton){
        let vc=self.storyboard?.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        vc.userChoice=getUserChoice(sender:sender)
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func playPaper(sender:UIButton){
        
        performSegue(withIdentifier: "Result", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="Result"{
            let cc=segue.destination as! ResultViewController
            cc.userChoice=getUserChoice(sender: sender as! UIButton)
        }
    }
    func getUserChoice(sender:UIButton) -> Shape {
        let shape=sender.title(for: .normal)!
        return Shape(rawValue: shape)!
    }
   

}

