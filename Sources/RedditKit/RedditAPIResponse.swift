import Foundation

public struct RedditAPIResponse: Codable {
    public let kind: String
    public let data: ListingData

    /// A boolean value indicating whether the response contains any posts.
    public var hasPosts: Bool {
        return !data.children.isEmpty
    }

    /// The total number of posts in the response.
    public var postCount: Int {
        return data.children.count
    }

    /// An array of `PostData` objects extracted from the response.
    public var posts: [PostData] {
        return data.children.map { $0.data }
    }

    /// The URLs of all the images in the posts.
    public var imageURLs: [URL] {
        return posts.compactMap { post in
            guard let urlString = post.url, let url = URL(string: urlString) else {
                return nil
            }
            return url
        }
    }

    /// The total number of comments across all posts in the response.
    public var totalComments: Int {
        return posts.reduce(0) { $0 + ($1.numComments ?? 0) }
    }

    /// The highest scored post in the response.
    public var highestScoredPost: PostData? {
        return posts.max { $0.score ?? 0 < $1.score ?? 0 }
    }

    /// The most upvoted post in the response.
    public var mostUpvotedPost: PostData? {
        return posts.max { $0.ups ?? 0 < $1.ups ?? 0 }
    }

    /// The most downvoted post in the response.
    public var mostDownvotedPost: PostData? {
        return posts.min { $0.downs ?? 0 < $1.downs ?? 0 }
    }

    /// The most awarded post in the response.
    public var mostAwardedPost: PostData? {
        return posts.max { $0.totalAwardsReceived ?? 0 < $1.totalAwardsReceived ?? 0 }
    }

    /// The post with the highest upvote ratio in the response.
    public var highestUpvoteRatioPost: PostData? {
        return posts.max { $0.upvoteRatio ?? 0 < $1.upvoteRatio ?? 0 }
    }

    /// The oldest post in the response based on creation date.
    public var oldestPost: PostData? {
        return posts.min { $0.created ?? 0 < $1.created ?? 0 }
    }

    /// The newest post in the response based on creation date.
    public var newestPost: PostData? {
        return posts.max { $0.created ?? 0 < $1.created ?? 0 }
    }
}
