import Vapor

struct HeroDTO: Content {
    
    var id: UUID?
    var name: String
    
    func toModel() -> Hero {
        Hero(name: name )
    }
}

extension Hero {
    
    func toDTO() -> HeroDTO {
        HeroDTO(id: self.id, name: self.name)
    }
}

extension HeroDTO: Validatable {
    
    static func validations(_ validations: inout Validations) {
        validations.add("name", as: String.self, is: .count(2...50), required: true)
    }
}
