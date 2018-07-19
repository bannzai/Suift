//
//  ViewActivatable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/18.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewActivatable {
    func activate(for view: UIView, viewUpdateSet set: ViewUpdateSet)
}

extension ViewActivatable where Self: ViewStylizable, Self: ViewLayoutable ,Self: ViewChildActivatable {
    public func activate(for view: UIView, viewUpdateSet set: ViewUpdateSet) {
        if set.style {
            stylize(for: view)
        }
        if set.layout {
            layout(for: view)
        }
        if set.activateChildren {
            activateChildren(for: view, parentViewUpdateSet: set)
        }
    }
}
