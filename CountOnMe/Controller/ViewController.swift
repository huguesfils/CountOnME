//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Properties
    var calculation = Calculation()

    // MARK: - Actions
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           textView.text.removeAll()
       }

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculation.updateExpression(number: textView.text)
        if calculation.expressionHaveResult {
            textView.text = ""
        }
        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculation.canAddOperator {
            textView.text.append(" + ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!",
                message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculation.canAddOperator {
            textView.text.append(" - ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!",
                message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedMultButton(_ sender: UIButton) {
        if calculation.canAddOperator {
            textView.text.append(" x ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!",
                message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedDivButton(_ sender: UIButton) {
        if calculation.canAddOperator {
            textView.text.append(" / ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!",
                message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func reset (_ sender: UIButton) {
        textView.text.removeAll()
        calculation.reset()
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculation.addExpression(expr: textView.text)

        guard calculation.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", // modif titre
                message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        guard calculation.expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!",
                message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        guard !calculation.divideZero else {
            let alertVC = UIAlertController(title: "Zéro!",
                message: "Division par zéro impossible", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        textView.text.append(" = \(calculation.math())")
    }
}
