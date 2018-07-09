//
//  CollectionViewSection.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol CollectionViewSection {
    var items: [CollectionViewItem] { get set }
    
    var header: CollectionViewSectionHeaderFooterViewable? { get }
    var footer: CollectionViewSectionHeaderFooterViewable? { get }
    
    mutating func remove(for item: Int) -> CollectionViewItem
    mutating func insert(_ item: CollectionViewItem, to index: Int)
}

public protocol CollectionViewSectionDelegatable {
    func inset(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> UIEdgeInsets?
    func minimumLineSpacing(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat?
    func minimumInteritemSpacing(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat?
}

public struct CollectionViewSectionImpl: CollectionViewSection {
    public typealias SectionArgument = (Section: CollectionViewSectionImpl, collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int)
    public var items: [CollectionViewItem]
    
    public var header: CollectionViewSectionHeaderFooterViewable?
    public var footer: CollectionViewSectionHeaderFooterViewable?
    
    public var inset: ((SectionArgument) -> UIEdgeInsets)?
    public var minimumLineSpacing: ((SectionArgument) -> CGFloat)?
    public var minimumInteritemSpacing: ((SectionArgument) -> CGFloat)?
    
    public init(
        items: [CollectionViewItem],
        
        header: CollectionViewSectionHeaderFooterViewable? = nil,
        footer: CollectionViewSectionHeaderFooterViewable? = nil,
        
        inset: ((SectionArgument) -> UIEdgeInsets)? = nil,
        minimumLineSpacing: ((SectionArgument) -> CGFloat)? = nil,
        minimumInteritemSpacing: ((SectionArgument) -> CGFloat)? = nil
        ) {
        self.items = items
        
        self.header = header
        self.footer = footer
        
        self.inset = inset
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
    }
    
    public init<E>(
        elements: [E],
        
        header: CollectionViewSectionHeaderFooterViewable? = nil,
        footer: CollectionViewSectionHeaderFooterViewable? = nil,
        
        inset: ((SectionArgument) -> UIEdgeInsets)? = nil,
        minimumLineSpacing: ((SectionArgument) -> CGFloat)? = nil,
        minimumInteritemSpacing: ((SectionArgument) -> CGFloat)? = nil,
        
        itemsClosure: ((E) -> [CollectionViewItem])
        ) {
        self.items = elements.flatMap { itemsClosure($0) }
        
        self.header = header
        self.footer = footer
        
        self.inset = inset
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
    }

    
    public mutating func remove(for item: Int) -> CollectionViewItem {
        return items.remove(at: item)
    }
    
    public mutating func insert(_ item: CollectionViewItem, to index: Int) {
        items.insert(item, at: index)
    }
}


extension CollectionViewSectionImpl: CollectionViewSectionDelegatable {
    public func inset(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> UIEdgeInsets? {
        return inset?((self, collectionView, collectionViewLayout, section))
    }
    public func minimumLineSpacing(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat? {
        return minimumLineSpacing?((self, collectionView, collectionViewLayout, section))
    }
    public func minimumInteritemSpacing(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat? {
        return minimumInteritemSpacing?((self, collectionView, collectionViewLayout, section))
    }
}

