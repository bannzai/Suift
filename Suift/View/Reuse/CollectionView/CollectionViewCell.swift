//
//  CollectionViewCell.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct CollectionViewCellStyle: Style {
    public var viewStyle: ViewStyle?
    
    public init() { }
    public func apply(with cell: UICollectionViewCell) {
        cell.backgroundColor = viewStyle?.backgroundColor?.color
    }
}

extension CollectionViewCellStyle: SuiftEquatable {
    public static func == (lhs: CollectionViewCellStyle, rhs: CollectionViewCellStyle) -> Bool {
        return lhs.viewStyle == rhs.viewStyle
    }
}

public struct CollectionViewCell<V: UICollectionViewCell>: Rootable {
    let _cell: V
    
    public let style: CollectionViewCellStyle // FIXME: move to Viewable
    public let constraint: LayoutMaker
    public var children: [ViewableProxy]
    
    public init(
        view: V? = nil,
        style: CollectionViewCellStyle,
        constraint: LayoutMaker,
        children: [ViewableProxy] = []
        ) {
        if let view = view {
            self._cell = view
        } else {
            self._cell = V()
        }
        self.style = style
        self.constraint = constraint
        self.children = children
    }
    
    // FIXME: move to Viewable
    public func stylize() {
        style.apply(with: _cell)
    }
    
    public func view() -> UIView {
        return _cell
    }
}
