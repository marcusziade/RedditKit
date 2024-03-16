import Foundation

struct RedditAPIResponse: Codable {
    let kind: String
    let data: ListingData
}

struct ListingData: Codable {
    let after: String?
    let dist: Int?
    let modhash: String?
    let geoFilter: String?
    let children: [PostContainer]
    let before: String?
}

struct PostContainer: Codable {
    let kind: String
    let data: PostData
}

struct PostData: Codable {
    let approvedAtUtc: String?
    let subreddit: String?
    let selftext: String?
    let authorFullname: String?
    let saved: Bool?
    let modReasonTitle: String?
    let gilded: Int?
    let clicked: Bool?
    let title: String?
    let linkFlairRichtext: [LinkFlairRichtext]?
    let subredditNamePrefixed: String?
    let hidden: Bool?
    let pwls: Int?
    let linkFlairCssClass: String?
    let downs: Int?
    let thumbnailHeight: Int?
    let topAwardedType: String?
    let hideScore: Bool?
    let name: String?
    let quarantine: Bool?
    let linkFlairTextColor: String?
    let upvoteRatio: Double?
    let authorFlairBackgroundColor: String?
    let subredditType: String?
    let ups: Int?
    let totalAwardsReceived: Int?
    let mediaEmbed: [String: String]?
    let thumbnailWidth: Int?
    let authorFlairTemplateId: String?
    let isOriginalContent: Bool?
    let userReports: [[String: String]]?
    let secureMedia: SecureMedia?
    let isRedditMediaDomain: Bool?
    let isMeta: Bool?
    let category: String?
    let secureMediaEmbed: [String: String]?
    let linkFlairText: String?
    let canModPost: Bool?
    let score: Int?
    let approvedBy: String?
    let isCreatedFromAdsUi: Bool?
    let authorPremium: Bool?
    let thumbnail: String?
    let edited: Edited?
    let authorFlairCssClass: String?
    let authorFlairRichtext: [AuthorFlairRichtext]?
    let gildings: [String: Int]?
    let postHint: String?
    let contentCategories: [String]?
    let isSelf: Bool?
    let modNote: String?
    let created: Double?
    let linkFlairType: String?
    let wls: Int?
    let removedByCategory: String?
    let bannedBy: String?
    let authorFlairType: String?
    let domain: String?
    let allowLiveComments: Bool?
    let selftextHtml: String?
    let likes: Int?
    let suggestedSort: String?
    let bannedAtUtc: String?
    let urlOverriddenByDest: String?
    let viewCount: Int?
    let archived: Bool?
    let noFollow: Bool?
    let isCrosspostable: Bool?
    let pinned: Bool?
    let over18: Bool?
    let preview: Preview?
    let allAwardings: [String]?
    let awarders: [String]?
    let mediaOnly: Bool?
    let linkFlairTemplateId: String?
    let canGild: Bool?
    let spoiler: Bool?
    let locked: Bool?
    let authorFlairText: String?
    let treatmentTags: [String]?
    let visited: Bool?
    let removedBy: String?
    let numReports: Int?
    let distinguished: String?
    let subredditId: String?
    let modReasonBy: String?
    let removalReason: String?
    let linkFlairBackgroundColor: String?
    let id: String?
    let isRobotIndexable: Bool?
    let reportReasons: [String]?
    let author: String?
    let discussionType: String?
    let numComments: Int?
    let sendReplies: Bool?
    let whitelistStatus: String?
    let contestMode: Bool?
    let modReports: [[String: String]]?
    let authorPatreonFlair: Bool?
    let authorFlairTextColor: String?
    let permalink: String?
    let parentWhitelistStatus: String?
    let stickied: Bool?
    let url: String?
    let subredditSubscribers: Int?
    let createdUtc: Double?
    let numCrossposts: Int?
    let media: Media?
    let isVideo: Bool?
}

struct Preview: Codable {
    let images: [Image]
    let enabled: Bool
}

struct Image: Codable {
    let source: ImageSource
    let resolutions: [ImageSource]
}

struct ImageSource: Codable {
    let url: String
    let width: Int
    let height: Int
}

struct LinkFlairRichtext: Codable {
    let e: String
    let t: String
}

struct AuthorFlairRichtext: Codable {
    let e: String?
    let t: String?
    let a: String?
    let u: String?
}

struct SecureMedia: Codable {
    let type: String?
    let oembed: Oembed?
}

struct Media: Codable {
    let type: String?
    let oembed: MediaOembed?
}

struct MediaOembed: Codable {
    let providerUrl: String?
    let description: String?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}

struct Oembed: Codable {
    let providerUrl: String?
    let description: String?
    let title: String?
    let url: String?
    let type: String?
    let thumbnailUrl: String?
    let version: String?
}

enum Edited: Codable {
    case bool(Bool)
    case number(Double)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let boolValue = try? container.decode(Bool.self) {
            self = .bool(boolValue)
        } else if let numberValue = try? container.decode(Double.self) {
            self = .number(numberValue)
        } else {
            throw DecodingError.typeMismatch(
                Edited.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected to decode Bool or Double"
                )
            )
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let boolValue):
            try container.encode(boolValue)
        case .number(let numberValue):
            try container.encode(numberValue)
        }
    }
}
