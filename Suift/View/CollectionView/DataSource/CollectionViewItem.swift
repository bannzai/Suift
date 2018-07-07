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
}

public struct CollectionViewItem<Cell: UICollectionViewCell>: CollectionViewItemType {
    public typealias ItemArgument = (item: CollectionViewItem<Cell>, collectionView: UICollectionView, indexPath: IndexPath)

    public var reusableIdentifier: String
    public var size: CGSize?
    
    public var configureCell: ((Cell, ItemArgument) -> Void)?
    public var sizeFor: ((ItemArgument) -> CGSize)?
    public var canMoveItem: ((ItemArgument) -> Bool)?
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
}
