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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Variable
        tableView.delegate = self
        tableView.dataSource = self
        
        // Quick fix to remove extra seperator lines in tableview
        self.tableView.tableFooterView = UIView()
        
        //        Observable.just([10,30,40, 50, 60, 60]).bindTo(tableView.rx.items(cellIdentifier: SRTableViewCell.Identifier, cellType: SRTableViewCell.self)) { row, intr, cell in
        //
        //        }.disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SRTableViewCell.Identifier, for: indexPath) as! SRTableViewCell
        cell.configureCell(result: SurveyResult(nickname: "Kalyan", optionOne: 1, optionTwo: 2, optionThree: 3))
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


}

