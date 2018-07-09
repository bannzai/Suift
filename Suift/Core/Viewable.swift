//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable: ViewableProxy, ViewUpdateDecidable {
    func stylize(for view: UIView)
    func layout(for view: UIView)
    func activateChildren(for view: UIView, parentViewUpdateSet set: ViewUpdateSet)
    
    func activate(for view: UIView, viewUpdateSet set: ViewUpdateSet)
    func view() -> UIView
}

extension Viewable {
    public func proxy() -> Viewable {
        return self
    }
}

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
