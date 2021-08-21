//
//  ViewController.swift
//  scrollHiddenView
//
//  Created by UrataHiroki on 2021/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var moveView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moveView.frame = CGRect(x: view.frame.minX + 10, y: view.frame.maxY - (view.frame.maxY / 5), width: view.frame.size.width - 20, height: view.frame.size.height / 15)
        
        moveView.layer.cornerRadius = 30.0
        moveView.backgroundColor = .tertiarySystemGroupedBackground
        
        moveView.layer.shadowOffset = CGSize(width: 10, height: 10)
        moveView.layer.shadowOpacity = 0.5
        moveView.layer.shadowRadius = 7
        
        tableView.addSubview(moveView)
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
        
    }
    
    
    
    
    
}
