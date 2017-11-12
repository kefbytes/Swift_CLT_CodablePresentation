import Foundation

let lukeJsonString = """
{\"name\":\"Luke Skywalker\",\"height\":\"172\",\"gender\":\"male\",\"homeworld\":\"https://swapi.com/api/planets/1/\"}
"""

protocol Mappable: Codable {
    init?(jsonString: String)
}

extension Mappable {
    init?(jsonString: String) {
        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        self = try! JSONDecoder().decode(Self.self, from: jsonData)
    }
}

struct StarWarsCharacter: Mappable {
    let name:String
    let height:String
    let gender:String
    let homeworld:String
}

let luke = StarWarsCharacter(jsonString: lukeJsonString)

print(luke!)

