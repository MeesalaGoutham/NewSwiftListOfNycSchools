//
//  NYCSchoolsAPIClient.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import Foundation
import Network

class NYCSchoolsAPIClient {
    
    static let shared = NYCSchoolsAPIClient()
    private let networkMonitor = NWPathMonitor()
    private(set) var isConnected: Bool = true
    
    private init() {
        networkMonitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                DebugLog("Internet connection is on.")
                self.isConnected = true
            } else {
                DebugLog("There's no internet connection.")
                self.isConnected = false
            }
        }
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        networkMonitor.start(queue: queue)
    }
    
    /**
     Validate inputs for base url and end point then generate proper URL instance
     */
    private func constructURL(baseURL: String, endPoint: String) -> URL? {
        guard baseURL.count > 0, endPoint.count > 0 else {
            return nil
        }
        var urlString = ""
        if baseURL.hasSuffix("/") && endPoint.hasPrefix("/") {
            urlString = String(baseURL.dropLast()).appending(endPoint)
        }
        else if (baseURL.hasSuffix("/") && !endPoint.hasPrefix("/")) ||
                !baseURL.hasSuffix("/") && endPoint.hasPrefix("/") {
            urlString = baseURL.appending(endPoint)
        }
        else {
            urlString = baseURL.appending("/").appending(endPoint)
        }
        return URL(string: urlString)
    }
    
}

// MARK: - Service calls for public interface

extension NYCSchoolsAPIClient {
    
    /**
     Get schools data from server
     */
    func getSchools(_ completion: @escaping ([School], Error?) -> Void) {
        guard let url = constructURL(baseURL: NYCSchoolsAPIConfig.baseURL, endPoint: NYCSchoolsAPIConfig.EndPoints.getSchools) else {
            DebugLog("Invalid url provided")
            completion([], APIError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            threadSafeCall {
                guard let data = data else {
                    completion([], error)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([School].self, from: data)
                    completion(result, nil)
                }
                catch let error {
                    completion([], error)
                }
            }
        }
        task.resume()
    }
    
    /**
     Get scorecard data from server for a given `dbn`
     */
    func getScorecard(for dbn: String, _ completion: @escaping ([Scorecard], Error?) -> Void) {
        guard let url = constructURL(baseURL: NYCSchoolsAPIConfig.baseURL, endPoint: String(format: NYCSchoolsAPIConfig.EndPoints.getScorecard, dbn)) else {
            DebugLog("Invalid url provided")
            completion([], APIError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            threadSafeCall {
                guard let data = data else {
                    completion([], error)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Scorecard].self, from: data)
                    completion(result, nil)
                }
                catch let error {
                    completion([], error)
                }
            }
        }
        task.resume()
    }
    
}
