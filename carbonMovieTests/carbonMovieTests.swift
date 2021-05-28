//
//  carbonMovieTests.swift
//  carbonMovieTests
//
//  Created by Tolu Alawusa on 5/26/21.
//

import XCTest
@testable import carbonMovie

class carbonMovieTests: XCTestCase {
    
    func testMovieModel() {
        let movieM = Movies.self
        XCTAssertNotNil(movieM)
    }
    
    func testMovieResultsModel() {
        let movieResultM = MovieResults.self
        XCTAssertNotNil(movieResultM)
    }
    

}
