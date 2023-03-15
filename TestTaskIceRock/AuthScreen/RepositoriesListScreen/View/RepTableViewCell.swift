//
//  RepTableViewCell.swift
//  TestTaskIceRock
//
//  Created by Лаборатория on 15.03.2023.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    static let id = "PhotosTableViewCell"

    private lazy var labelNameRep: UILabel = {
        let labelNameRep = UILabel()
        labelNameRep.textColor = .white
        return labelNameRep
    }()

    private lazy var labelProgramLanguage: UILabel = {
        let labelProgramLanguage = UILabel()
        labelProgramLanguage.textColor = .white
        return labelProgramLanguage
    }()

    private lazy var labelProjectDescription: UILabel = {
        let labelProjectDescription = UILabel()
        labelProjectDescription.textColor = .white
        labelProjectDescription.numberOfLines = 0
        return labelProjectDescription
    }()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .black
        addSubviews([
            labelNameRep,
            labelProgramLanguage,
            labelProjectDescription
        ])
        installingСonstraints()

    }

}

extension RepTableViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            labelNameRep.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            labelNameRep.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelProjectDescription.topAnchor.constraint(equalTo: labelNameRep.bottomAnchor, constant: 10),
            labelProjectDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelProjectDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            labelProgramLanguage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            labelProgramLanguage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }

    func setupCell(nameRep: String, programLanguage: String, projectDescription: String) {
        labelNameRep.text = nameRep
        labelProgramLanguage.text = programLanguage
        labelProjectDescription.text = projectDescription
    }

}
