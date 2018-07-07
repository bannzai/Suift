//
//  CollectionViewSection.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation


public protocol CollectionViewSectionType {
    var items: [CollectionViewItemType] { get set }
    
    var header: CollectionViewSectionHeaderFooterViewable? { get }
    var footer: CollectionViewSectionHeaderFooterViewable? { get }
    
    mutating func remove(for item: Int) -> CollectionViewItemType
    mutating func insert(_ item: CollectionViewItemType, to index: Int)
}

public struct CollectionViewSection: CollectionViewSectionType {
    public var items: [CollectionViewItemType]
    
    public var header: CollectionViewSectionHeaderFooterViewable?
    public var footer: CollectionViewSectionHeaderFooterViewable?
    
    public mutating func remove(for item: Int) -> CollectionViewItemType {
        return items.remove(at: item)
    }
    
    public mutating func insert(_ item: CollectionViewItemType, to index: Int) {
        items.insert(item, at: index)
    }
}

