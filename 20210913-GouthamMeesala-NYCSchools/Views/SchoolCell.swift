//
//  SchoolCell.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import UIKit

struct SchoolViewModel {
    
    let name: String
    let overview: String
    let dbn: String
    
    // Dependancy Injection with Model
    init(withSchool model: School) {
        self.name = model.school_name ?? ""
        self.overview = model.overview_paragraph ?? ""
        self.dbn = model.dbn ?? ""
    }
    
}

class SchoolCell: UITableViewCell, CellXIBProtocol {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configureCell() {
        guard let school = school else { return }
        
        // Configure cell data
        schoolNameLabel.text = school.name
    }
    
    var school: SchoolViewModel? {
        didSet {
            configureCell()
        }
    }
    
    @IBOutlet private weak var schoolNameLabel: UILabel!
    
}
