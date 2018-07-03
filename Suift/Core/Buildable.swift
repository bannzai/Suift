//
//  Builder.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Buildable {
    func build() -> Viewable
}

extension Buildable where Self: UIViewController {
    public func render() {
        let subview = build().view()
        if view == nil {
            view = subview
            return
        }
        if subview.superview == nil {
            view.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                 subview.topAnchor.constraint(equalTo: view.topAnchor),
                 subview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                 subview.leftAnchor.constraint(equalTo: view.leftAnchor),
                 subview.rightAnchor.constraint(equalTo: view.rightAnchor)
                ]
            )
        }
    }
}

