//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable: ViewLayoutable, ViewChildActivatable, ViewStylizable, ViewableProxy, ViewUpdateDecidable {
    func activate(for view: UIView, viewUpdateSet set: ViewUpdateSet)
    func view() -> UIView
}

// MARK: - ViewableProxy
extension Viewable {
    public func proxy() -> Viewable {
        return self
    }
}

// MARK: - ViewLayoutable, ViewChildActivatable, ViewStylizable
extension Viewable {
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
