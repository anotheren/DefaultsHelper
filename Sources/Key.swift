//
//  Key.swift
//  DefaultsHelper
//
//  Created by 刘栋 on 2018/9/14.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import Foundation

public struct Key<ValueType: Codable>: Hashable, CustomStringConvertible {
    
    let name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public var description: String {
        return "Key<type:\(String(describing: ValueType.self)),name:\(name)>"
    }
}
