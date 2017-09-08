//
//  SRTableViewCell.swift
//  Reactor
//
//  Created by Kalyan Dechiraju on 04/09/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit

class SRTableViewCell: UITableViewCell {
    
    static let Identifier = "SRCell"

    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(result: SurveyResult) {
        nickNameLabel.text = result.username
        resultLabel.text = "1.\(result.answerOne) 2.\(result.answerTwo) 3.\(result.answerThree)"
    }

}
