import Foundation

public struct StarWarsCharacter: Codable {
    
    public var name:String
    public var height:String
    public var gender:String
    public var homeworld:String
    
    public init(name: String, height: String, gender: String, homeworld: String) {
        self.name = name
        self.height = height
        self.gender = gender
        self.homeworld = homeworld
    }
    
}
