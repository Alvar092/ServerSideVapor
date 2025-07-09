import Foundation
import Fluent

struct PopulateData: AsyncMigration {

    func prepare(on database: any Database) async throws {
        // MARK: - Heroes
        let goku = Hero(name: "Goku")
        let chiChi = Hero(name: "Chi-Chi")
        let vegeta = Hero(name: "Vegeta")
        let bulma = Hero(name: "Bulma")
        let gohan = Hero(name: "Gohan")
        let piccolo = Hero(name: "Piccolo")
        let freezer = Hero(name: "Freezer")
        let krilin = Hero(name: "Krilin")
        let celula = Hero(name: "Celula")
        let yamcha = Hero(name: "Yamcha")
        let trunks = Hero(name: "Trunks")
        let raditz = Hero(name: "Raditz")
        let android16 = Hero(name: "Androide 16")
        let android17 = Hero(name: "Androide 17")
        let android18 = Hero(name: "Androide 18")
        let android19 = Hero(name: "Androide 19")
        let android20 = Hero(name: "Androide 20")
        
        await withThrowingTaskGroup(of: Void.self) { taskGroup in
            [goku, chiChi, vegeta, bulma, gohan, piccolo, freezer, krilin, celula, yamcha, trunks, raditz, android16, android17, android18, android19, android20].forEach { hero in
                taskGroup.addTask {
                    try await hero.create(on: database)
                }
            }
        }
    }
    
        
        
        
        
