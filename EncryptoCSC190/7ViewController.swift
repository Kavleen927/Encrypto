//
//  7ViewController.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//

import Foundation
import UIKit

class ViewController7: UIViewController{
    
    @IBOutlet weak var PrivKeyLBL: UITextField!
    @IBOutlet weak var CipherTextLBL: UITextField!
    @IBOutlet weak var PlainTextLBL: UILabel!
    
    
    var BRAIN : ENCRYPTOBRAIN = ENCRYPTOBRAIN()
    var BOARD : Pasteboard = Pasteboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlainTextLBL.isHidden = true
        CipherTextLBL.delegate = self
        PrivKeyLBL.delegate = self
        CipherTextLBL.text = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PrivKeyLBL.resignFirstResponder()
    }
    
    var ciphertext = ""
    var d = ""
    var n = ""
    var D = 0
    var N = 0
    
    
    
    @IBAction func DecryptBTN(_ sender: UIButton) {
        let ciphertextString = CipherTextLBL.text!
        let cipher = [Int](jsonString: ciphertextString)
        let PrivateKey = PrivKeyLBL.text
        let array = PrivateKey?.components(separatedBy: ",")
        d = String((array?[0])!)
        D = Int(String(d.dropFirst()))!
        n = String((array?[1])!)
        N = Int(String(n.dropLast()))!
        
        let MESSAGE = BRAIN.RSADecode(cipher!, D, N)
        
        PlainTextLBL.text = MESSAGE
        PlainTextLBL.isHidden = false
        
    }
    
    
    @IBAction func CopyMessage(_ sender: UIButton) {
        BOARD.CLEAR()
        guard PlainTextLBL.text != nil else{
            let myAlert = UIAlertController(title: "Invalid", message: "There is nothing to copy", preferredStyle: UIAlertController.Style.alert)
            myAlert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(myAlert, animated:true, completion: nil)
                return
        }
        BOARD.COPY(PlainTextLBL.text!)
        
    }
    
}
extension ViewController7: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
   }
}
extension Array{
    init?(jsonString: String){
        guard let array = (
                try? JSONSerialization.jsonObject(with: Data(jsonString.utf8))) as? [Element] else {return nil}
        self.init(array)
    }
    
}
