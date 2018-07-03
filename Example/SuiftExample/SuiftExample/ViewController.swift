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
    override func viewDidLoad() {
        super.viewDidLoad()

        render()
    }
}

extension ViewController: Buildable {
    func build() -> Viewable {
        return View<CustomView>(
            style: ViewStyle {
                $0.backgroundColor = Color.RGB(red: 200 / 255, green: 100 / 255, blue: 80 / 255)
            },
            constraint: LayoutMaker {
                return [
                    Layout { $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) },
                    Layout { $0.centerYAnchor.constraint(equalTo: self.view.centerYAnchor) },
                    Layout { $0.widthAnchor.constraint(equalToConstant: 100) },
                    Layout { $0.heightAnchor.constraint(equalToConstant: 100) },
                    ]
            },
            children: [
                View<UILabel>(
                    style: ViewStyle {
                        $0.backgroundColor = UIColor.blue
                    },
                    constraint: LayoutMaker {
                        return [
                            Layout { $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) },
                            Layout { $0.centerYAnchor.constraint(equalTo: self.view.centerYAnchor) },
                            Layout { $0.widthAnchor.constraint(equalToConstant: 50) },
                            Layout { $0.heightAnchor.constraint(equalToConstant: 50) },
                        ]
                    },
                    children: [
                        View<UIView>(
                            style: ViewStyle {
                                $0.backgroundColor = Color.RGBA(red: 255 / 255, green: 20 / 255, blue: 155 / 255, alpha: 1)
                            },
                            constraint: LayoutMaker {
                                return [
                                    Layout { $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) },
                                    Layout { $0.centerYAnchor.constraint(equalTo: self.view.centerYAnchor) },
                                    Layout { $0.widthAnchor.constraint(equalToConstant: 20) },
                                    Layout { $0.heightAnchor.constraint(equalToConstant: 20) },
                                    ]
                            }
                        ),
                        View<UIView>(
                            style: ViewStyle {
                                $0.backgroundColor = Color.RGBA(red: 0.2, green: 0.8, blue: 0, alpha: 0.8)
                            },
                            constraint: LayoutMaker {
                                return [
                                    Layout { $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) },
                                    Layout { $0.centerYAnchor.constraint(equalTo: self.view.centerYAnchor) },
                                    Layout { $0.widthAnchor.constraint(equalToConstant: 10) },
                                    Layout { $0.heightAnchor.constraint(equalToConstant: 200) },
                                    ]
                            }
                        )
                    ]
                )
            ]
        )
    }
}