        //
        //        let episode195 = Episode(
        //            episodeNumber: 195,
        //            title: "Un Misterioso Guerrero",
        //            airedAt: Date(),
        //            summary: "Chi-Chi llama a Gohan y a Son Goku para comer, mientras Goku va en busca de leña, arrancando un árbol de gran tamaño. Cuando llega a su casa con la leña, Chi-Chi le pregunta si a visto a Gohan, que se había ido a jugar en el bosque, por lo tanto, Goku va en su búsqueda.\n\nMientras un Granjero ve cómo un artefacto desconocido llega a la Tierra ocasionando una fuerte explosión, primero pensó que sería un meteorito pero... es una nave y de ella sale un formidable guerrero, a el cual le extraña que los habitantes del planeta Tierra sigan vivos, preguntándole a el granjero ¿Que ha sido de mi hermano? para calcular la fuerza con su Scouter de combate 5, pero el granjero antes le dispara con su escopeta, pero el guerrero atrapa la bala con facilidad y con un solo dedo se la devuelve a gran velocidad asesinándolo. Su Scouter detecta una \"gran energía\" a algo mas de cuatro kilómetros.",
        //            imageURL: "/images/raditz.jpeg",
        //            protagonistID: try goku.requireID()
        //        )
        //
        //        let episode196 = Episode(
        //            episodeNumber: 196,
        //            title: "El Pasado de Goku",
        //            airedAt: Date(),
        //            summary: "Bulma decide ir a Kame House para según ella pasárselo bien sin Yamcha, ya que siempre se están peleando como pareja. Llevó unos pasteles de regalo, aunque como es normal en el Maestro Roshi le dijo: ''Solo me conformo con que me des un abrazo de bienvenida''. Luego Bulma le dio un golpe en la cabeza mientras el Maestro Roshi le decía que no entendía su sentido del humor. Por otro lado Son Goku y Son Gohan se acercaban en la Nube Kinton al igual que Raditz, donde todos quedan asombrados pensando que Goku cuidaba niños cuando en realidad les dice que el niño es su hijo, el Maestro Roshi queda asombrado ya que Goku le había puesto el nombre de su abuelo, quien junto a Bulma, Krilin y Umigame le preguntan si a Son Gohan le pasaba algo cuando aparecía la luna llena (transformarse en Ozaru) pero como ellos se iban a dormir temprano no había problema. Después Goku siente un gran poder y rápidamente aparece un guerrero que parece conocer mucho a Goku, llamándole Kakarrot y diciéndole que se parece mucho a su Papá, este le pregunta que como está la situación de el planeta, seguidamente Krilin se acerca a él para que se largase, pero éste con un simple golpe con su cola lo tumba, el guerrero piensa que Kakarrot lo había reconocido, donde gracias a el Maestro Roshi cuenta que Goku se había dado un fuerte golpe de pequeño y pasó de ser un niño violento a ser un buen chico que se salvó gracias a su extraordinaria fuerza vital. finalmente (mientras Krilin se levanta después de el golpe) donde le cuenta la historia de su pasado, diciéndole que pertenecía a una familia de Saiyan y que su planeta natal era el Planeta Vegeta.",
        //            imageURL: "/images/gohan.jpg",
        //            protagonistID: try gohan.requireID()
        //        )
        //
        //        let episode197 = Episode(
        //            episodeNumber: 197,
        //            title: "La Unión de los dos Adversarios",
        //            airedAt: Date(),
        //            summary: "Para que Raditz devolviese a Son Gohan con vida, Goku tendría que matar a cien personas para que se lo devolviese. Después de que Raditz le diga esto a Goku, se va volando, mientras que Goku se recupera del golpe. El Maestro Roshi le pide que no vaya inmediatamente porque está confuso y si va solo y sin ninguna idea, perdería la batalla. Goku les cuenta a Krilin, Roshi y Bulma que puede que su hermano tenga el mismo punto débil que él cuando era pequeño, la cola y por ello dice que él no podrá hacerlo solo, por lo cual le pide ayuda a Krilin y Roshi. Ambos le dicen a Bulma que si mueren los haga resucitar con las Bolas de Dragon, pero Goku les recuerda que Shen Long no puede cumplir el mismo deseo más de una vez. Aún así con la ausencia de Ten shin han y Yamcha, deciden ir con él aunque tanto Krilin como Roshi sabían que prácticamente no tenían ninguna posibilidad de ganar. Bulma tiene una gran idea diciendo que si reúnen las Esferas del Dragón, podrían pedir a Shen Long que salvará la Tierra de las personas malas, pero no podrían conseguir las 7 Esferas en un solo día. Cuando están por partir, aparece nada más ni nada menos que Piccolo, que había seguido a Raditz, Piccolo le dijo a Goku que la fuerza de Raditz era mucho mayor que la de ellos y no podrían vencerlo por separado y le dice a Goku que irá con él, pero no porque quiera salvar a Gohan sino porque Raditz se interpone en sus planes de conquistar la Tierra.",
        //            imageURL: "/images/raditz_gohan.jpg",
        //            protagonistID: try vegeta.requireID()
        //        )
        //
        //        let episode198 = Episode(
        //            episodeNumber: 198,
        //            title: "El Plan de Piccolo",
        //            airedAt: Date(),
        //            summary: "La dura batalla acaba de empezar contra Raditz, pero aún así Goku y Piccolo están temblando de miedo ante Raditz por su superioridad. Piccolo le dice a Goku que seguro que le hace ilusión saber que los otros dos saiyajin son muchísimo más fuerte que Raditz, aunque a Goku tampoco le gusta saber esto. Seguidamente Goku le pregunta a su hermano mayor que donde está Son Gohan, quien le responde que lo encerró en su nave porque lloraba mucho. Después Goku y Piccolo se deciden a iniciar el ataque, pero Raditz puede con ellos fácilmente, ambos con su velocidad se ponen detrás de su oponente para realizar un ataque por la espalda, pero Raditz que es mucho más rápido, incluso con toda tranquilidad y sin esforzarse al máximo. Luego esquiva el golpe de ambos saltando a gran altura, donde le siguen hasta donde está realizando un ataque doble de energía el cual, Goku consiguió esquivar por muy poco, sin embargo Piccolo pierde un brazo. Goku consigue levantarse del suelo para luego recibe una fuerte patada de Raditz que lo deja de nuevo en el suelo, pero agotado se vuelve a levantar quien le pregunta a Piccolo si está bien, y éste le responde que puede pelear incluso con un solo brazo, mientras Raditz se ríe de ellos, dejando que se expriman la cabeza pensando que hacer.",
        //            imageURL: "/images/piccolo_goku.jpg",
        //            protagonistID: try piccolo.requireID()
        //        )
        //
        //        let episode199 = Episode(
        //            episodeNumber: 199,
        //            title: "El Sacrificio de Goku",
        //            airedAt: Date(),
        //            summary: "Goku ahora tiene que enfrentarse solo a Raditz mientras Piccolo acumula energía para realizar su técnica secreta, Goku ataca decidido, pero su oponente es muy superior a él, quien le da una buena paliza, pero Goku consigue resistir, luego Raditz queda asombrado por como su hermano concentra en un solo punto toda su energía y aumentarla de 416 a 924, después ve como Piccolo hace lo mismo de 408 a 1.030... y sigue aumentándola. Goku le lanza el KameHameHa y Raditz lo intenta esquivar, pero le sigue a donde vaya, por eso lo para sin mucha dificultad con una sola mano, dejando a su hermano pequeño asombrado, para luego mandarle un ataque de energía que deja en el suelo a Goku.\n\nRaditz le va a dar el golpe final pero Piccolo ya tiene preparado el Makankosappo con una fuerza de 1.330, en primer lugar intenta pararla, pero la esquiva y solo se hace una pequeña herida en el hombro rompiendo su armadura. Este admite que si le llega a dar lo deja fuera de combate, y Piccolo piensa que todo está perdido. Se ha acabado el juego, Raditz iba a matar a Piccolo, pero Goku se levanta y le agarra la cola haciéndole perder parte de su poder, pero este le engaña para que lo suelte y Goku cae en su trampa, luego se levanta y le da un fuerte codazo con el que Goku cae a el suelo para luego torturarlo pisándole el pecho diciéndole que no sirve como guerrero espacial. Mientras Raditz le dice a Piccolo que vuelva a utilizar el Makankosappo, pero éste sabe que lo volvería a esquivar mientras torturaba a su hermano menor.",
        //            imageURL: "/images/raditz_vs_goku.jpg",
        //            protagonistID: try raditz.requireID()
        //        )
        //
        //        await withThrowingTaskGroup(of: Void.self) { taskGroup in
        //            [episode195, episode196, episode197, episode198, episode199].forEach { model in
        //                taskGroup.addTask {
        //                    try await model.create(on: database)
        //                }
        //            }
        //        }
        //
        //        try await episode195.$characters.attach([chiChi, goku, freezer, raditz, gohan, piccolo], on: database)
        //        try await episode196.$characters.attach([piccolo], on: database)
        //        try await episode197.$characters.attach([freezer, raditz, gohan, piccolo], on: database)
        //        try await episode198.$characters.attach([freezer, raditz, gohan], on: database)
        //        try await episode199.$characters.attach([raditz, gohan], on: database)
        //    }
    // Borra lo que hay en la tabla!
    func revert(on database: any Database) async throws {
        try await Hero.query(on: database).delete()
    }
        
   
}

