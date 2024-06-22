//
//  TestsHomePageVM.swift
//  iOS-FitAITests
//
//  Created by Ahmet Yasin Atakan on 20.06.2024.
//

import XCTest
@testable import iOS_FitAI

final class HomePageViewModelTests: XCTestCase {
    var homepageVM: MockHomePageViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        homepageVM = MockHomePageViewModel()
        homepageVM.mockNetworkService = mockNetworkService
    }
    
    override func tearDown() {
        homepageVM = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func test_getTraining_success() async {
        let expectation = self.expectation(description: "Training program should be set")
        // Given
        let mockProgram = ["Bench Press": "4x12"]
        let mockData = TrainingModel(fitnessAntrenman: [FitnessAntrenman(day: "day_one", program: mockProgram)])
        mockNetworkService.response = .success(mockData)
        
        // When
        Task {
            await self.homepageVM.getTraining()
            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1)
        XCTAssertEqual(homepageVM.trainingProgram, mockProgram)
    }
    
    func test_getTraining_failure() async {
        let expectation = self.expectation(description: "Training program should be nil")
        // Given
        mockNetworkService.response = .failure(NSError(domain: "Test", code: 1, userInfo: nil))
        
        // When
        Task {
            await self.homepageVM.getTraining()
            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1)
        XCTAssertNil(homepageVM.trainingProgram)
    }
}
