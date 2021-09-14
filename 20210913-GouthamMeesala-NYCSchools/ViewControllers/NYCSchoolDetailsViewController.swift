//
//  NYCSchoolDetailsViewController.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

class NYCSchoolDetailsViewController: UIViewController {
    
    /**
     Creates an instance with school object
     */
    static func instantiate(withSchool school: School) -> NYCSchoolDetailsViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "NYCSchoolDetailsViewController") as? NYCSchoolDetailsViewController else {
            return nil
        }
        controller.viewModel.school = school
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = viewModel.title
        
        startSpinning()
        viewModel.reloadContentsCallback = { [weak self] in
            // Main queue was handled by threadSafeCall
            self?.stopSpinning()
            self?.configureUI()
        }
        viewModel.loadContents()
    }
    
    private func configureUI() {
                
        schoolNameLabel.text = "School name:".localized
        schoolNameValueLabel.text = viewModel.schoolName
        
        noOfTestTakersLabel.text = "No. of test takers:".localized
        noOfTestTakersValueLabel.text = viewModel.noOfTestTakers
        
        criticalReadingAvgScoreLabel.text = "Critical reading avg. score:".localized
        criticalReadingAvgScoreValueLabel.text = viewModel.criticalReadingAvgScore
        
        mathAvgScoreLabel.text = "Math avg. score:".localized
        mathAvgScoreValueLabel.text = viewModel.mathAvgScore
        
        writingAvgScoreLabel.text = "Writing avg. score:".localized
        writingAvgScoreValueLabel.text = viewModel.writingAvgScore
    }
        
    private let viewModel = NYCSchoolDetailsViewModel()
    
    @IBOutlet private weak var schoolNameLabel: UILabel!
    @IBOutlet private weak var schoolNameValueLabel: UILabel!
    @IBOutlet private weak var noOfTestTakersLabel: UILabel!
    @IBOutlet private weak var noOfTestTakersValueLabel: UILabel!
    @IBOutlet private weak var criticalReadingAvgScoreLabel: UILabel!
    @IBOutlet private weak var criticalReadingAvgScoreValueLabel: UILabel!
    @IBOutlet private weak var mathAvgScoreLabel: UILabel!
    @IBOutlet private weak var mathAvgScoreValueLabel: UILabel!
    @IBOutlet private weak var writingAvgScoreLabel: UILabel!
    @IBOutlet private weak var writingAvgScoreValueLabel: UILabel!

}
