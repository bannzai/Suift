//
//  Font.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol FontSizable {
    var fontSize: CGFloat { get }
}

public protocol FontNamable {
    var fontName: String { get }
}

public protocol Fontable {
    var font: UIFont { get }
}

public struct Font: Fontable {
    let size: FontSizable
    let name: FontNamable
    
    public var font: UIFont {
        return UIFont(name: name.fontName, size: size.fontSize)!
    }
    
    public init(size: FontSizable, name: FontNamable) {
        self.size = size
        self.name = name
    }
}
