//
//  CollectionViewCollectionViewItem.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol CollectionViewItemType {
    var reusableIdentifier: String { get set }
    var size: CGSize? { get set }
}

public protocol CollectionViewItemDelegatable {
    func configureCell(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func sizeFor(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize?
    func canMoveItem(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    func willDisplay(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func didEndDisplay(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func shouldHighlight(collectionView: UICollectionView, indexPath: IndexPath) -> Bool?
    func didHighlight(collectionView: UICollectionView, indexPath: IndexPath)
    func didUnhighlight(collectionView: UICollectionView, indexPath: IndexPath)
}

public struct CollectionViewItem<Cell: UICollectionViewCell>: CollectionViewItemType {
    public typealias ItemArgument = (item: CollectionViewItem<Cell>, collectionView: UICollectionView, indexPath: IndexPath)

    public var reusableIdentifier: String
    public var size: CGSize?
    
    public var configureCell: ((Cell, ItemArgument) -> Void)?
    public var sizeFor: ((ItemArgument) -> CGSize)?
    public var canMoveItem: ((ItemArgument) -> Bool)?
    public var willDisplay: ((Cell, ItemArgument) -> Void)?
    public var didEndDisplay: ((Cell, ItemArgument) -> Void)?
    public var shouldHighlight: ((ItemArgument) -> Bool)?
    public var didHighlight: ((ItemArgument) -> Void)?
    public var didUnhighlight: ((ItemArgument) -> Void)?
}

extension CollectionViewItem: CollectionViewItemDelegatable {
    public func configureCell(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath) {
        configureCell?(cell as! Cell, (self, collectionView, indexPath))
    }

    public func sizeFor(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize? {
        return sizeFor?((self, collectionView, indexPath)) ?? size
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
}
