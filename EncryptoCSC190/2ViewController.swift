//
//  2ViewController.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//


import UIKit
class ViewController2: UIViewController {

    @IBOutlet weak var PLAINTEXT: UITextField!
    @IBOutlet weak var KEY: UITextField!
    @IBOutlet weak var CipherTextLBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        CipherTextLBL.isHidden = true
        PLAINTEXT.delegate = self
        KEY.delegate = self
        CipherTextLBL.text = nil
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        KEY.resignFirstResponder()
    }
    
    var BRAIN : ENCRYPTOBRAIN = ENCRYPTOBRAIN()
    var BOARD : Pasteboard = Pasteboard()
    

    @IBAction func ENCRYPTbtn(_ sender: UIButton) {
        
        guard let plaintext = PLAINTEXT.text, BRAIN.isNameValid(plaintext) else{
            let myAlert = UIAlertController(title: "Invalid Plaintext", message: "Please enter a valid plaintext", preferredStyle: UIAlertController.Style.alert)
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
        
        let CipherText = BRAIN.CaesarEncrypt(plaintext, key)
        CipherTextLBL.text = CipherText
        CipherTextLBL.isHidden = false
    }
    
    @IBAction func CopyText(_ sender: UIButton) {
        BOARD.CLEAR()
        guard CipherTextLBL.text != nil else{
            let myAlert = UIAlertController(title: "Invalid", message: "There is nothing to copy", preferredStyle: UIAlertController.Style.alert)
            myAlert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(myAlert, animated:true, completion: nil)
                return
        }
        BOARD.COPY(CipherTextLBL.text!)
    }
    

}

extension ViewController2: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
