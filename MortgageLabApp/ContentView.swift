//
//  ContentView.swift
//  MortgageLabApp
//
//  Created by Sachin Shehan on 2024-11-26.
//

import SwiftUI
struct ContentView: View {
    //declare vars
    @AppStorage("monthlyPayement") private var monthlyPayement = "300000"
    @AppStorage("loanDuration") private var loanDuration = "25"
    @AppStorage("intrestRate") private var intrestRate = "4"
    @AppStorage("borrowedAmount") private var borrowedAmount = ""
    
    private var mortgageCalculatorClass = MortgageCalculator()

    
    var body: some View {
        VStack {
            //Text(...)
            Text("Mortage Calculator")
                .bold()
                .font(.title)
            //Image(...)
            //Label(...)
            Label("Monthly Payment", systemImage: "sterlingsign.circle.fill")
            //Textfield(...)
            TextField("Monthly Payement", text: $monthlyPayement)
                .multilineTextAlignment(.center)
//                .onChange(of: monthlyPayement){ newValue in
//                    monthlyPayement = newValue
//                }
            //.onChange(of: ...) {newValue in ...}
            
            Label("Loan Period Years", systemImage: "clock.badge.questionmark")
            TextField("Loan Duration", text: $loanDuration)
                .multilineTextAlignment(.center)
            
            Label("Intrest Rate", systemImage: "percent")
            TextField("Intrest Rate", text: $intrestRate)
                .multilineTextAlignment(.center)
            //times 3 - one for each entry
            //Button(...)
            Button("Calculate"){
                mortgageCalculator()
            }
            //Text()
            if borrowedAmount != "" {
                Text("Amount that can be borrowed: $ \(borrowedAmount)")

            }
        }
        .padding()
    }
    
    func mortgageCalculator() {
        // Validate and parse input values
        guard let mp = Double(monthlyPayement),
              let duration = Int(loanDuration),
              let rate = Double(intrestRate) else {
            borrowedAmount = "Invalid Input"
            return
        }
        
        // Call the mortgage calculation method from the MortgageCalculator class
        if let result = mortgageCalculatorClass.calculateMortgage(monthlyPayement: mp, loanDuration: duration, intrestRate: rate) {
            borrowedAmount = String(format: "%.2f", result)
        } else {
            borrowedAmount = "Invalid Calculation"
        }
    }

    
    
    
//    func mortgageCalculator(){ //note this will be moved to a separate class and recoded t
//        //note use pow(a,b)
//        //convert var to doubles for the calculation
//        guard let mp = Double(monthlyPayement),
//              let duration = Int(loanDuration),
//              let rate = Double(intrestRate) else {
//            borrowedAmount = "Invalid Input"
//            return
//        }
//        
//        let r = rate/100
//        let a = (r/12)+1
//        let p = mp * (pow(a,Double(duration*12)) - 1)*(pow(a,-1*Double(duration*12))/(r/12))
//        
//        borrowedAmount = String(format: "%.2f", p)
//    }
                  
                  
                  
    //takes a string and returns a string
    func checkText(text:String)->String{
        var updatedString = text
        var dotCount = 0
        for d in text {
            if String(d) == "."
            { dotCount += 1 }
        }
        if dotCount >= 2 {
            // remove the last typed point
            updatedString = String(text.dropLast())
        }
        return updatedString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
