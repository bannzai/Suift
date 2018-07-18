//
//  Rootable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/05.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Rootable: ViewLayoutable, ViewChildActivatable, ViewSettingable, Viewable, ViewActivatable {
    
}


// MARK: - ViewLayoutable, ViewChildActivatable, ViewStylizable
extension Rootable {
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

// MARK: - ViewActivatableProxy
extension Rootable where Self: ViewActivatable {
    public func viewActivatable() -> ViewActivatable {
        return self
    }
}
