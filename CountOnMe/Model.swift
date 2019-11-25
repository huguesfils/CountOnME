//
//  Model.swift
//  CountOnMe
//
//  Created by Hugues Fils Caparos on 14/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

extension Float
{
    var cleanValue: String
    {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class Calculation {
    // Error check computed variables
        var expressionIsCorrect: Bool {
            return elements.last != "+" && elements.last != "-"
        }
        
        var expressionHaveEnoughElement: Bool {
            print(elements.count)
            return elements.count >= 3
        }
        
        var canAddOperator: Bool {
            return elements.last != "+" && elements.last != "-"
        }

    var elements: [String] = []
    var expressionHaveResult: Bool = false
    
    func math () -> String{
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!
            
            let result: Float
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right
            case "x":result = left * right
            default: fatalError("Unknown operator !")
            }
                        
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result.cleanValue)", at: 0)
        }
        return operationsToReduce.first!
    }
  
}


  
   
