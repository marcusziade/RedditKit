import Foundation
import RedditKit

func main() {
    let networkManager = RedditNetworkManager()
    let url = networkManager.subredditURL(for: "finalfantasy")

    Task {
        await getPostTitles(from: url, using: networkManager)
    }

    RunLoop.main.run()
}

func getPostTitles(from url: URL, using networkManager: NetworkManager) async {
    do {
        let subredditData: RedditAPIResponse = try await networkManager.fetchData(from: url)
        for (index, child) in subredditData.data.children.enumerated() {
            if let title = child.data.title {
                print("\(index + 1) \(title)")
            } else {
                print("Title not available")
            }
        }
    } catch {
        print("Error fetching JSON from API: \(error)")
    }
}

main()
