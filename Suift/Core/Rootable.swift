//
//  Rootable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/05.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Rootable: Viewable {
    var constraint: LayoutMaker { get }
    var children: [ViewableProxy] { get }
}

extension Rootable {
    public func proxy() -> Viewable {
        return self
    }
}

extension Rootable {
    public func layout() {
        let view = self.view()
        let set: ViewSetForLayout = (view, view.superview!, view.superview!.subviews)
        let layouts = constraint.layout(set: set)
        view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts )
    }
    
    public func activateChildren() {
        let view = self.view()
        let children = self.children.map { $0.proxy() }
        children
            .forEach {
                let child = $0.view()
                if child.superview == nil {
                    view.addSubview(child)
                }
                $0.activate()
        }
    }
}
