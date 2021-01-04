//
//  ViewController.swift
//  exercise_2.2
//
//  Created by Scores_Main_User on 12/30/20.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var scrollView2: UIScrollView!
      
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.scrollView1.contentSize = CGSize(width: 700, height: 50)
        self.scrollView2.contentSize = CGSize(width: 50, height: 250)
     
        self.scrollView1.delegate = self
        self.scrollView2.delegate = self
        
        
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        if scrollView.self===scrollView1 {
//            let x:CGFloat = CGFloat(0)
//            let y = scrollView1.contentOffset.x / CGFloat(4)
//
//            scrollView2.setContentOffset(CGPoint(x: x, y: y), animated: true)
//
//        }else{
////            let y = CGFloat(0)
////            let x = scrollView2.contentOffset.y * CGFloat(4)
////
////            scrollView1.setContentOffset(CGPoint(x: x, y: y), animated: true)
//            print()
//        }
//    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.self===scrollView1 {
            let x:CGFloat = CGFloat(0)
            let y = scrollView1.contentOffset.x / CGFloat(4)

            scrollView2.setContentOffset(CGPoint(x: x, y: y), animated: true)

        }else{
            let y = CGFloat(0)
            let x = scrollView2.contentOffset.y * CGFloat(4)

            scrollView1.setContentOffset(CGPoint(x: x, y: y), animated: true)
        }
    }
    
    @IBAction func switchFunc(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            self.scrollView1.isScrollEnabled = true
            self.scrollView2.isScrollEnabled = true
            return
        default:
            self.scrollView1.isScrollEnabled = false
            self.scrollView2.isScrollEnabled = false
            return
        }
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        self.scrollView1.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        self.scrollView2.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

// MARK: - UIScrollViewDelegate
