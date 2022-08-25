
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip  = 0.0
    var splitNumber:Int = 2
    var moneySplit : Float = 0.0
    var billTotal = 0.0
    var finalResult = "0.0"
    override func viewDidLoad() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    @IBAction func stepper(_ sender: UIStepper) {
        splitNumber  = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
   
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if sender.titleLabel?.text == "0%"
        {
            zeroPctButton.isSelected = true
            tip = Double(0.0)
        }
        if sender.titleLabel?.text == "10%"
        {
            tenPctButton.isSelected = true
            tip = Double(0.1)
        }
        if sender.titleLabel?.text == "20%"
        {
            twentyPctButton.isSelected = true
            tip = Double(0.2)
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    }
    //let numberFormatter = NSNumberFormatter()
    //let number = numberFormatter.numberFromString("15.5")
    //let numberFloatValue = number.floatValue

    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(splitNumber)
            finalResult = String(format: "%.2f", result)
           // print(finalResult)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.personMoney = finalResult
            destinationVC.countSplit = splitNumber
            if tip == 0
            {
                destinationVC.tipNumber = 0
            }
            if tip == 0.1
            {
                destinationVC.tipNumber = 10
            }
            if tip == 0.2
            {
                destinationVC.tipNumber = 20
            }
        }
    }
    
}

