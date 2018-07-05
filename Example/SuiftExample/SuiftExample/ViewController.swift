//
//  ViewController.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit
import Suift

class ViewController: UIViewController {
    fileprivate let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
        
        label.text = "Yeaaaaa"
    }
}

extension ViewController: Buildable {
    func build() -> Viewable {
        return Button(
                style: ButtonStyle {
                    $0.viewStyle = ViewStyle {
                        $0.backgroundColor = UIColor.red
                    }
                },
                constraint: LayoutMaker { (view, superview, views) in
                    return [
                        view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) ,
                        view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) ,
                        view.widthAnchor.constraint(equalToConstant: 200),
                        view.heightAnchor.constraint(equalToConstant: 50),
                        ]
                },
                event: ButtonEvent(
                    events: .touchUpInside,
                    closure: { [weak self] (button) in
                        self?.navigationController?.pushViewController(SecondViewController(), animated: true)
                    }
                ),
                children: [
                    Label(
                        label: label,
                        style: LabelStyle { $0.viewStyle = ViewStyle { $0.backgroundColor = Color.RGBA(red: 1, green: 1, blue: 1, alpha: 1)} },
                        constraint: LayoutMaker { (view, superview, subviews) in
                            return [
                                view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                                view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
                                ]
                        }
                    )
            ]
        )
    }
}
