//: SwiftCLT - Codable Presentation

import Foundation

// Simply getting the file path to the local json file
guard let filePath = Bundle.main.path(forResource: "Simple_Types", ofType: "json") else {
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
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    
}

// create an instance of the object using JSONDecoder and the jsonData
do {
    let character = try JSONDecoder().decode(Character.self, from: jsonData) // decoding our data
    print(character)
} catch {
    print(error.localizedDescription)
}
