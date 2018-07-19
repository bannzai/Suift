//
//  ViewChildActivatable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/18.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewChildActivatable {
    var children: [ViewChildable] { get }
    func activateChildren(for view: UIView, parentViewUpdateSet set: ViewUpdateSet)
}

extension ViewChildActivatable where Self: ViewUpdateDecidable {
    public func activateChildren(for view: UIView, parentViewUpdateSet set: ViewUpdateSet) {
        children
            .forEach {
                let child = $0.view()
                if child.superview == nil {
                    view.addSubview(child)
                }
                $0.activate(for: child, viewUpdateSet: mixViewUpdateStatus(parent: set))
        }
    }
}
