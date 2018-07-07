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
    
    var header: CollectionViewSectionHeaderFooterType? { get }
    var footer: CollectionViewSectionHeaderFooterType? { get }
}

public struct CollectionViewSection: CollectionViewSectionType {
    public var items: [CollectionViewItemType]
    
    public var header: CollectionViewSectionHeaderFooterType?
    public var footer: CollectionViewSectionHeaderFooterType?
}
