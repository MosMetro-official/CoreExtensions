//
//  AppData.swift
//  
//
//  Created by polykuzin on 01/07/2022.
//

import Foundation

@propertyWrapper
public struct AppData<T> {
    private let key : String
    private let defaultValue : T

    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue : T {
        get {
            // Read value from UserDefaults
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            // Set value to UserDefaults
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}
