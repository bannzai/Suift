//
//  CollectionReusableView.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct CollectionReusableViewStyle: Style {
    public var viewStyle: ViewStyle?
    
    public init() { }
    public func apply(with cell: UICollectionReusableView) {
        cell.backgroundColor = viewStyle?.backgroundColor?.color
    }
}

extension CollectionReusableViewStyle: SuiftEquatable {
    public static func == (lhs: CollectionReusableViewStyle, rhs: CollectionReusableViewStyle) -> Bool {
        return lhs.viewStyle == rhs.viewStyle
    }
}

public struct CollectionReusableView<V: UICollectionReusableView>: Rootable {
    let _reusableView: V
    
    public let style: CollectionReusableViewStyle // FIXME: move to Viewable
    public let constraint: LayoutMaker
    public var children: [ViewableProxy]
    
    public init(
        view: V? = nil,
        style: CollectionReusableViewStyle,
        constraint: LayoutMaker,
        children: [ViewableProxy] = []
        ) {
        if let view = view {
            self._reusableView = view
        } else {
            self._reusableView = V()
        }
        self.style = style
        self.constraint = constraint
        self.children = children
    }
    
    // FIXME: move to Viewable
    public func stylize() {
        style.apply(with: _reusableView)
    }
    
    public func view() -> UIView {
        return _reusableView
    }
}
