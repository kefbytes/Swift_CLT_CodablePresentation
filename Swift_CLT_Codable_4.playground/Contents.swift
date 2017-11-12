//: SwiftCLT - Codable Presentation

import Foundation

guard let filePath = Bundle.main.path(forResource: "Star_Wars_People_Response", ofType: "json") else {
    assert(false, "❌ Bad file path. Array_Of_Dictionaries.json does not exist.")
}

guard let jsonData = FileManager.default.contents(atPath: filePath) else {
    assert(false, "❌ Unable to get contents of file")
}

let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) ?? "Data could not be printed"
//print("jsonString = \(jsonString)")

// create an instance of the object using JSONDecoder and the jsonData
do {
    let response = try JSONDecoder().decode(Response.self, from: jsonData)
    print("🤖 response.count = \(response.count)")
    
    var names = [String]()
    for char in response.charactersArray {
        names.append(char.name)
        print(char.name)
    }
    
    let character1 = response.charactersArray[0]
    print("🤖 \(character1.name) = \(character1)")
    character1.name
} catch {
    print("❌ \(error.localizedDescription)")
}

