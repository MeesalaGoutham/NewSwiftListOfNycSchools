//
//  ThreadSafety.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

/**
 Helper function to check and bring the execution thread back on to main thread and load the data on UI
 */
func threadSafeCall(_ callback: @escaping () -> Void) {
    if Thread.isMainThread {
        callback()
    } else {
        DispatchQueue.main.async {
            callback()
        }
    }
}
