//
//  NYCSchoolsListViewController.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

class NYCSchoolsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.registerCells(tableView)
        navigationItem.title = viewModel.title
             
        startSpinning()
        viewModel.reloadContentsCallback = { [weak self] in
            // Main queue was handled by threadSafeCall
            self?.stopSpinning()
            self?.tableView.reloadData()
        }
        viewModel.loadContents()
    }
    
    private func showScoreDetails(forIndexPath indexPath: IndexPath) {
        if let school = viewModel.getSchool(forIndexPath: indexPath),
           let controller = NYCSchoolDetailsViewController.instantiate(withSchool: school) {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = NYCSchoolsListViewModel()

}

// MARK: - Table view data source

extension NYCSchoolsListViewController:
    UITableViewDataSource,
    UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cell(tableView, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.height(forRow: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showScoreDetails(forIndexPath: indexPath)
    }
    
}
