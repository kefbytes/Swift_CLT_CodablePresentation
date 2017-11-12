import Foundation

let luke = StarWarsCharacter(name: "Luke Skywalker", height: "172", gender: "male", homeworld: "https://swapi.co/api/planets/1/")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let json = try encoder.encode(luke)
print(String(data: json, encoding: .utf8)!)


