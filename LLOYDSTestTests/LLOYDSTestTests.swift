//
//  LLOYDSTestTests.swift
//  LLOYDSTestTests
//
//  Created by tzh on 19/01/2023.
//

import XCTest
import RxSwift
@testable import LLOYDSTest

final class LLOYDSTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEndpointsURL() {
    
        let endpointURL = APIEndpoints.getRoad("test").url()
        let expectedURL = "https://api.tfl.gov.uk/Road/test?app_key=\(APIManager.API_KEY_V3)"
                
        XCTAssert(endpointURL == expectedURL)
        
    }
    func testRoadAPI() throws {
        let roadId = "A2"
        let exp = expectation(description: "getRoad")
        let apiManager =  APIManager()
        let viewModel = RoadViewModel()
        viewModel.apiManager = apiManager
        viewModel.getRoad(roadId: roadId)
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                if viewModel.roadObj?.displayName == roadId {
                        exp.fulfill()
                }
        }
        
        waitForExpectations(timeout: 3, handler: nil)

        
        
        
    }


}
