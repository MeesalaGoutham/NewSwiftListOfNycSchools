//
//  NYCSchoolsAPIConfig.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import Foundation

// MARK: - Configure API base URL and end points

struct NYCSchoolsAPIConfig {
    
    struct EndPoints {
        static let getSchools = "/resource/s3k6-pzi2.json"
        static let getScorecard = "/resource/f9bf-2cp4.json?dbn=%@"
    }
    
    static var baseURL: String {
        guard let baseURL = Bundle.main.infoDictionary?["BaseURL"] as? String else {
            fatalError("BaseURL key is missing from Info.plist")
        }
        return baseURL
    }
    
}

// MARK: - Errors

enum APIError: LocalizedError {
    case `default`
    case invalidURL
    case noData
    case invalidResponse
    case noInternet
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL provided.".localized
        case .noData:
            return "Data not available at this moment.".localized
        case .invalidResponse:
            return "Invalid response.".localized
        case .noInternet:
            return "Internet not available.".localized
        default:
            return "Unknown error occured."
        }
    }
}

