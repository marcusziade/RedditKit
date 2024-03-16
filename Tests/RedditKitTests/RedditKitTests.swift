import XCTest

@testable import RedditKit

final class RedditKitTests: XCTestCase {

    func testGetJSONSample() {
        let jsonFileName = "r-final-fantasy-response.json"
        if let jsonFileURL = Bundle.module.url(forResource: jsonFileName, withExtension: nil) {
            do {
                let jsonData = try Data(contentsOf: jsonFileURL)
                let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
                XCTAssertNotNil(json)
                XCTAssertTrue(json is [String: Any])
            } catch {
                print("Error loading JSON file: \(error)")
            }
        } else {
            print("JSON file not found")
        }
    }
}
