//
//  _0210913_GouthamMeesala_NYCSchoolsTests.swift
//  20210913-GouthamMeesala-NYCSchoolsTests
//
//  Created by Goutham Meesala on 9/13/21.
//

import XCTest
@testable import _0210913_GouthamMeesala_NYCSchools

class _0210913_GouthamMeesala_NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelAndViewModelEqualityForSchoolName() {
        let model = School(dbn: "02M260",
                           school_name: "Clinton School Writers & Artists, M.S. 260",
                           overview_paragraph: "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
                           phone_number: "212-524-4360",
                           fax_number: "212-524-4365",
                           school_email: "admissions@theclintonschool.net",
                           website: "www.theclintonschool.net")
        let viewModel = SchoolViewModel(withSchool: model)
        XCTAssertEqual(model.school_name, viewModel.name)
    }
    
    func testModelAndViewModelEqualityForOverview() {
        let model = School(dbn: "02M260",
                           school_name: "Clinton School Writers & Artists, M.S. 260",
                           overview_paragraph: "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
                           phone_number: "212-524-4360",
                           fax_number: "212-524-4365",
                           school_email: "admissions@theclintonschool.net",
                           website: "www.theclintonschool.net")
        let viewModel = SchoolViewModel(withSchool: model)
        XCTAssertEqual(model.overview_paragraph, viewModel.overview)
    }
    
    func testModelAndViewModelEqualityForDbn() {
        let model = School(dbn: "02M260",
                           school_name: "Clinton School Writers & Artists, M.S. 260",
                           overview_paragraph: "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
                           phone_number: "212-524-4360",
                           fax_number: "212-524-4365",
                           school_email: "admissions@theclintonschool.net",
                           website: "www.theclintonschool.net")
        let viewModel = SchoolViewModel(withSchool: model)
        XCTAssertEqual(model.dbn, viewModel.dbn)
    }

}
