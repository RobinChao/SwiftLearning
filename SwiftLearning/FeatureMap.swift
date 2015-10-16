//
//  FeatureMap.swift
//  SwiftLearning
//
//  Created by Clayton Minicus on 10/16/15.
//  Copyright © 2015 Clayton Minicus. All rights reserved.
//

import Foundation

public class FeatureMap {
    
    /// Internal "hash map" to hold key, value pairs
    private var map = [(Int, Double)]()
    
    /**
    Empty init
    
    - returns: A FeatureVector instance
    */
    public init() {}
    
    /**
    Adds a key and value tuple to the internal hash map while remaining
    sorted by the keys
    
    - parameter key:   The feature key
    - parameter value: The value for the particular feature
    */
    public func add(key: Int, value: Double) {
        // keep internal map sorted by key
        for (currentIndex, (currentKey, _)) in map.enumerate() {
            if currentKey > key {
                map.insert((key, value), atIndex: currentIndex)
                return
            }
        }
        map.append((key, value))
    }
    
    /**
    Gets the array of all keys in feature vector
    
    - returns: Array of sorted keys
    */
    public func keyArray() -> [Int] {
        return map.map { return $0.0 }
    }
    
    /**
    Gets a value for the given key from internal map
    
    - parameter key: They key for which to get the value
    
    - returns: The value if found, nil otherwise
    */
    public func get(key: Int) -> Double? {
        for (mapKey, value) in map {
            if key == mapKey {
                return value
            }
        }
        return nil
    }
    
    /**
    Updates the value for the given key or adds it if not present
    
    - parameter key:   The key for which to update
    - parameter value: The value to replace the old value with
    */
    public func put(key: Int, value: Double) {
        var i = 0
        for (mapKey, value) in map {
            if key == mapKey {
                map.removeAtIndex(i)
                map.insert((key, value), atIndex: i)
                return
            }
            i++
        }
        add(key, value: value)
    }
    
    /**
    Checks where the feature vector contains the given key
    
    - parameter key: The key to check the feature  vector for
    
    - returns: True if the key is found, false otherwise
    */
    public func containsKey(key: Int) -> Bool {
        for (mapKey, _) in map {
            if key == mapKey {
                return true
            }
        }
        return false
    }
    
}