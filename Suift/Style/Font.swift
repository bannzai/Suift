//
//  Font.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Fontable: WrapperForEquatable {
    var font: UIFont { get }
}

public struct Font: Fontable {
    let size: CGFloat
    let name: String
    
    public var font: UIFont {
        return UIFont(name: name, size: size)!
    }
    
    public init(size: CGFloat, name: String) {
        self.size = size
        self.name = name
    }
}

extension Font: SuiftEquatable {
    public static func == (lhs: Font, rhs: Font) -> Bool {
        return lhs.name == rhs.name && lhs.size == rhs.size
    }
}
