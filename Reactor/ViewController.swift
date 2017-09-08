//
//  ViewController.swift
//  Reactor
//
//  Created by Kalyan Dechiraju on 02/09/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countButton: UIBarButtonItem!
    
    
    let disposeBag = DisposeBag()
    var submissions = [SurveyResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //Variable
        tableView.delegate = self
        tableView.dataSource = self
        
        // Quick fix to remove extra seperator lines in tableview
        self.tableView.tableFooterView = UIView()
        
        loadDataFromFirebase()
    }
    
    func loadDataFromFirebase() {
        let ref = FIRDatabase.database().reference()
        ref.child("submissions").observe(FIRDataEventType.value, with: { (snapshot) in
            self.submissions.removeAll()
            for children in snapshot.children {
                let snapshotData = children as! FIRDataSnapshot
                let data = snapshotData.value as? [String : AnyObject] ?? [:]
                let result = SurveyResult(username: data["username"] as! String, answerOne: data["answerOne"] as! String, answerTwo: data["answerTwo"] as! String, answerThree: data["answerThree"] as! String)
                self.submissions.append(result)
            }
            self.tableView.reloadData()
            self.countButton.title = "\(self.submissions.count)"
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SRTableViewCell.Identifier, for: indexPath) as! SRTableViewCell
        cell.configureCell(result: self.submissions[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.submissions.count
    }
}

