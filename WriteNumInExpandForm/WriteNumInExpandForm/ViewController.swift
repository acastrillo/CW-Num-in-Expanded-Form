//
//  ViewController.swift
//  WriteNumInExpandForm
//
//  Created by Alex Castrillo on 10/12/19.
//  Copyright © 2019 Alejo Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(expandedForm(20800))
    }
    
    func expandedForm(_ num: Int) -> String {
        let passedNumberString = String(num)
        var mySeperatedNumberArray = [Int]()
        var howManyplaces = passedNumberString.count-1
        var finalString = ""
        var multiplyer : Double = 0
        var thisNum : Double = 0
        
        // Create the number array so we can multiple it
        for char in passedNumberString {
            if let integer = Int(String(char)) {
                mySeperatedNumberArray.append(integer)
            }
        }
        
        for i in 0...mySeperatedNumberArray.count-1{
            if howManyplaces > 0 {
                if mySeperatedNumberArray[i] > 0 {
                    multiplyer = pow(10.0, Double(howManyplaces))
                    thisNum = Double(mySeperatedNumberArray[i])*multiplyer
                    howManyplaces-=1
                    finalString.append(contentsOf: "\(Int(thisNum))")
                    finalString.append(" + ")
                }else{
                    howManyplaces-=1
                }
            }else{
                if mySeperatedNumberArray[i] > 0 {
                    finalString.append(contentsOf: "\(Int(mySeperatedNumberArray[i]))")
                }else{
                    if let i = finalString.lastIndex(of: "+"){
                        finalString.remove(at: i)
                    }
                    let trimmed = finalString.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    finalString = trimmed
                }
            }
        }
        return String(finalString)
    }
}




/* Here's the best version of the above that I found in the solutions of the coding challenege:
 
 Coding challenege: https://www.codewars.com/kata/write-number-in-expanded-form
 
 The best solution:
 func expandedForm(_ num: Int) -> String {
     let digits = String(num).characters
     let maxZeros = digits.count - 1
     
     let parts = digits
         .enumerated()
         .filter { $0.element != "0" }
         .map { String($0.element) + String(repeating: "0", count: maxZeros - $0.offset) }
     
     return parts.joined(separator: " + ")
 }
 
 I feel very stupid, but really good stuff to learn!
 
 */

