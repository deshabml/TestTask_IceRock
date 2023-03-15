//
//  UIView+AddSudviews.swift
//  TestTaskIceRock
//
//  Created by Лаборатория on 15.03.2023.
//

import UIKit

extension UIView {

    func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }

}
