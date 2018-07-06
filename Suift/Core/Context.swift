//
//  Context.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/06.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public class Context {
    static let shared = Context()
    
    private var references: [ObjectIdentifier: ViewReference] = [:]
    
    private init() { }
    
    func set(view: UIView) {
        let reference = ViewReference(view: view)
        let identifier = ObjectIdentifier(view)
        references[identifier] = reference
    }
    
    func isExists(view: UIView) -> Bool {
        let identifier = ObjectIdentifier(view)
        return references[identifier]?.view != nil
    }
}
