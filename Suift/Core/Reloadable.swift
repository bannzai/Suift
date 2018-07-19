//
//  Reloadable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Reloadable {
    func reload()
}

public protocol CollectionViewReloadable: Reloadable, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
}

