//
//  NYCSchoolsListViewModel.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

class NYCSchoolsListViewModel {
    
    /**
     Load content from server
     */
    func loadContents() {
        getSchools()
    }
    
    /**
     Register the cells
     */
    func registerCells(_ tableView: UITableView) {
        tableView.register(SchoolCell.nib, forCellReuseIdentifier: SchoolCell.cellId)
    }
    
    /**
     Get school object for given indexPath
     */
    func getSchool(forIndexPath indexPath: IndexPath) -> School? {
        if indexPath.row < schools.count {
            return schools[indexPath.row]
        }
        return nil
    }
        
    var title: String {
        return "NYC Schools".localized
    }
    
    fileprivate var schools: [School] = [] {
        didSet {
            reloadContentsCallback?()
        }
    }
    var reloadContentsCallback: (() -> Void)?
}

// MARK:-  TableView handlers

extension NYCSchoolsListViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return schools.count
    }
    
    func cell(_ tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolCell.cellId) as? SchoolCell else {
            return UITableViewCell()
        }
        
        // Configure the cell...
        let school = schools[indexPath.row]
        cell.school = SchoolViewModel(withSchool: school)
        return cell
    }
    
    func height(forRow atIndexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK:- Services

extension NYCSchoolsListViewModel {
    
    func getSchools(_ completion: ((Error?) -> Void)? = nil) {
        guard NYCSchoolsAPIClient.shared.isConnected else {
            DebugLog("No active internet connection")
            completion?(APIError.noInternet)
            return
        }
        NYCSchoolsAPIClient.shared.getSchools { [unowned self] (schools, error) in
            if let error = error {
                DebugLog(error.localizedDescription)
            }
            else {
                self.schools = schools
            }
            completion?(error)
        }
    }
    
}
