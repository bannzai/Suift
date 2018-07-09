//
//  CollectionViewSource.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public class CollectionViewSource: NSObject {
    public weak var collectionView: UICollectionView?
    public var sections: [CollectionViewSection]
    public var didMoveItem: ((_ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> Void)?
    public var indexTitles: ((UICollectionView) -> [String])?
    public var indexTitle: ((_ collectionView: UICollectionView, _ title: String, _ index: Int) -> IndexPath)?
    
    func item(for indexPath: IndexPath) -> CollectionViewItem {
        return sections[indexPath.section].items[indexPath.item]
    }
    
    public init(
        collectionView: UICollectionView,
        sections: [CollectionViewSection]
        ) {
        self.collectionView = collectionView
        self.sections = sections
        
        super.init()
        
        setup()
    }
    
    func setup() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
}
