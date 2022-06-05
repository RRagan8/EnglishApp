import UIKit

class ExercisesViewController: UIViewController {

    private let ExercisesFeedTable: UITableView = {
        let table = UITableView(frame:.zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    } ()
    
    private let exercises: [Exercise] = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let exercisesFromDB = appDelegate.exercises
        return exercisesFromDB
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray5
        view.addSubview(ExercisesFeedTable)
        
        ExercisesFeedTable.delegate = self
        ExercisesFeedTable.dataSource = self
        
        let headerView = HeaderExUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        ExercisesFeedTable.tableHeaderView = headerView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ExercisesFeedTable.frame = view.bounds
    }
    
    @objc func pressSampEx() {
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: SampleTaskViewController())
        self.present(ac, animated: true, completion: nil)
    }
    

}

extension ExercisesViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection indexPath: IndexPath) -> CGFloat {
        return 40
    }

    
}
