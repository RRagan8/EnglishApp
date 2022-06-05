import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        createButton()
        createNAME()
        createMOTIVATIONTAG()
        createMOTIVATIONPHRASE()
        createINTEREST()
        createTIME()
        createTN()
        createPH()
        
        view.backgroundColor = .systemGray5
        
    }
    
    class TextField: UITextField {
        let inset: CGFloat = 10

        func _textRectForBounds(bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: inset , dy: inset)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: inset , dy: inset)
        }

        override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: inset, dy: inset)
        }
    }
    
    func createButton(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:145, y: 650, width: 100, height: 50)
        button1.backgroundColor = .systemTeal
        button1.setTitle( "Save", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        
        button1.addTarget(self, action: #selector(self.pressEdit) , for: .touchUpInside)
        
        
        self.view.addSubview(button1)
    }
    
    func createNAME(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 100, width: 300.00, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "Your name"
         myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    func createMOTIVATIONTAG(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 160, width: 300.00, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "Your motivation: book, travel, ect"
         myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    func createMOTIVATIONPHRASE(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 220, width: 300.00, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "Your motivational phrase"
         myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    func createINTEREST(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 280, width: 300.00, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "Your interests"
         myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    func createTIME(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 340, width: 300.00, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "When do you want to study?"
        myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    func createTN(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 400, width: 300, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "Do you want to receive Tg nitification?"
        myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    func createPH(){
        let myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 460 , width: 300.00, height: 30.00));
        myTextField.placeholder = "Place holder text"
        myTextField.text = "Do you want to receive phone nitification?"
        myTextField.borderStyle = UITextField.BorderStyle.line
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.blue
        self.view.addSubview(myTextField)
    }
    
    
    @objc func pressEdit() {
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: ProfileViewController())
        self.present(ac, animated: true, completion: nil)

    }
}
