//
//  Brain.swift
//  EncryptoCSC190
//
//  Created by Kavleen Kaur on 5/20/21.
//

import UIKit
import Foundation

class Pasteboard{
    let PasteBoard = UIPasteboard.general
    
    func COPY(_ String1 :String){
        PasteBoard.string = String1
    }
    
    func CLEAR(){
        PasteBoard.string = ""
    }
}

class ENCRYPTOBRAIN {
    
    
    func isNameValid(_ PLAINTEXT: String) -> Bool{
        if !(PLAINTEXT.count>0){
            return false
        }
        return true
    }
    func isKeyValid(_ KEY: Int) -> Bool{ //dont need
        if (KEY != 0){
            return true
        }
        /*
        if (KEY > 1 && KEY < 25) {
            return true
        }
        */
        return false
        
    }
    
    func CaesarEncrypt(_ PLAINTEXT : String,_ KEY : Int) -> String{
        func SHIFT(UCS: UnicodeScalar) -> UnicodeScalar{
            let first = Int(UnicodeScalar("A").value)
            let last = Int(UnicodeScalar("Z").value)
            let count = last - first + 1
            
            let value = Int(UCS.value)
            switch value{
            case first...last:
                var offset = value - first
                offset += KEY
                offset = (offset % count + count) % count
                return UnicodeScalar(first+offset)!
            default:
                return UCS
            }
        }
        let Message = PLAINTEXT.uppercased()
        return String(String.UnicodeScalarView(Message.unicodeScalars.map(SHIFT)))
    }
    
    func CaesarDecrypt(_ PLAINTEXT: String, _ KEY: Int) -> String{
        var String1 = String(KEY)
        if String1.contains("-") { //if its already a negative number cpnvert to positive
            String1.remove(at: String1.startIndex)
            let key = Int(String1)
            return CaesarEncrypt(PLAINTEXT, key!)
        }else{
            return CaesarEncrypt(PLAINTEXT, -KEY) //if positive then do negative the key
        }
    }
    
    // RSA __________________________________

    //two very large prime numbers p and q are chosen and kept secret
    // n = p*q
    // d and e are chosen so that --> (e*d) % ((p-1)*(q-1) == 1)
    // Public Key = (n,e) used by everyone to encrypt messages
    // Private Key = d (only you know)
    //To encrpyt a message m, m**e % n where it is m^e
    //To decrypt a cipher c,  c**d % n and will give the original message

    //Generate RSA Keys
    func RSAKeys() -> ((Int,Int),(Int,Int)){
        var generated = false
        //PrimesList = [] and random choose 4 , p,q,e,d
        let PrimesList = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997]
        
        var PrivKey = (1,1)
        var PubKey = (1,1)
        
        let c = PrimesList.count

        while generated == false{
            let e = randomEl(PrimesList,c)
            let d = randomEl(PrimesList,c-1)
            let p = randomEl(PrimesList,c-2)
            let q = randomEl(PrimesList,c-3)
            
            let n = p * q
            if (((e*d) % ((p-1)*(q-1))) != 1){
                generated = false
            }
            else{
                generated = true
                PubKey = (e,n)
                PrivKey = (d,n)
            }
        }
        return (PubKey,PrivKey)
    }
    
    func randomEl(_ A : Array<Int>,_ C: Int) -> Int{
        //c is number of elements
        let i = Int.random(in: 0...C-1)
        return A[i]

    }
    
    func asciivals(_ s : String) -> Array<UInt8>{
        return s.asciiValues
    }
    
    func expmod(_ m: UInt8,_ e: Int,_ n: Int) -> Int{
       var E = e
       // var generated = false
          var ax = 1 //accumulator
          var factor = Int(m) % n //base factor
          while( E>0){
             if (E % 2) == 1{
                ax = (ax*factor) % n
             }
            factor = (factor*factor) % n
            E = Int(floor(Double(E/2)))
        }
        return ax
    }

    func encode(_ m: UInt8,_ e: Int,_ n: Int) -> Int{
       return expmod(m,e,n)
    }

    func encodeArray(_ M: Array<UInt8>,_ e: Int,_ n: Int) -> Array<Int>{
       var C = Array(repeating: 0, count: M.count)
       var i: Int = 0
       while i<M.count{
          C[i] = encode(M[i],e,n)
          i+=1
       }
       return C
    }
    
    func RSAEncode(_ s: String,_ e: Int,_ n: Int) -> Array<Int>{
       let ASC = asciivals(s)
       return encodeArray(ASC,e,n)
    }
    
    func valsascii(_ A: Array<Int>) -> String{ //reverse
       var C = ""
       for int in A{
        C = C + String(Character(UnicodeScalar(int)!))
       }
       return C //String
    }

    func decode(_ c: Int,_ d: Int,_ n: Int) ->Int{
        return expmodD(c,d,n)
    }

    func decodeList(_ C: Array<Int>,_ d: Int,_ n: Int) -> Array<Int>{
       var D = Array(repeating: 0, count: C.count)
       var i: Int = 0
       while i<C.count{
          D[i] = decode(C[i],d,n)
          i+=1
       }
       return D
    }

    func RSADecode(_ C: Array<Int>,_ d: Int,_ n: Int) -> String{
       let DECODED = decodeList(C,d,n)
       return valsascii(DECODED)
    }
    
    func expmodD(_ m: Int,_ e: Int,_ n: Int) -> Int{
       var E = e
       // var generated = false
          var ax = 1 //accumulator
          var factor = Int(m) % n //base factor
          while( E>0){
             if (E % 2) == 1{
                ax = (ax*factor) % n
             }
            factor = (factor*factor) % n
            E = Int(floor(Double(E/2)))
        }
        return ax
    }
}
extension StringProtocol{
    var asciiValues: [UInt8] { compactMap(\.asciiValue) }
} //"abc".asciiValues // [97, 98, 99]
