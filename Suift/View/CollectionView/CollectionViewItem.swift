//
//  CollectionViewItem.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

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

public protocol CollectionViewItem: Reusable {
    
}

public protocol CollectionViewItemDelegatable {
    func configureCell(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func size(for collectionView: UICollectionView, indexPath: IndexPath) -> CGSize?
    
    func canMoveItem(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    
    func willDisplay(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func didEndDisplay(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    
    func shouldHighlight(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    func didHighlight(collectionView: UICollectionView, indexPath: IndexPath)
    func didUnhighlight(collectionView: UICollectionView, indexPath: IndexPath)
    
    func shouldSelect(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    func shouldDeselect(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath)
    func didDeselect(collectionView: UICollectionView, indexPath: IndexPath)
    
    func shouldShowMenu(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    func canPerformAction(collectionView: UICollectionView, action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool?
    func performAction(collectionView: UICollectionView, action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)
}


public struct CollectionViewCell<Cell: UICollectionViewCell>: CollectionViewItem {
    public typealias ItemArgument = (item: CollectionViewCell<Cell>, collectionView: UICollectionView, indexPath: IndexPath)
    public typealias PerformActionArgument = (item: CollectionViewCell<Cell>, collectionView: UICollectionView, action: Selector, indexPath: IndexPath, sender: Any?)
    
    public let identifier: String
    
    public let style: CollectionViewCellStyle // FIXME: move to Viewable
    public let constraint: LayoutMaker
    public let children: [ViewActivatableProxy]

    public var configureCell: ((Cell, ItemArgument) -> Void)?
    public var sizeFor: ((ItemArgument) -> CGSize)?
    
    public var canMoveItem: ((ItemArgument) -> Bool)?
    
    public var willDisplay: ((Cell, ItemArgument) -> Void)?
    public var didEndDisplay: ((Cell, ItemArgument) -> Void)?
    
    public var shouldHighlight: ((ItemArgument) -> Bool)?
    public var didHighlight: ((ItemArgument) -> Void)?
    public var didUnhighlight: ((ItemArgument) -> Void)?
    
    public var shouldSelect: ((ItemArgument) -> Bool)?
    public var shouldDeselect: ((ItemArgument) -> Bool)?
    public var didSelect: ((ItemArgument) -> Void)?
    public var didDeselect: ((ItemArgument) -> Void)?
    
    public var shouldShowMenu: ((ItemArgument) -> Bool)?
    public var canPerformAction: ((PerformActionArgument) -> Bool)?
    public var performAction: ((PerformActionArgument) -> Void)?
    
    public init(
        identifier: String? = nil,
        
        style: CollectionViewCellStyle,
        constraint: LayoutMaker,
        children: [ViewActivatableProxy],

        configureCell: ((Cell, ItemArgument) -> Void)? = nil,
        sizeFor: ((ItemArgument) -> CGSize)? = nil,
        
        canMoveItem: ((ItemArgument) -> Bool)? = nil,
        
        willDisplay: ((Cell, ItemArgument) -> Void)? = nil,
        didEndDisplay: ((Cell, ItemArgument) -> Void)? = nil,
        
        shouldHighlight: ((ItemArgument) -> Bool)? = nil,
        didHighlight: ((ItemArgument) -> Void)? = nil,
        didUnhighlight: ((ItemArgument) -> Void)? = nil,
        
        shouldSelect: ((ItemArgument) -> Bool)? = nil,
        shouldDeselect: ((ItemArgument) -> Bool)? = nil,
        didSelect: ((ItemArgument) -> Void)? = nil,
        didDeselect: ((ItemArgument) -> Void)? = nil,
        
        shouldShowMenu: ((ItemArgument) -> Bool)? = nil,
        canPerformAction: ((PerformActionArgument) -> Bool)? = nil,
        performAction: ((PerformActionArgument) -> Void)? = nil
        ) {
        
        self.identifier = identifier ?? Cell.className
        
        self.style = style
        self.constraint = constraint
        self.children = children
        
        self.configureCell = configureCell
        self.sizeFor = sizeFor
        
        self.canMoveItem = canMoveItem
        
        self.willDisplay = willDisplay
        self.didEndDisplay = didEndDisplay
        
        self.shouldHighlight = shouldHighlight
        self.didHighlight = didHighlight
        self.didUnhighlight = didUnhighlight
        
        self.shouldSelect = shouldSelect
        self.shouldDeselect = shouldDeselect
        self.didSelect = didSelect
        self.didDeselect = didDeselect
        
        self.shouldShowMenu = shouldShowMenu
        self.canPerformAction = canPerformAction
        self.performAction = performAction
    }
}

extension CollectionViewCell: ViewSettingable {
    public func stylize(for view: UIView) {
        style.apply(with: view as! Cell)
    }
}

extension CollectionViewCell {
    public func register(to collectionView: UICollectionView) {
        collectionView.register(Cell.self, forCellWithReuseIdentifier: identifier)
    }
}


extension CollectionViewCell: CollectionViewItemDelegatable {
    public func configureCell(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath) {
        configureCell?(cell as! Cell, (self, collectionView, indexPath))
    }
    
    public func size(for collectionView: UICollectionView, indexPath: IndexPath) -> CGSize? {
        return sizeFor?((self, collectionView, indexPath))
    }
    
    public func canMoveItem(collectionView: UICollectionView, indexPath: IndexPath) -> Bool? {
        return canMoveItem?((self, collectionView, indexPath))
    }
    
    public func willDisplay(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath) {
        willDisplay?(cell as! Cell, (self, collectionView, indexPath))
    }
    
    public func didEndDisplay(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath) {
        didEndDisplay?(cell as! Cell, (self, collectionView, indexPath))
    }
    
    public func shouldHighlight(collectionView: UICollectionView, indexPath: IndexPath) -> Bool? {
        return shouldHighlight?((self, collectionView, indexPath))
    }
    
    public func didHighlight(collectionView: UICollectionView, indexPath: IndexPath) {
        didHighlight?((self, collectionView, indexPath))
    }
    
    public func didUnhighlight(collectionView: UICollectionView, indexPath: IndexPath) {
        didUnhighlight?((self, collectionView, indexPath))
    }
    
    public func shouldSelect(collectionView: UICollectionView, indexPath: IndexPath) -> Bool? {
        return shouldSelect?((self, collectionView, indexPath))
    }
    
    public func shouldDeselect(collectionView: UICollectionView, indexPath: IndexPath) -> Bool? {
        return shouldDeselect?((self, collectionView, indexPath))
    }
    
    public func didSelect(collectionView: UICollectionView, indexPath: IndexPath) {
        didSelect?((self, collectionView, indexPath))
    }
    
    public func didDeselect(collectionView: UICollectionView, indexPath: IndexPath) {
        didDeselect?((self, collectionView, indexPath))
    }
    
    public func shouldShowMenu(collectionView: UICollectionView, indexPath: IndexPath) -> Bool? {
        return shouldShowMenu?((self, collectionView, indexPath))
    }
    
    public func canPerformAction(collectionView: UICollectionView, action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool? {
        return canPerformAction?((self, collectionView, action, indexPath, sender))
    }
    
    public func performAction(collectionView: UICollectionView, action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        performAction?((self, collectionView, action, indexPath, sender))
    }
}
