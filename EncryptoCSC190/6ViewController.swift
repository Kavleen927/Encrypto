//
//  6ViewController.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//


import Foundation
import UIKit

class ViewController6: UIViewController{
    var BOARD : Pasteboard = Pasteboard()
    
    @IBOutlet weak var CipherTextLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CipherTextLBL.text = "[928, 2227, 1395, 758, 660, 1684, 2227, 928, 2227, 1952, 131, 2227, 1528, 131, 2504, 2227, 193, 660, 1239, 758, 2227, 170, 1769, 2576, 193, 2227, 2504, 1020, 170, 758, 1315, 1315, 1315, 1315, 1315, 1315, 1315, 1315, 762, 660, 1528, 196, 2227, 758, 169, 1239, 758, 1751, 2227, 1952, 1020, 758, 1952, 2227, 2504, 131, 2227, 1860, 1684, 1020, 1528, 850, 2227, 1769, 1751, 2227, 2504, 193, 1020, 1751, 2227, 1020, 1528, 1395, 131, 1684, 170, 660, 2504, 1020, 131, 1528, 1315, 1315, 1315, 1315, 1315, 1315, 2063, 193, 758, 196, 2227, 660, 1684, 758, 2227, 2576, 131, 170, 1020, 1528, 850, 1315, 1315, 1315, 1315, 1315, 1315, 652, 758, 2227, 660, 1684, 758, 2227, 1020, 1528, 2227, 850, 1684, 660, 1239, 758, 2227, 1952, 660, 1528, 850, 758, 1684, 1315, 2227, 2063, 193, 758, 196, 2227, 2243, 1020, 1751, 193, 2227, 2504, 131, 2227, 660, 1528, 1528, 1020, 193, 1020, 169, 660, 2504, 758, 2227, 1769, 1751, 1315, 1315, 1315, 1315, 1315, 2227, 2504, 660, 2287, 758, 2227, 131, 1769, 1684, 2227, 1751, 1084, 1020, 1684, 1020, 2504, 1315, 2227, 441, 1769, 1684, 2227, 1315, 1315, 1315, 1315, 2227, 193, 660, 1751, 2227, 660, 169, 1684, 758, 660, 1952, 196, 2227, 1952, 2243, 1020, 1528, 1952, 169, 758, 1952, 1315, 1315, 1315, 1315, 1315, 2453, 131, 1769, 2227, 170, 1769, 1751, 2504, 2227, 1684, 758, 169, 131, 2576, 660, 2504, 758, 2207, 2227, 1315, 1315, 1315, 2227, 1751, 758, 2504, 2227, 660, 1751, 1020, 1952, 758, 2227, 196, 131, 1769, 1684, 2227, 1952, 1020, 1395, 1395, 758, 1684, 758, 1528, 2576, 758, 1751, 2227, 2243, 1020, 2504, 193, 2227, 2504, 193, 758, 2227, 1471, 131, 1769, 2504, 193, 2227, 1523, 131, 169, 758, 1315, 1315, 1315]"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func CopyCipher(_ sender: UIButton) {
        BOARD.CLEAR()
        BOARD.COPY(CipherTextLBL.text!)
    }
    
}
