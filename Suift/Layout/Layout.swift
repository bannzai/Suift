//
//  Layout.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public typealias ViewSetForLayout = (view: UIView, superview: UIView, views: [UIView])
public typealias LayoutFactoryMethod = (ViewSetForLayout) -> NSLayoutConstraint

public protocol Layoutable {
    func layout(set: ViewSetForLayout) -> [NSLayoutConstraint]
}

public struct Layout: Layoutable {
    //    public var left: (UIView) -> NSLayoutConstraint
    //    public var top: (UIView) -> NSLayoutConstraint
    //    public var right: (UIView) -> NSLayoutConstraint
    //    public var bottom: (UIView) -> NSLayoutConstraint
    //    public var centerX: (UIView) -> NSLayoutConstraint
    //    public var centerY: (UIView) -> NSLayoutConstraint

    public var constraint: () -> NSLayoutConstraint
    public init(constraint: @escaping () -> NSLayoutConstraint) {
        self.constraint = constraint
    }
    
    public func layout(set: ViewSetForLayout) -> [NSLayoutConstraint] {
        return [constraint()]
    }
}

public struct LayoutMaker: Layoutable {
    let layouts: (ViewSetForLayout) -> [Layoutable]
    
    public init(
        layouts: [Layoutable]
        ) {
        self.layouts = { _ in layouts }
    }
    
    public init(
        _ closure: @escaping (ViewSetForLayout) -> [Layoutable]
        ) {
        self.layouts = closure
    }
    
    public init(
        _ closure: @escaping (ViewSetForLayout) -> [() -> Layoutable]
        ) {
        self.layouts = { set in closure(set).map { $0() } }
    }
    
    public func layout(set: ViewSetForLayout) -> [NSLayoutConstraint] {
        return layouts(set).layout(set: set)
    }
}


extension Array: Layoutable where Element == Layoutable {
    public func layout(set: ViewSetForLayout) -> [NSLayoutConstraint] {
        return flatMap { $0.layout(set: set) }
    }
}

extension NSLayoutConstraint: Layoutable {
    public func layout(set: ViewSetForLayout) -> [NSLayoutConstraint] {
        return [self]
    }
}
