//
//  ViewSettingable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewSettingable: ViewStylizable, ViewLayoutable, ViewChildActivatable, ViewUpdateDecidable {
    var constraint: LayoutMaker { get }
    var children: [ViewChildable] { get }
}


extension ViewSettingable where Self: ViewActivatable {
    public func layout(for view: UIView) {
        let set: ViewSetForLayout = (view, view.superview!, view.superview!.subviews)
        let layouts = constraint.layout(set: set)
        view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts )
    }
    
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
