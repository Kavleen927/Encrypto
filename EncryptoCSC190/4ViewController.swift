//
//  4ViewController.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//

//RSA 1
import UIKit
class ViewController4: UIViewController{

    @IBOutlet weak var PrivKeyLBL: UILabel!
    @IBOutlet weak var PubKeyLBL: UILabel!
    
    var BRAIN : ENCRYPTOBRAIN = ENCRYPTOBRAIN()
    var BOARD : Pasteboard = Pasteboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PrivKeyLBL.isHidden = true
        PubKeyLBL.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    var Pub = ""
    var Priv = ""
    
    @IBAction func Generate(_ sender: UIButton) {
        let TUPLE = BRAIN.RSAKeys()
        let PubKey = TUPLE.0 //(e,n)
        let PrivKey = TUPLE.1 //(d,n)
        
        Pub = "(" + String(PubKey.0) + "," + String(PubKey.1) + ")"
        
        Priv = "(" + String(PrivKey.0) + "," + String(PrivKey.1) + ")"
        
        PubKeyLBL.text = "Public Key (e,n): " + Pub
        PrivKeyLBL.text = "Private Key (d,n): " + Priv
        PrivKeyLBL.isHidden = false
        PubKeyLBL.isHidden = false
        
    }
    
    @IBAction func CopyPubKey(_ sender: UIButton) {
        BOARD.CLEAR()
        BOARD.COPY(Pub)
        
    }
    
    @IBAction func CopyPrivKey(_ sender: UIButton) {
        BOARD.CLEAR()
        BOARD.COPY(Priv)
    }
}
