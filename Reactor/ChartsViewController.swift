//
//  ChartsViewController.swift
//  Reactor
//
//  Created by Kalyan Dechiraju on 08/09/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Charts
import RxSwift
import RxCocoa

class ChartsViewController: UIViewController {
    
    
    @IBOutlet weak var answerOneChart: PieChartView!
    
    var questionNumber: Int?
    
    var submissions = Variable(SurveyResult(username: "", answerOne: "", answerTwo: "", answerThree: ""))
    
    var options = [String: Int]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromFirebase()

        submissions.asObservable()
            .filter({ (result) -> Bool in
                return !result.username.isEmpty
            })
            .subscribe(onNext: { (result) in
                self.parseData(result: result)
                self.loadChart()
            })
            .disposed(by: disposeBag)
        
    }
    
    
    func loadDataFromFirebase() {
        let ref = FIRDatabase.database().reference()
        ref.child("submissions").observe(FIRDataEventType.value, with: { (snapshot) in
            for children in snapshot.children {
                let snapshotData = children as! FIRDataSnapshot
                let data = snapshotData.value as? [String : AnyObject] ?? [:]
                let result = SurveyResult(username: data["username"] as! String, answerOne: data["answerOne"] as! String, answerTwo: data["answerTwo"] as! String, answerThree: data["answerThree"] as! String)
                
                self.submissions.value = result
            }
        })
    }
    
    func loadChart() {
        var dataEntries: [PieChartDataEntry] = []
        for (key, value) in options {
            dataEntries.append(PieChartDataEntry(value: Double(value), label: key))
        }
        let dataSet = PieChartDataSet(values: dataEntries, label: "Question")
        dataSet.colors = [UIColor.red, UIColor.gray, UIColor.blue]
        
        self.answerOneChart.data = PieChartData(dataSet: dataSet)
    }
    
    func parseData(result: SurveyResult) {
        if (self.questionNumber! == 0) {
            self.options[result.answerOne] = self.options[result.answerOne] == nil ? 1 : self.options[result.answerOne]! + 1
        } else if (self.questionNumber! == 1) {
            self.options[result.answerTwo] = self.options[result.answerTwo] == nil ? 1 : self.options[result.answerTwo]! + 1
        } else if (self.questionNumber! == 2) {
            self.options[result.answerThree] = self.options[result.answerThree] == nil ? 1 : self.options[result.answerThree]! + 1
        }
    }
}
