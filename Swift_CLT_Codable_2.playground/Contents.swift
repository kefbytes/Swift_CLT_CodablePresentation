//: SwiftCLT - Codable Presentation

import Foundation

// Simply getting the file path to the local json file
guard let filePath = Bundle.main.path(forResource: "Simple_Types_With_Array", ofType: "json") else {
    assert(false, "❌ Bad file path. Array_Of_Dictionaries.json does not exist.")
}

// Read in the local json file
guard let jsonData = FileManager.default.contents(atPath: filePath) else {
    assert(false, "❌ Unable to get contents of file")
}
let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) ?? "Data could not be printed"
print("jsonString = \(jsonString)")

// Create an object that conforms to Decodable, the properties  should match the fields in the json file
struct Character: Decodable {
    
    let name: String
    let height: Int
    let mass: Int
    let hairColor: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    
    enum CharacterKeys: String, CodingKey {
        case name
        case height
        case mass
        // if we want to use a different name than is used in the json
        case hairColor = "hair_color"
        case skin_color
        case eye_color
        case birth_year
        case gender
        case homeworld
        case films
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CharacterKeys.self)
        name = try container.decode(String.self, forKey: .name)
        height = try container.decode(Int.self, forKey: .height)
        mass = try container.decode(Int.self, forKey: .mass)
        hairColor = try container.decode(String.self, forKey: .hairColor)
        skin_color = try container.decode(String.self, forKey: .skin_color)
        eye_color = try container.decode(String.self, forKey: .eye_color)
        birth_year = try container.decode(String.self, forKey: .birth_year)
        gender = try container.decode(String.self, forKey: .gender)
        homeworld = try container.decode(String.self, forKey: .homeworld)
        films = try container.decode([String].self, forKey: .films)
    }
    
}

// create an instance of the object using JSONDecoder and the jsonData
do {
    let character = try JSONDecoder().decode(Character.self, from: jsonData)
    print(character)
} catch {
    print(error.localizedDescription)
}
