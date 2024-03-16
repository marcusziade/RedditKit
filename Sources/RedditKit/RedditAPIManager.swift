import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
}

protocol NetworkManager {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
    func subredditURL(for subreddit: String) -> URL
    var baseURL: URL { get }
    var urlSession: URLSession { get }
}

final class RedditNetworkManager: NetworkManager {
    let urlSession: URLSession
    let baseURL = URL(string: "https://www.reddit.com")!

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        do {
            let (data, response) = try await urlSession.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                throw NetworkError.invalidResponse
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingFailed(error)
            }
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }

    func subredditURL(for subreddit: String) -> URL {
        baseURL.appendingPathComponent("r/\(subreddit).json")
    }
}
