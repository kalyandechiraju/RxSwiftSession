//
//  QuestionCell.swift
//  Reactor
//
//  Created by Kalyan Dechiraju on 09/09/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    static let Identifier = "QuestionCell"
    
    @IBOutlet weak var questionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }

    func configureCell(question: Question) {
        self.questionLabel.text = question.description
    }
}
