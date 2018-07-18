//
//  ViewSettingable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewSettingable: ViewStylizable, ViewUpdateDecidable {
    var constraint: LayoutMaker { get }
    var children: [ViewChildable] { get }
}

// For Rootable
extension ViewSettingable {
    fileprivate func mixViewUpdateStatus(parent: ViewUpdateSet) -> ViewUpdateSet {
        let set = viewUpdateSet()
        return (
            style: parent.style && set.style,
            layout: parent.style && set.layout,
            activateChildren: parent.activateChildren && set.activateChildren
        )
    }
    
}

extension ViewSettingable where Self: ViewActivatable, Self: Viewable {
    public func layout(for view: UIView) {
        let set: ViewSetForLayout = (view, view.superview!, view.superview!.subviews)
        let layouts = constraint.layout(set: set)
        view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts )
    }
    
    public func activateChildren(for view: UIView, parentViewUpdateSet set: ViewUpdateSet) {
        let children = self.children.map { $0.viewActivatable() }
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
