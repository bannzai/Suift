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
}

public protocol CollectionViewItemDelegatable {
    func configureCell(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func sizeFor(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize
}

public struct CollectionViewItem<T: UICollectionViewCell>: CollectionViewItemType {
    public typealias CollectionViewItemInfomation = (CollectionViewItem: CollectionViewItem<T>, collectionView: UICollectionView, indexPath: IndexPath)
    public var reusableIdentifier: String
    
    public var configureCell: ((T, CollectionViewItemInfomation) -> Void)?
    public var sizeFor: ((CollectionViewItemInfomation) -> CGSize)?
}

extension CollectionViewItem: CollectionViewItemDelegatable {
    public func configureCell(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath) {
        configureCell?(cell as! T, (self, collectionView, indexPath))
    }
    
    public func sizeFor(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize {
        guard let size = sizeFor?((self, collectionView, indexPath)) else {
            return .zero
        }
        
        return size
    }
}
