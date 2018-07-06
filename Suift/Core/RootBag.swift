//
//  RootBag.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/06.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public class RootBag {
    internal var bag: Rootable?
    private var lock = NSLock()
    
    public var hasBag: Bool {
        return bag != nil
    }
    
    public init() {
        self.bag = nil
    }
    
    public func set(root: Rootable) {
        lock.lock()
        defer {
            lock.unlock()
        }
        self.bag = root
    }
    
    public func clear() {
        lock.lock()
        defer {
            lock.unlock()
        }
        bag = nil
    }
}
