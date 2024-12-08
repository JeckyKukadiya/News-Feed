//
//  FeedsViewModel_Tests.swift
//  News FeedsTests
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import XCTest
@testable import News_Feeds

@MainActor
final class FeedsViewModel_Tests: XCTestCase {

    let vm = FeedsViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_feedsViewModel_fetchFeeds() async {
        do {
            let check: () = await vm.fetchFeeds()
            XCTAssertNotNil(check)
        }
    }
}
