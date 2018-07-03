//
//  ViewController.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit
import Suift

class CustomView: UIView {
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        render()
    }
}

extension ViewController: Buildable {
    func build() -> Viewable {
        return View<CustomView>(
            style: ViewStyle {
                $0.backgroundColor = Color.RGB(red: 255 / 255, green: 100 / 255, blue: 80 / 255)
            },
            constraint: LayoutMaker {
                return [
                    Layout { $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) },
                    Layout { $0.centerYAnchor.constraint(equalTo: self.view.centerYAnchor) },
                    Layout { $0.widthAnchor.constraint(equalToConstant: 100) },
                    Layout { $0.heightAnchor.constraint(equalToConstant: 100) },
                    ]
            }
        )
    }
}
