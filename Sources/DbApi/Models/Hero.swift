import Fluent

final class Hero: Model, @unchecked Sendable {
    
    static let schema: String = "heroes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    init(){}
    
    init(name: String) {
        self.name = name
    }
}
