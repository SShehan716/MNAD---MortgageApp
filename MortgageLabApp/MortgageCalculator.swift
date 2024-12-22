//
//  MortgageCalculator.swift
//  MortgageLabApp
//
//  Created by Sachin shehan on 2024-11-26.
//

import Foundation

class MortgageCalculator {

    func calculateMortgage(monthlyPayement: Double, loanDuration: Int, intrestRate:Double) -> Double? { //note this will be moved to a separate class and recoded t
        //note use pow(a,b)
        //convert var to doubles for the calculation
        guard loanDuration > 0, intrestRate > 0 else {
            return nil
        }
        
        let r = intrestRate/100
        let a = (r/12)+1
        let p = monthlyPayement * (pow(a,Double(loanDuration*12)) - 1)*(pow(a,-1*Double(loanDuration*12))/(r/12))
        
        return p
    }
}
