import UIKit

class SampleTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        view.addSubview(ImageView)
        createButtona()
        createButtonb()
        createButtonc()
        createButtond()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ImageView.frame = view.bounds
    }
    
    
    private let ImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "Sampletask")
            return imageView
    }()
    
    
    func createButtona(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:190, y:600, width: 50, height: 40)
        button1.backgroundColor = .systemTeal
        button1.setTitleColor(.black, for: .normal)
        button1.setTitle( "A", for: .normal)
        button1.setTitle( "Awesome!", for: .selected)
        
        
        self.view.addSubview(button1)
    }
    
    func createButtonb(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:130, y:600, width: 50, height: 40)
        button1.backgroundColor = .systemTeal
        button1.setTitleColor(.black, for: .normal)
        button1.setTitle( "B", for: .normal)
        button1.setTitle( "Wrong answer", for: .selected)
        
        
        self.view.addSubview(button1)
    }
    
    func createButtonc(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:70, y:600, width: 50, height: 40)
        button1.backgroundColor = .systemTeal
        button1.setTitleColor(.black, for: .normal)
        button1.setTitle( "C", for: .normal)
    
        button1.setTitle( "Wrong answer", for: .selected)
        
        
        
        self.view.addSubview(button1)
    }
    
    func createButtond(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:10, y:600, width: 50, height: 40)
        button1.backgroundColor = .systemTeal
        button1.setTitleColor(.black, for: .normal)
        button1.setTitle( "D", for: .normal)
        button1.setTitle( "Wrong answer", for: .focused)
        
        
        self.view.addSubview(button1)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
