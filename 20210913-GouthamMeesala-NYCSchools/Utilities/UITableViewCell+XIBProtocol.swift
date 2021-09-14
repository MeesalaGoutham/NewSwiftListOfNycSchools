//
//  UITableViewCell+XIBProtocol.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

protocol CellXIBProtocol where Self: UITableViewCell {
    static var bundle: Bundle { get }
    static var cellId: String { get }
    static var nib: UINib { get }
}

extension CellXIBProtocol {
    
    static var bundle: Bundle {
        return .main
    }
    
    static var cellId: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: cellId, bundle: bundle)
    }
    
}
