import Foundation

public struct Response: Decodable {
    
    public let count: Int
    public let nextURL: String
    public let charactersArray: [Character]
    
    enum ResponseKeys: String, CodingKey {
        case count
        case nextURL = "next"
        case charactersArray = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        nextURL = try container.decode(String.self, forKey: .nextURL)
        charactersArray = try container.decode([Character].self, forKey: .charactersArray)
    }
    
}

