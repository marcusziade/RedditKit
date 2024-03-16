import XCTest

@testable import RedditKit

final class RedditKitTests: XCTestCase {

    func testGetJSONFromAPI() {
        let networkManager = RedditNetworkManager()
        let url = networkManager.subredditURL(for: "finalfantasy")
        debugPrint(url)
        let expectation = expectation(description: "Fetching JSON from API")

        Task {
            do {
                let subredditData: RedditAPIResponse = try await networkManager.fetchData(from: url)
                XCTAssertFalse(subredditData.data.children.isEmpty, "No children in subreddit data")
                expectation.fulfill()
            } catch {
                XCTFail("Error fetching JSON from API: \(error)")
            }
        }

        waitForExpectations(timeout: 5)
    }

    func testGetJSONFromLocalTestSample() {
        let jsonFileName = "r-final-fantasy-response.json"
        if let jsonFileURL = Bundle.module.url(forResource: jsonFileName, withExtension: nil) {
            do {
                let jsonData = try Data(contentsOf: jsonFileURL)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let subredditData = try decoder.decode(RedditAPIResponse.self, from: jsonData)
                XCTAssertFalse(subredditData.data.children.isEmpty, "No children in subreddit data")
            } catch {
                XCTFail("Error loading JSON file: \(error)")
            }
        } else {
            XCTFail("JSON file not found")
        }
    }
}
