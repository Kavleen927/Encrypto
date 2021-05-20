//
//  5ViewController.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//

import Foundation
import UIKit

class ViewController5: UIViewController{
    
    @IBOutlet weak var MessageLBL: UITextField!
    @IBOutlet weak var PubKeyLBL: UITextField!
    @IBOutlet weak var CipherTextLBL: UILabel!
    
    var BRAIN : ENCRYPTOBRAIN = ENCRYPTOBRAIN()
    var BOARD : Pasteboard = Pasteboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CipherTextLBL.isHidden = true
        MessageLBL.delegate = self
        PubKeyLBL.delegate = self
        CipherTextLBL.text = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PubKeyLBL.resignFirstResponder()
    }
    
    var e = ""
    var n = ""
    var Message = ""
    var E = 0
    var N = 0
    
    @IBAction func EncryptBTN(_ sender: UIButton) {
        Message = MessageLBL.text!
        let PublicKey = PubKeyLBL.text
        let array = PublicKey?.components(separatedBy: ",")
        e = String((array?[0])!)
        E = Int(String(e.dropFirst()))!
        n = String((array?[1])!)
        N = Int(String(n.dropLast()))!
        
        let CIPHER = BRAIN.RSAEncode(Message, E, N)
        let stringRep = CIPHER.description
        
        CipherTextLBL.text = stringRep
        CipherTextLBL.isHidden = false

    }
    
    @IBAction func CopyCipher(_ sender: UIButton) {
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
extension ViewController5: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
