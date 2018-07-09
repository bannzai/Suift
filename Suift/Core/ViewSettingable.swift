//
//  ViewSettingable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewSettingable: Viewable {
    var constraint: LayoutMaker { get }
    var children: [ViewableProxy] { get }
}

extension ViewSettingable {
    public func proxy() -> Viewable {
        return self
    }
}

fileprivate extension ViewSettingable {
    func mixViewUpdateStatus(parent: ViewUpdateSet) -> ViewUpdateSet {
        let set = viewUpdateSet()
        return (
            style: parent.style && set.style,
            layout: parent.style && set.layout,
            activateChildren: parent.activateChildren && set.activateChildren
        )
    }
}

extension ViewSettingable {
    public func layout() {
        let view = self.view()
        let set: ViewSetForLayout = (view, view.superview!, view.superview!.subviews)
        let layouts = constraint.layout(set: set)
        view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts )
    }
    
    public func activateChildren(parentViewUpdateSet set: ViewUpdateSet) {
        let view = self.view()
        let children = self.children.map { $0.proxy() }
        children
            .forEach {
                let child = $0.view()
                if child.superview == nil {
                    view.addSubview(child)
                }
                $0.activate(viewUpdateSet: mixViewUpdateStatus(parent: set))
        }
    }
}
