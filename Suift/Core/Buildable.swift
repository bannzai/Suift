//
//  Builder.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Buildable: ViewUpdateDecidable {
    var rootBag: RootBag { get }
    func build() -> Rootable
}

extension Buildable {
    public func clearRenderCache() {
        rootBag.clear()
    }
}

extension Buildable where Self: UIViewController {
    public func render() {
        if let root = rootBag.bag {
            root.render()
            return
        }
        
        let root = build()
        root.renderFirst(parentView: self.view)
        rootBag.set(root: root)
    }
}

extension Buildable where Self: UIView {
    public func render() {
        if let root = rootBag.bag {
            root.render()
            return
        }
        
        let root = build()
        root.renderFirst(parentView: self)
        rootBag.set(root: root)
    }
}

