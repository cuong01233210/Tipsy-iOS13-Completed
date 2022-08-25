
import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var personMoney : String?
    var countSplit = 2
    var tipNumber = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = personMoney
        settingsLabel.text = "Split between \(countSplit) people, with \(tipNumber) % tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
