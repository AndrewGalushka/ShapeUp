//
//  AtomicProperty.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

fileprivate final class ReadWriteLock {
    private var rwlock: pthread_rwlock_t = {
        var rwlock = pthread_rwlock_t()
        pthread_rwlock_init(&rwlock, nil)
        return rwlock
    }()
    
    func writeLock() {
        pthread_rwlock_wrlock(&rwlock)
    }
    
    func readLock() {
        pthread_rwlock_rdlock(&rwlock)
    }
    
    func unlock() {
        pthread_rwlock_unlock(&rwlock)
    }
}

class AtomicProperty<T> {
    private var underlyingValue: T
    private let lock = ReadWriteLock()
    
    init(value: T) {
        self.underlyingValue = value
    }
    
    var value: T {
        get {
            lock.readLock()
            let value = underlyingValue
            lock.unlock()
            return value
        }
        set {
            lock.writeLock()
            underlyingValue = newValue
            lock.unlock()
        }
    }
}
