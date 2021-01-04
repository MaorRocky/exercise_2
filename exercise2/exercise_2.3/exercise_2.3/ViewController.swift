//
//  ViewController.swift
//  exercise_2.3
//
//  Created by Scores_Main_User on 12/31/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeImage(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "Scale To Fill":
            image.contentMode = .scaleToFill
            return
        case "Scale Aspect Fit":
            image.contentMode = .scaleAspectFit
            return
        case "Scale Aspect Fill":
            image.contentMode = .scaleAspectFill
            return
        case "Top":
            image.contentMode = .top
            return
        case "Bottom":
            image.contentMode = .bottom
            return
        case "Left":
            image.contentMode = .left
            return
        case "Right":
            image.contentMode = .right
            return
        case "Center":
            image.contentMode = .center
            return
        default:
            print("Failed")
            return
        }
        
        

        
    }
    
    

    


}

