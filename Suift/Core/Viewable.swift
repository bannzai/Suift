//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable: ViewableProxy {
    var style: ViewStyle { get }
    var constraint: LayoutMaker { get }
    var children: [ViewableProxy] { get }
    
    func stylize()
    func layout()
    func activateChildren()
    
    func activate()
    func view() -> UIView
}

extension Viewable {
    public func proxy() -> Viewable {
        return self
    }
}

extension Viewable {
    public func stylize() {
        let view = self.view()
        style.apply(with: view)
    }
    
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
    
    public func activate() {
        stylize()
        layout()
        activateChildren()
    }
}
