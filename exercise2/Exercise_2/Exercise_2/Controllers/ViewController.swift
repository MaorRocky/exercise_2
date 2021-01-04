//
//  ViewController.swift
//  Exercise_2
//
//  Created by Scores_Main_User on 12/30/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenTextField: UITextField!

    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueTextField: UITextField!

    
    @IBOutlet weak var colorTextField: UITextField!
    
    @IBOutlet weak var ColorImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initValuesAndDelegate()

        
        // Do any additional setup after loading the view.
    }
    
    
    func initValuesAndDelegate(){
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        redSlider.value = 100
        greenSlider.value = 200
        blueSlider.value = 70
        redTextField.text = String(format:"%.0f",redSlider.value)
        greenTextField.text = String(format:"%.0f",greenSlider.value)
        blueTextField.text = String(format:"%.0f",blueSlider.value)
        updateHexColor()
    }
    
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let text = String(format:"%.0f",sender.value)
        
        if(sender === self.redSlider)
        {
            redTextField.text = text
        }
        else if sender === self.greenSlider
        {
            greenTextField.text = text
        }
        else{
            blueTextField.text = text
        }
        
        updateHexColor()
    }
    
    
    

    
    
    @IBAction func TextFieldChanged(_ sender: UITextField) {
        redSlider.value = Float(redTextField.text!) ?? 0
        greenSlider.value = Float(greenTextField.text!) ?? 0
        blueSlider.value = Float(blueTextField.text!) ?? 0
        updateHexColor()
        
    }
    
    
    func updateHexColor()  {
        let red = Int(redTextField.text!)
        let redStr = String(format: "%02X", red!)
        
        let green = Int(greenTextField.text!)
        let greenStr = String(format: "%02X", green!)
        
        let blue = Int(blueTextField.text!)
        let blueStr = String(format: "%02X", blue!)
        let alpah = "FF"
        colorTextField.text = redStr+greenStr+blueStr+alpah
        print("#"+colorTextField.text!)
        ColorImage.backgroundColor = UIColor(hex: "#"+colorTextField.text!)
        
    }
   
    
}

// MARK: -  UITextFieldDelegate
extension ViewController: UITextFieldDelegate{
     
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: textField.text!)){
                return true
            }else{
                textField.text =  ""
                textField.placeholder = "only numbers!"
                return false
            }
        }else{
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let number = textField.text{
            updateHexColor()
           print(number)
        }
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
