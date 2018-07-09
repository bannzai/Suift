//
//  Builder.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Buildable: ViewableProxy, ViewUpdateDecidable {
    var rootBag: RootBag { get }
    func build() -> Rootable
}

extension Buildable {
    public func proxy() -> Viewable {
        return build()
    }
}

extension Buildable where Self: Viewable {
    public func proxy() -> Viewable {
        return self
    }
}

extension Buildable {
    public func clearRenderCache() {
        rootBag.clear()
    }
}

extension Buildable where Self: UIViewController {
    public func render() {

        if let root = rootBag.bag {
            let view = root.view()
            root.activate(for: view, viewUpdateSet: viewUpdateSet())
            return
        }
        
        let root = build()
        let view = root.view()
        if view.superview == nil {
            self.view.addSubview(view)
        }
        
        root.activate(for: view, viewUpdateSet: allEnabledViewUpdateSet())
        rootBag.set(root: root)
    }
}

extension Buildable where Self: UIView {
    public func render() {
        if let root = rootBag.bag {
            let view = root.view()
            root.activate(for: view, viewUpdateSet: viewUpdateSet())
            return
        }
        
        let root = build()
        let view = root.view()
        if view.superview == nil {
            addSubview(view)
        }
        
        root.activate(for: view, viewUpdateSet: allEnabledViewUpdateSet())
        rootBag.set(root: root)
    }
}

