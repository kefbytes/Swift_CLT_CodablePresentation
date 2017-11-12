//: SwiftCLT - Codable Presentation

import Foundation

guard let filePath = Bundle.main.path(forResource: "Bare_Array_Of_Dictionaries", ofType: "json") else {
    assert(false, "❌ Bad file path. Bare_Array_Of_Dictionaries.json does not exist.")
}

guard let jsonData = FileManager.default.contents(atPath: filePath) else {
    assert(false, "❌ Unable to get contents of file")
}
let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) ?? "Data could not be printed"
//print("jsonString = \(jsonString)")

struct Character: Decodable {
    let name: String
    let films: [String]
}

struct Response: Decodable {
    
    let count: Int
    let charactersArray: [Character]
    
    enum ResponseKeys: String, CodingKey {
        case count
        case charactersArray = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        charactersArray = try container.decode([Character].self, forKey: .charactersArray)
    }
    
}

// create an instance of the object using JSONDecoder and the jsonData
do {
    let response = try JSONDecoder().decode(Response.self, from: jsonData)
    print("🤖 response.count = \(response.count)")
//    print("🤖 response.charactersArray = \(response.charactersArray)")
    let luke = response.charactersArray[0]
    print("🤖 \(luke.name) = \(luke)")
    let c3po = response.charactersArray[1]
    print("🤖 \(c3po.name) = \(c3po)")
    let r2d2 = response.charactersArray[2]
    print("🤖 \(r2d2.name) = \(r2d2)")
    let lukeFilms = luke.films
    print("🤖 lukeFilms = \(lukeFilms)")
} catch {
    print("❌ \(error.localizedDescription)")
}
