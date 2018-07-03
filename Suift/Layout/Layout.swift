//
//  Layout.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Layoutable {
    @discardableResult func layout(view: UIView) -> [NSLayoutConstraint]
}

public struct Layout: Layoutable {
    //    public var left: (UIView) -> NSLayoutConstraint
    //    public var top: (UIView) -> NSLayoutConstraint
    //    public var right: (UIView) -> NSLayoutConstraint
    //    public var bottom: (UIView) -> NSLayoutConstraint
    //    public var centerX: (UIView) -> NSLayoutConstraint
    //    public var centerY: (UIView) -> NSLayoutConstraint
    public typealias Method = (UIView) -> NSLayoutConstraint
    
    public var constraint: Method
    public init(constraint: @escaping Method) {
        self.constraint = constraint
    }
    
    public func layout(view: UIView) -> [NSLayoutConstraint] {
        return [constraint(view)]
    }
}

public struct LayoutMaker: Layoutable {
    let layouts: () -> [Layoutable]
    
    public init(
        layouts: [Layoutable]
        ) {
        self.layouts = { layouts }
    }
    
    public init(
        _ closure: @escaping () -> [Layoutable]
        ) {
        self.layouts = closure
    }
    
    public func layout(view: UIView) -> [NSLayoutConstraint] {
        return layouts().layout(view: view)
    }
}


extension Array: Layoutable where Element == Layoutable {
    public func layout(view: UIView) -> [NSLayoutConstraint] {
        return flatMap { $0.layout(view: view) }
    }
}

extension NSLayoutConstraint: Layoutable {
    public func layout(view: UIView) -> [NSLayoutConstraint] {
        return [self]
    }
}
