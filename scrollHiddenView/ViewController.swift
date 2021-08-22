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
    
    var bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moveView.frame = CGRect(x: view.frame.minX + 10, y: view.frame.maxY - (view.frame.maxY / 7), width: view.frame.size.width - 20, height: view.frame.size.height / 15)
        
        moveView.layer.cornerRadius = 30.0
        moveView.backgroundColor = .systemGreen
        
        moveView.layer.shadowOffset = CGSize(width: 5, height: 5)
        moveView.layer.shadowOpacity = 1
        moveView.layer.shadowRadius = 0
        
        view.addSubview(moveView)
        
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
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        if moveView.frame.origin.y == view.frame.maxY - (view.frame.maxY / 7){

            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.y =  self.view.frame.maxY - self.moveView.frame.height}, completion: nil)

        }

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        var judgeCGFloat = tableView.contentOffset.y

        if judgeCGFloat > 0{

            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.y =  self.view.frame.maxY}, completion: nil)

            judgeCGFloat = 0

        }else if judgeCGFloat < 0{

            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.y =  self.view.frame.maxY - (self.view.frame.maxY / 7)}, completion: nil)

            judgeCGFloat = 0

        }

    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if moveView.frame.origin.y == self.view.frame.maxY - self.moveView.frame.height{

            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.y =  self.view.frame.maxY}, completion: nil)

        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        if moveView.frame.origin.y == self.view.frame.maxY{

            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.y =  self.view.frame.maxY - (self.view.frame.maxY / 7)}, completion: nil)

        }

    }
   
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.y =  self.view.frame.maxY - (self.view.frame.maxY / 7)}, completion: nil)

        
    }
    
    //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print(tableView.contentOffset)
//        if moveView.frame.origin.x == self.view.frame.minX - self.view.frame.size.width{
//
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.x =  self.view.frame.minX + 10; self.moveView.frame.origin.y = self.moveView.frame.origin.y + self.tableView.contentOffset.y}, completion: nil)
//
//    }

        
    //}
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//        if moveView.frame.origin.x == self.view.frame.minX - self.view.frame.size.width{
//
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.x =  self.view.frame.minX + 10}, completion: nil)
//
//        }
//
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        if moveView.frame.origin.x == view.frame.minX + 10{
//
//            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {self.moveView.frame.origin.x =  self.view.frame.minX - self.view.frame.size.width}, completion: nil)
//
//        }
//
//    }
    
    
    
}
