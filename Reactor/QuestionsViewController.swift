//
//  QuestionsViewController.swift
//  Reactor
//
//  Created by Kalyan Dechiraju on 08/09/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit
import FirebaseDatabase
import RxSwift
import RxCocoa

class QuestionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var questions = Variable([Question]())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Quick fix to remove extra seperator lines in tableview
        self.tableView.tableFooterView = UIView()

        loadDataFromFirebase()
        
        setupTableView()
    }
    
    func setupTableView() {
        questions.asObservable().bindTo(tableView.rx.items(cellIdentifier: QuestionCell.Identifier, cellType: QuestionCell.self)) { row, question, cell in
            cell.configureCell(question: question)
            }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
            self.performSegue(withIdentifier: "ChartsSegue", sender: indexPath[1])
        }).disposed(by: disposeBag)
    }

    func loadDataFromFirebase() {
        let ref = FIRDatabase.database().reference()
        ref.child("questions").observe(FIRDataEventType.value, with: { (snapshot) in
            var fbData = [Question]()
            for children in snapshot.children {
                let snapshotData = children as! FIRDataSnapshot
                let data = snapshotData.value as? [String : AnyObject] ?? [:]
                let result = Question(description: data["question"] as! String)
                fbData.append(result)
            }
            self.questions.value = fbData
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChartsSegue" {
            if let destination = segue.destination as? ChartsViewController {
                if let data = sender as? Int {
                    print("performing segue: \(data)")
                    destination.questionNumber = data
                }
            }
        }
    }

}
