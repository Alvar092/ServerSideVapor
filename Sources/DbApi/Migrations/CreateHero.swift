import Fluent

struct CreateHero: AsyncMigration {
    
    func prepare(on database: any Database) async throws {
        try await database
            .schema(Hero.schema)
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(Hero.schema).delete()
    }
}
