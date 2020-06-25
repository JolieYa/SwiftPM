import XCTest
@testable import SwiftPM

final class SwiftPMTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPM().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
