//
//  NYCSchoolDetailsViewModel.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import Foundation

class NYCSchoolDetailsViewModel {
    /**
     Load content from server
     */
    func loadContents() {
        getScorecard()
    }
    
    var title: String {
        return "Scorecard".localized
    }
    
    var reloadContentsCallback: (() -> Void)?
    var school: School?
    
    private var scorecard: Scorecard? {
        didSet {
            reloadContentsCallback?()
        }
    }
    
    var schoolName: String {
        return scorecard?.school_name ?? "--"
    }
    
    var noOfTestTakers: String {
        return scorecard?.num_of_sat_test_takers ?? "--"
    }
    
    var criticalReadingAvgScore: String {
        return scorecard?.sat_critical_reading_avg_score ?? "--"
    }
    
    var mathAvgScore: String {
        return scorecard?.sat_math_avg_score ?? "--"
    }
    
    var writingAvgScore: String {
        return scorecard?.sat_writing_avg_score ?? "--"
    }
    
}

// MARK:- Services

extension NYCSchoolDetailsViewModel {
    
    func getScorecard(_ completion: ((Error?) -> Void)? = nil) {
        guard NYCSchoolsAPIClient.shared.isConnected else {
            DebugLog("No active internet connection")
            completion?(APIError.noInternet)
            return
        }
        
        guard let dbn = school?.dbn else {
            DebugLog("No data available")
            completion?(APIError.noData)
            return
        }
        NYCSchoolsAPIClient.shared.getScorecard(for: dbn) { [unowned self] (scorecards, error) in
            if let error = error {
                DebugLog(error.localizedDescription)
            }
            else {
                self.scorecard = scorecards.first
            }
            completion?(error)
        }
    }
    
}

