//
//  CollectionViewCell.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

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
