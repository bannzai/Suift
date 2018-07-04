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
    fileprivate var customView = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()

        render()
        
        customView.backgroundColor = .black
    }
}

extension ViewController: Buildable {
    func build() -> Viewable {
        return View<CustomView>(
            view: customView,
            style: ViewStyle {
                $0.backgroundColor = Color.RGB(red: 200 / 255, green: 100 / 255, blue: 80 / 255)
            },
            constraint: LayoutMaker { view, superview, views in
                return [
                    Layout { view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) },
                    Layout { view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) },
                    Layout { view.widthAnchor.constraint(equalToConstant: 100) },
                    Layout { view.heightAnchor.constraint(equalToConstant: 100) },
                    ]
            },
            children: [
                View<UILabel>(
                    style: ViewStyle {
                        $0.backgroundColor = UIColor.blue
                    },
                    constraint: LayoutMaker { view, superview, views in
                        return [
                            Layout { view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) },
                            Layout { view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) },
                            Layout { view.widthAnchor.constraint(equalToConstant: 50) },
                            Layout { view.heightAnchor.constraint(equalToConstant: 50) },
                        ]
                    },
                    children: [
                        View<UIView>(
                            style: ViewStyle {
                                $0.backgroundColor = Color.RGBA(red: 255 / 255, green: 20 / 255, blue: 155 / 255, alpha: 1)
                            },
                            constraint: LayoutMaker { view, superview, views in
                                return [
                                    Layout { view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) },
                                    Layout { view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) },
                                    Layout { view.widthAnchor.constraint(equalToConstant: 20) },
                                    Layout { view.heightAnchor.constraint(equalToConstant: 20) },
                                    ]
                            }
                        ),
                        View<UIView>(
                            style: ViewStyle {
                                $0.backgroundColor = Color.RGBA(red: 0.2, green: 0.8, blue: 0, alpha: 0.8)
                            },
                            constraint: LayoutMaker { view, superview, views in
                                return [
                                    Layout { view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) },
                                    Layout { view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) },
                                    Layout { view.widthAnchor.constraint(equalToConstant: 10) },
                                    Layout { view.heightAnchor.constraint(equalToConstant: 200) },
                                    ]
                            }
                        )
                    ]
                )
            ]
        )
    }
}
