//
//  Spinner.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

protocol Spinner {}

extension Spinner where Self: UIViewController {
    
    func startSpinning() {
        SpinnerView.shared.start()
    }
    
    func stopSpinning() {
        SpinnerView.shared.stop()
    }
    
}

extension UIViewController: Spinner {}

class SpinnerView {
    
    static let shared = SpinnerView()
    
    private var window = UIApplication.shared.windows.first!
    private var backgroundView: UIView!
    private var darkView: UIView!
    private var spinner: UIActivityIndicatorView!
    
    private init() {
        backgroundView = UIView(frame: window.bounds)
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        darkView = UIView(frame: CGRect(x: window.frame.origin.x,
                                        y: window.frame.origin.y,
                                        width: 100, height: 100))
        darkView.backgroundColor = .clear
        
        spinner = UIActivityIndicatorView()
        spinner.style = UIActivityIndicatorView.Style.medium
        spinner.center = backgroundView.center
        
        backgroundView.addSubview(darkView)
        darkView.center = backgroundView.center
        
        backgroundView.addSubview(spinner)
        backgroundView.center = window.center
        
    }
    
    fileprivate func start() {
        threadSafeCall {
            self.spinner.startAnimating()
            self.window.addSubview(self.backgroundView)
        }
    }
    
    fileprivate func stop() {
        threadSafeCall {
            self.spinner.stopAnimating()
            self.backgroundView.removeFromSuperview()
        }
    }
    
}
