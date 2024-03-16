import Foundation

public struct ListingData: Codable {
    public let after: String?
    public let dist: Int?
    public let modhash: String?
    public let geoFilter: String?
    public let children: [PostContainer]
    public let before: String?
}

public struct PostContainer: Codable {
    public let kind: String
    public let data: PostData
}

public struct PostData: Codable {
    public let approvedAtUtc: String?
    public let subreddit: String?
    public let selftext: String?
    public let authorFullname: String?
    public let saved: Bool?
    public let modReasonTitle: String?
    public let gilded: Int?
    public let clicked: Bool?
    public let title: String?
    public let linkFlairRichtext: [LinkFlairRichtext]?
    public let subredditNamePrefixed: String?
    public let hidden: Bool?
    public let pwls: Int?
    public let linkFlairCssClass: String?
    public let downs: Int?
    public let thumbnailHeight: Int?
    public let topAwardedType: String?
    public let hideScore: Bool?
    public let name: String?
    public let quarantine: Bool?
    public let linkFlairTextColor: String?
    public let upvoteRatio: Double?
    public let authorFlairBackgroundColor: String?
    public let subredditType: String?
    public let ups: Int?
    public let totalAwardsReceived: Int?
    public let mediaEmbed: MediaEmbed
    public let thumbnailWidth: Int?
    public let authorFlairTemplateId: String?
    public let isOriginalContent: Bool?
    public let userReports: [[String: String]]?
    public let secureMedia: SecureMedia?
    public let isRedditMediaDomain: Bool?
    public let isMeta: Bool?
    public let category: String?
    public let secureMediaEmbed: SecureMediaEmbed
    public let linkFlairText: String?
    public let canModPost: Bool?
    public let score: Int?
    public let approvedBy: String?
    public let isCreatedFromAdsUi: Bool?
    public let authorPremium: Bool?
    public let thumbnail: String?
    public let edited: Edited?
    public let authorFlairCssClass: String?
    public let authorFlairRichtext: [AuthorFlairRichtext]?
    public let gildings: [String: Int]?
    public let postHint: String?
    public let contentCategories: [String]?
    public let isSelf: Bool?
    public let modNote: String?
    public let created: Double?
    public let linkFlairType: String?
    public let wls: Int?
    public let removedByCategory: String?
    public let bannedBy: String?
    public let authorFlairType: String?
    public let domain: String?
    public let allowLiveComments: Bool?
    public let selftextHtml: String?
    public let likes: Int?
    public let suggestedSort: String?
    public let bannedAtUtc: String?
    public let urlOverriddenByDest: String?
    public let viewCount: Int?
    public let archived: Bool?
    public let noFollow: Bool?
    public let isCrosspostable: Bool?
    public let pinned: Bool?
    public let over18: Bool?
    public let preview: Preview?
    public let allAwardings: [String]?
    public let awarders: [String]?
    public let mediaOnly: Bool?
    public let linkFlairTemplateId: String?
    public let canGild: Bool?
    public let spoiler: Bool?
    public let locked: Bool?
    public let authorFlairText: String?
    public let treatmentTags: [String]?
    public let visited: Bool?
    public let removedBy: String?
    public let numReports: Int?
    public let distinguished: String?
    public let subredditId: String?
    public let modReasonBy: String?
    public let removalReason: String?
    public let linkFlairBackgroundColor: String?
    public let id: String?
    public let isRobotIndexable: Bool?
    public let reportReasons: [String]?
    public let author: String?
    public let discussionType: String?
    public let numComments: Int?
    public let sendReplies: Bool?
    public let whitelistStatus: String?
    public let contestMode: Bool?
    public let modReports: [[String: String]]?
    public let authorPatreonFlair: Bool?
    public let authorFlairTextColor: String?
    public let permalink: String?
    public let parentWhitelistStatus: String?
    public let stickied: Bool?
    public let url: String?
    public let subredditSubscribers: Int?
    public let createdUtc: Double?
    public let numCrossposts: Int?
    public let media: Media?
    public let isVideo: Bool?
}

public struct Preview: Codable {
    public let images: [Image]
    public let enabled: Bool
}

public struct Image: Codable {
    public let source: ImageSource
    public let resolutions: [ImageSource]
}

public struct ImageSource: Codable {
    public let url: String
    public let width: Int
    public let height: Int
}

public struct LinkFlairRichtext: Codable {
    public let e: String
    public let t: String
}

public struct AuthorFlairRichtext: Codable {
    public let e: String?
    public let t: String?
    public let a: String?
    public let u: String?
}

public struct SecureMedia: Codable {
    public let type: String?
    public let oembed: Oembed?
}

public struct Media: Codable {
    public let type: String?
    public let oembed: MediaOembed?
}

public struct MediaOembed: Codable {
    public let providerUrl: String?
    public let description: String?
    public let title: String?
    public let url: String?
    public let thumbnailUrl: String?
}

public struct Oembed: Codable {
    public let providerUrl: String?
    public let description: String?
    public let title: String?
    public let url: String?
    public let type: String?
    public let thumbnailUrl: String?
    public let version: String?
}

public struct MediaEmbed: Codable {
    public let content: String?
    public let width: WidthType?
    public let scrolling: Bool?
    public let height: Int?
    public let mediaDomainUrl: String?

    public enum WidthType: Codable {
        case string(String)
        case int(Int)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let stringValue = try? container.decode(String.self) {
                self = .string(stringValue)
            } else if let intValue = try? container.decode(Int.self) {
                self = .int(intValue)
            } else {
                throw DecodingError.typeMismatch(
                    WidthType.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Expected to decode String or Int"
                    )
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let stringValue):
                try container.encode(stringValue)
            case .int(let intValue):
                try container.encode(intValue)
            }
        }
    }
}

public struct SecureMediaEmbed: Codable {
    public let content: String?
    public let width: WidthType?
    public let scrolling: Bool?
    public let mediaId: String?
    public let height: Int?
    public let mediaDomainUrl: String?

    public enum WidthType: Codable {
        case string(String)
        case int(Int)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let stringValue = try? container.decode(String.self) {
                self = .string(stringValue)
            } else if let intValue = try? container.decode(Int.self) {
                self = .int(intValue)
            } else {
                throw DecodingError.typeMismatch(
                    WidthType.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Expected to decode String or Int"
                    )
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let stringValue):
                try container.encode(stringValue)
            case .int(let intValue):
                try container.encode(intValue)
            }
        }
    }
}

public enum Edited: Codable {
    case bool(Bool)
    case number(Double)

    public init(from decoder: Decoder) throws {
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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let boolValue):
            try container.encode(boolValue)
        case .number(let numberValue):
            try container.encode(numberValue)
        }
    }
}
