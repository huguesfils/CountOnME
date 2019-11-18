//
//  Model.swift
//  CountOnMe
//
//  Created by Hugues Fils Caparos on 14/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculation {
    
    var total = 0
    var elements: [String] = []
    
    func math (keyboard: [String]) -> String{
        // Create local copy of operations
        var operationsToReduce = keyboard
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right
            case "*":result = left * right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce.first!
    }
    
}
