//
//  CollectionView.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct CollectionViewStyle: Style {
    public var viewStyle: ViewStyle?
    
    public init() { }
    public func apply(with collectionView: UICollectionView) {
        collectionView.backgroundColor = viewStyle?.backgroundColor?.color
    }
}

extension CollectionViewStyle: SuiftEquatable {
    public static func == (lhs: CollectionViewStyle, rhs: CollectionViewStyle) -> Bool {
        return lhs.viewStyle == rhs.viewStyle
    }
}

public struct CollectionView<V: UICollectionView>: Rootable {
    let _collectionView: V
    
    public let style: CollectionViewStyle // FIXME: move to Viewable
    public let constraint: LayoutMaker
    public let children: [ViewActivatableProxy]
    public let source: CollectionViewSource
    
    public init(
        view: V? = nil,
        style: CollectionViewStyle,
        constraint: LayoutMaker,
        children: [ViewActivatableProxy] = [],
        source: CollectionViewSource
        ) {
        if let view = view {
            self._collectionView = view
        } else {
            self._collectionView = V()
        }
        self.style = style
        self.constraint = constraint
        self.children = children
        self.source = source
        self.source.collectionView = _collectionView
    }
    
    // FIXME: move to Viewable
    public func stylize(for view: UIView) {
        style.apply(with: _collectionView)
    }

    public func view() -> UIView {
        return _collectionView
    }
}

extension CollectionView: Reloadable {
    public func reload() {
        source.reload()
    }
}
