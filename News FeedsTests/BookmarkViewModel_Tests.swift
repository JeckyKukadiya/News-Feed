//
//  BookmarkViewModel_Tests.swift
//  News FeedsTests
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import XCTest
@testable import News_Feeds

@MainActor
final class BookmarkViewModel_Tests: XCTestCase {

    let vm = BookmarkViewModel()
    let article: Article = Article.preViewData[0]
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_BookmarkViewModel_isBookMarked() {
        XCTAssertFalse(vm.isBookMarked(for: article))
    }

    func test_BookmarkViewModel_addBookmark() {
        XCTAssertNotNil(vm.addBookmark(for: article))
    }
    
    func test_BookmarkVViewModel_removeBookmark() {
        XCTAssertNotNil(vm.removeBookmark(for: article))
    }
}
