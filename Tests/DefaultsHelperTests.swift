//
//  DefaultsHelperTests.swift
//  DefaultsHelperTests
//
//  Created by 刘栋 on 2018/9/14.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import XCTest
@testable import DefaultsHelper

class SPDefaultsTests: XCTestCase {
    
    private enum Gender: Int, Codable, Hashable, CustomStringConvertible {
        case male
        case female
        
        var description: String {
            switch self {
            case .male:
                return "male"
            case .female:
                return "female"
            }
        }
    }
    
    private struct Persion: Codable, Hashable, CustomStringConvertible {
        let name: String
        let gender: Gender
        
        var description: String {
            return "Persion<name=\(name),gender=\(gender)>"
        }
    }
    
    let defaults = DefaultsHelper(userDefaults: .standard)
    
    func testCustomCodable() {
        let persion1 = Persion(name: "Jack Ma", gender: .male)
        let persion2 = Persion(name: "Elon Musk", gender: .male)
        let persion3 = Persion(name: "Margaret Heafield Hamilton", gender: .female)
        
        let persionKey = Key<Persion>("Persion_Key")
        let persionListKey = Key<[Persion]>("Persion_List_Key")
        
        let persions = [persion1, persion2, persion3]
        
        // Persion Set & Get
        for persion in persions {
            defaults.set(persion, for: persionKey)
            guard let _persion = defaults.get(for: persionKey) else {
                fatalError("Can't find key:\(persionKey)")
            }
            XCTAssert(_persion == persion)
        }
        
        // PersionList Set & Get
        defaults.set(persions, for: persionListKey)
        guard let _persions = defaults.get(for: persionListKey) else {
            fatalError("Can't find key:\(persionListKey)")
        }
        XCTAssert(_persions == persions)
    }
    
    func testSwiftCodable() {
        let string: String = "Hello World!"
        let optionalString: String? = "Hello Swift!"
        let emptyString: String? = nil
        let defaultString: String = "Hello Apple!"
        let stringKey = Key<String>("String_Key")
        
        let int: Int = 100
        let optionalInt: Int? = -100
        let emptyInt: Int? = nil
        let defaultInt: Int = 200
        let intKey = Key<Int>("Int_key")
        
        let bool: Bool = true
        let optionalBool: Bool? = false
        let emptyBool: Bool? = nil
        let defaultBool: Bool = true
        let boolKey = Key<Bool>("Bool_Key")
        
        let float: Float = 100.0
        let optionalFloat: Float? = -100.0
        let emptyFloat: Float? = nil
        let defaultFloat: Float = 200.0
        let floatKey = Key<Float>("Float_Key")
        
        let double: Double = 100.0
        let optionalDouble: Double? = -100.0
        let emptyDouble: Double? = nil
        let defaultDouble: Double = 200.0
        let doubleKey = Key<Double>("Double_Key")
        
        // String Set & Get
        defaults.set(string, for: stringKey)
        guard let _string = defaults.get(for: stringKey) else {
            fatalError("Can't find key:\(stringKey)")
        }
        XCTAssert(_string == string)
        defaults.set(optionalString, for: stringKey)
        let _optionalString = defaults.get(for: stringKey)
        XCTAssert(_optionalString == optionalString)
        defaults.set(emptyString, for: stringKey)
        let _emptyString = defaults.get(for: stringKey)
        XCTAssert(_emptyString == emptyString)
        let _defaultString = defaults.get(for: stringKey, default: defaultString)
        XCTAssert(_defaultString == defaultString)
        
        // Int Set & Get
        defaults.set(int, for: intKey)
        guard let _int = defaults.get(for: intKey) else {
            fatalError("Can't find key:\(intKey)")
        }
        XCTAssert(_int == int)
        defaults.set(optionalInt, for: intKey)
        let _optionalInt = defaults.get(for: intKey)
        XCTAssert(_optionalInt == optionalInt)
        defaults.set(emptyInt, for: intKey)
        let _emptyInt = defaults.get(for: intKey)
        XCTAssert(_emptyInt == emptyInt)
        let _defaultInt = defaults.get(for: intKey, default: defaultInt)
        XCTAssert(_defaultInt == defaultInt)
        
        // Bool Get & Set
        defaults.set(bool, for: boolKey)
        guard let _bool = defaults.get(for: boolKey) else {
            fatalError("Can't find key:\(boolKey)")
        }
        XCTAssert(_bool == bool)
        defaults.set(optionalBool, for: boolKey)
        let _optionalBool = defaults.get(for: boolKey)
        XCTAssert(_optionalBool == optionalBool)
        defaults.set(emptyBool, for: boolKey)
        let _emptyBool = defaults.get(for: boolKey)
        XCTAssert(_emptyBool == emptyBool)
        let _defaultBool = defaults.get(for: boolKey, default: defaultBool)
        XCTAssert(_defaultBool == defaultBool)
        
        // Float Get & Set
        defaults.set(float, for: floatKey)
        guard let _float = defaults.get(for: floatKey) else {
            fatalError("Can't find key:\(floatKey)")
        }
        XCTAssert(_float == float)
        defaults.set(optionalFloat, for: floatKey)
        let _optionalFloat = defaults.get(for: floatKey)
        XCTAssert(_optionalFloat == optionalFloat)
        defaults.set(emptyFloat, for: floatKey)
        let _emptyFloat = defaults.get(for: floatKey)
        XCTAssert(_emptyFloat == emptyFloat)
        let _defaultFloat = defaults.get(for: floatKey, default: defaultFloat)
        XCTAssert(_defaultFloat == defaultFloat)
        
        // Double Get & Set
        defaults.set(double, for: doubleKey)
        guard let _double = defaults.get(for: doubleKey) else {
            fatalError("Can't find key:\(doubleKey)")
        }
        XCTAssert(_double == double)
        defaults.set(optionalDouble, for: doubleKey)
        let _optionalDouble = defaults.get(for: doubleKey)
        XCTAssert(_optionalDouble == optionalDouble)
        defaults.set(emptyDouble, for: doubleKey)
        let _emptyDouble = defaults.get(for: doubleKey)
        XCTAssert(_emptyDouble == emptyDouble)
        let _defaultDouble = defaults.get(for: doubleKey, default: defaultDouble)
        XCTAssert(_defaultDouble == defaultDouble)
    }
    
    func testFoundationCodable() {
        let date = Date()
        let optionalDate: Date? = date.addingTimeInterval(3600)
        let emptyDate: Date? = nil
        let defaultDate: Date = date.addingTimeInterval(-3600)
        let dateKey = Key<Date>("Date_Key")
        
        // Date Get & Set
        defaults.set(date, for: dateKey)
        guard let _date = defaults.get(for: dateKey) else {
            fatalError("Can't find key:\(dateKey)")
        }
        XCTAssert(_date == date)
        defaults.set(optionalDate, for: dateKey)
        let _optionalDate = defaults.get(for: dateKey)
        XCTAssert(_optionalDate == optionalDate)
        defaults.set(emptyDate, for: dateKey)
        let _emptyDate = defaults.get(for: dateKey)
        XCTAssert(_emptyDate == emptyDate)
        let _defaultDate = defaults.get(for: dateKey, default: defaultDate)
        XCTAssert(_defaultDate == defaultDate)
    }
}
