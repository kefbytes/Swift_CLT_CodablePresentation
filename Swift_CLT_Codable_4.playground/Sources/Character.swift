import Foundation

public struct Character: Decodable {
    
    public let name:String
    public let height:String
    public let mass:String
    public let hair_color:String
    public let skin_color:String
    public let eye_color:String
    public let birth_year:String
    public let gender:String
    public let homeworld:String
    public let films:[String]
    public let species:[String]
    public let vehicles:[String]
    public let starships:[String]
    public let created:String
    public let edited:String
    public let url:String
    
}
