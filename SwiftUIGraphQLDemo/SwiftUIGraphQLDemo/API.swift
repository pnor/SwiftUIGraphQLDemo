// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Search($page: Int = 1, $search: String = "attack on titan") {
      Page(page: $page) {
        __typename
        media(search: $search) {
          __typename
          title {
            __typename
            romaji
            english
            native
            userPreferred
          }
          coverImage {
            __typename
            medium
          }
        }
      }
    }
    """

  public let operationName: String = "Search"

  public var page: Int?
  public var search: String?

  public init(page: Int? = nil, search: String? = nil) {
    self.page = page
    self.search = search
  }

  public var variables: GraphQLMap? {
    return ["page": page, "search": search]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["search": GraphQLVariable("search")], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: Title? = nil, coverImage: CoverImage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The official titles of the media in various languages
        public var title: Title? {
          get {
            return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "title")
          }
        }

        /// The cover images of the media
        public var coverImage: CoverImage? {
          get {
            return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
          }
        }

        public struct Title: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaTitle"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("romaji", type: .scalar(String.self)),
              GraphQLField("english", type: .scalar(String.self)),
              GraphQLField("native", type: .scalar(String.self)),
              GraphQLField("userPreferred", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(romaji: String? = nil, english: String? = nil, native: String? = nil, userPreferred: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji, "english": english, "native": native, "userPreferred": userPreferred])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The romanization of the native language title
          public var romaji: String? {
            get {
              return resultMap["romaji"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "romaji")
            }
          }

          /// The official english title
          public var english: String? {
            get {
              return resultMap["english"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "english")
            }
          }

          /// Official title in it's native language
          public var native: String? {
            get {
              return resultMap["native"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "native")
            }
          }

          /// The currently authenticated users preferred title language. Default romaji for non-authenticated
          public var userPreferred: String? {
            get {
              return resultMap["userPreferred"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "userPreferred")
            }
          }
        }

        public struct CoverImage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaCoverImage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("medium", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(medium: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "medium": medium])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The cover image url of the media at medium size
          public var medium: String? {
            get {
              return resultMap["medium"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "medium")
            }
          }
        }
      }
    }
  }
}
