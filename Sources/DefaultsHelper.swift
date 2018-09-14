//
//  DefaultsHelper.swift
//  DefaultsHelper
//
//  Created by 刘栋 on 2018/9/14.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import Foundation
import LogWriter

public struct DefaultsHelper {
    
    private let userDefaults: UserDefaults
    private let log: LogWriter
    
    public init(userDefaults: UserDefaults) {
        let subsystem = "com.anotheren.DefaultsHelper"
        let category = "UserDefaults"
        let log = LogWriter(subsystem: subsystem, category: category)
        self.log = log
        self.userDefaults = userDefaults
    }
    
    // MARK: Clear
    
    public func clear(_ key: Key<String>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    public func clear(_ key: Key<Bool>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    public func clear(_ key: Key<Int>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    public func clear(_ key: Key<Float>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    public func clear(_ key: Key<Double>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    public func clear(_ key: Key<Date>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    public func clear<ValueType>(_ key: Key<ValueType>) {
        log.debug("CLEAR key=\(key)")
        userDefaults.removeObject(forKey: key.name)
    }
    
    // MARK: Get
    
    public func get(for key: Key<String>) -> String? {
        let _value = userDefaults.object(forKey: key.name) as? String
        log.debug("GET key=\(key),value=\(_value.unwrappedDescription)")
        return _value
    }
    
    public func get(for key: Key<String>, default value: String) -> String {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    public func get(for key: Key<Bool>) -> Bool? {
        let _value = userDefaults.object(forKey: key.name) as? Bool
        log.debug("GET key=\(key),value=\(_value.unwrappedDescription)")
        return _value
    }
    
    public func get(for key: Key<Bool>, default value: Bool) -> Bool {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    public func get(for key: Key<Int>) -> Int? {
        let _value = userDefaults.object(forKey: key.name) as? Int
        log.debug("GET key=\(key),value=\(_value.unwrappedDescription)")
        return _value
    }
    
    public func get(for key: Key<Int>, default value: Int) -> Int {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    public func get(for key: Key<Float>) -> Float? {
        let _value = userDefaults.object(forKey: key.name) as? Float
        log.debug("GET key=\(key),value=\(_value.unwrappedDescription)")
        return _value
    }
    
    public func get(for key: Key<Float>, default value: Float) -> Float {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    public func get(for key: Key<Double>) -> Double? {
        let _value = userDefaults.object(forKey: key.name) as? Double
        log.debug("GET key=\(key),value=\(_value.unwrappedDescription)")
        return _value
    }
    
    public func get(for key: Key<Double>, default value: Double) -> Double {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    public func get(for key: Key<Date>) -> Date? {
        let _value = userDefaults.object(forKey: key.name) as? Date
        log.debug("GET key=\(key),value=\(_value.unwrappedDescription)")
        return _value
    }
    
    public func get(for key: Key<Date>, default value: Date) -> Date {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    public func get<ValueType>(for key: Key<ValueType>) -> ValueType? {
        guard let _data = userDefaults.data(forKey: key.name) else {
            log.debug("GET key=\(key),value=nil")
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(ValueType.self, from: _data)
            log.debug("GET key=\(key),value=\(decoded)")
            return decoded
        } catch {
            log.error("GET key=\(key),error=\(error.localizedDescription))")
            return nil
        }
    }
    
    public func get<ValueType>(for key: Key<ValueType>, default value: ValueType) -> ValueType {
        if let _value = get(for: key) {
            return _value
        } else {
            log.debug("GET key=\(key),use default value=\(value)")
            return value
        }
    }
    
    // MARK: Set
    
    public func set(_ value: String, for key: Key<String>) {
        log.debug("SET key=\(key),value=\(value)")
        userDefaults.set(value, forKey: key.name)
    }
    
    public func set(_ value: String?, for key: Key<String>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
    
    public func set(_ value: Bool, for key: Key<Bool>) {
        log.debug("SET key=\(key),value=\(value)")
        userDefaults.set(value, forKey: key.name)
    }
    
    public func set(_ value: Bool?, for key: Key<Bool>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
    
    public func set(_ value: Int, for key: Key<Int>) {
        log.debug("SET key=\(key),value=\(value)")
        userDefaults.set(value, forKey: key.name)
    }
    
    public func set(_ value: Int?, for key: Key<Int>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
    
    public func set(_ value: Float, for key: Key<Float>) {
        log.debug("SET key=\(key),value=\(value)")
        userDefaults.set(value, forKey: key.name)
    }
    
    public func set(_ value: Float?, for key: Key<Float>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
    
    public func set(_ value: Double, for key: Key<Double>) {
        log.debug("SET key=\(key),value=\(value)")
        userDefaults.set(value, forKey: key.name)
    }
    
    public func set(_ value: Double?, for key: Key<Double>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
    
    public func set(_ value: Date, for key: Key<Date>) {
        log.debug("SET key=\(key),value=\(value)")
        userDefaults.set(value, forKey: key.name)
    }
    
    public func set(_ value: Date?, for key: Key<Date>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
    
    public func set<ValueType>(_ value: ValueType, for key: Key<ValueType>) {
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(value)
            log.debug("SET key=\(key),value=\(value)")
            userDefaults.set(encoded, forKey: key.name)
        } catch {
            log.error("SET key=\(key),error=\(error.localizedDescription)")
        }
    }
    
    public func set<ValueType>(_ value: ValueType?, for key: Key<ValueType>) {
        if let value = value {
            set(value, for: key)
        } else {
            clear(key)
        }
    }
}
