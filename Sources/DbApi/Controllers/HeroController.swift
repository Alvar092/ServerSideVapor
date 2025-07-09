import Vapor

struct HeroController: RouteCollection {
    
    func boot(routes: any RoutesBuilder) throws {
        
        let protectedRoutes = routes.grouped(ApiKeyMiddleware())
        
        protectedRoutes.group("heroes") { builder in
            builder.get(use: index)
            builder.post(use: create)
            
            builder.delete(":heroID", use: delete)
        }
    }
}
extension HeroController {
    
    func index(_ req: Request) async throws -> [HeroDTO] {
        try await Hero.query(on: req.db).all().map { $0.toDTO() }
        //        GET /heroes?page=2&per=5
//                let page: Page<Hero>
//                if let search = try? req.query.get(String.self, at: "search") {
//                    page = try await Hero
//                        .query(on: req.db)
//                        .filter(\.$name =~ search)
//                        .sort(\.$name, .ascending)
//                        .paginate(for: req)
//                } else {
//                    page = try await Hero
//                        .query(on: req.db)
//                        .sort(\.$name, .ascending)
//                        .paginate(for: req)
//                }
//                return Page(items: page.items.map { $0.toDTO() }, metadata: page.metadata)

    }
    
    func create(_ req: Request) async throws -> HeroDTO {
        // Validations
                try HeroDTO.validate(content: req)
                
                // Decoding
                let create = try req.content.decode(HeroDTO.self)
                
                // Model
                let model = create.toModel()
                
                // Save to DB
                try await model.save(on: req.db)
                
                req.logger.info("Hero created successfully.")
                
                return model.toDTO()
    }
    
    func delete(_ req: Request) async throws -> HTTPStatus {
        guard let hero = try await Hero.find(req.parameters.get("heroID"), on: req.db) else {
            throw Abort( .notFound)
        }
        try await hero.delete(on: req.db)
        
        return .ok
    }
}

