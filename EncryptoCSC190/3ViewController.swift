//
//  3ViewController.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//

import UIKit
class ViewController3: UIViewController {
    
    @IBOutlet weak var CIPHERTEXT: UITextField!
    @IBOutlet weak var KEY: UITextField!
    @IBOutlet weak var PlaintextLBL: UILabel!
    
    var BRAIN : ENCRYPTOBRAIN = ENCRYPTOBRAIN()
    var BOARD : Pasteboard = Pasteboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlaintextLBL.isHidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        KEY.resignFirstResponder()
    }
    
    @IBAction func DECRYPTbtn(_ sender: UIButton) {
        
        guard let cipher = CIPHERTEXT.text, BRAIN.isNameValid(cipher) else{
            let myAlert = UIAlertController(title: "Invalid cipher text", message: "Please enter a valid cipher text", preferredStyle: UIAlertController.Style.alert)
            myAlert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(myAlert, animated:true, completion: nil)
                return
        }
        guard let key = Int(KEY.text!), BRAIN.isKeyValid(key) else{
            let myAlert = UIAlertController(title: "Invalid Key", message: "Please enter a valid Key", preferredStyle: UIAlertController.Style.alert)
            myAlert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(myAlert, animated:true, completion: nil)
                return
        }
        
        let plaintext = BRAIN.CaesarDecrypt(cipher, key)
        PlaintextLBL.text = plaintext
        PlaintextLBL.isHidden = false
    }
    
    @IBAction func CopyText(_ sender: UIButton) {
        BOARD.CLEAR()
        guard PlaintextLBL.text != nil else{
            let myAlert = UIAlertController(title: "Invalid", message: "There is nothing to copy", preferredStyle: UIAlertController.Style.alert)
            myAlert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(myAlert, animated:true, completion: nil)
                return
        }
        BOARD.COPY(PlaintextLBL.text!)    }
 
}
    

extension ViewController3: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
