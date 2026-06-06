-- ============================================================
-- Codex of Azeroth :: NPCs (Personajes)
-- ============================================================
-- Base de datos de personajes importantes del lore de WoW.
-- Cada entrada se registra automáticamente en la base de datos.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

-- Helper local para registrar entradas
local function AddNPC(entry)
    entry.category = "npcs"
    if CoA.Database and CoA.Database.AddEntry then
        CoA.Database:AddEntry(entry)
    end
end

-- ============================================================
-- THRALL
-- ============================================================
AddNPC {
    id          = "thrall",
    name        = "Thrall",
    title       = "El Lobo Invernal · Gobernalotodo de Durotar",
    faction     = "Horda",
    race        = "Orco (Mag'har)",
    location    = "Isla del Trueno (Draenor antiguo)",
    summary     = "Líder visionario de la Horda, hijo de Durotan. Fue Jefe de Guerra y ahora es chamán supremo.",
    description = "Nacido bajo la sombra de la Montaña Roca Negra, Thrall es hijo del legendario Durotan y Draka, asesinado por Orgrim Doomhammer cuando aún era un bebé. Criado como esclavo por Aedelas Blackmoore bajo el nombre de Go'el, fue adiestrado como gladiador antes de escapar y descubrir su verdadera herencia. Reunió a los clanes orcos en el nuevo Durotar, fundó Orgrimmar y se convirtió en el primer Jefe de Guerra de la nueva Horda. Tras la Tercera Guerra renunció al manto en favor de Garrosh Grito Infernal, viajó a Terrallende para conocer a su padre y regresó para guiar a la Horda como chamán. Durante la invasión de la Legión y la crisis de Azeroth, fue una figura clave de reconciliación entre Horda y Alianza. Hoy reside en la Isla del Trueno, en un Azeroth paralelo donde el linaje Mag'har ha encontrado refugio.",
    tags        = {"jefe de guerra", "chaman", "orco", "líder horda", "warcraft iii", "fundador orgrimmar"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA"},
    related     = {"durotan", "orgrimmar", "garrosh", "guldan", "horda", "go_el", "jaina"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "Warcraft III: The Frozen Throne (2003)",
        "Novela: The Rise of the Horde (2006)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- JAINA PROUDMOORE
-- ============================================================
AddNPC {
    id          = "jaina",
    name        = "Jaina Valiente",
    title       = "Señora de Theramore · Ex Jefa de Guerra de la Alianza",
    faction     = "Alianza",
    race        = "Humana",
    location    = "Theramore (arruinada) / Kul Tiras",
    summary     = "La más poderosa maga humana viva, hija del almirante Daelin Valiente. Pasó de ser una idealista pacifista a una líder pragmática.",
    description = "Hija del almirante Daelin Valiente de Kul Tiras, Jaina descubrió su talento para la magia siendo una niña y fue alumna de Antonidas, el archimago de Dalaran. Su vida cambió cuando conoció a un joven orco llamado Thrall, con quien forjó una improbable amistad. Tras la Tercera Guerra, fundó Theramore como ciudad santuario para refugiados de ambas facciones. La destrucción de Theramore a manos de Garrosh Grito Infernal marcó su transformación: dejó atrás el idealismo pacifista y se convirtió en una líder implacable. Llevó a la Alianza a Kul Tiras para reunificar a su familia, y posteriormente dirigió la ofensiva final contra Zandalar. Como Jefa de Guerra de la Alianza en la Cuarta Guerra, fue una de las artífices de la victoria final sobre Sylvanas.",
    tags        = {"maga", "humana", "líder alianza", "theramore", "kul tiras", "jefa de guerra"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA"},
    related     = {"thrall", "theramore", "alemania", "antonidas", "arthas", "sylvanas", "garrosh"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
        "Novela: Rise of the Horde (2006)",
        "World of Warcraft: The Burning Crusade (2007)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- SYLVANAS BRISAVIENTO
-- ============================================================
AddNPC {
    id          = "sylvanas",
    name        = "Sylvanas Brisaviento",
    title       = "La Reina Alma en Pena · Antigua Jefa de Guerra de la Horda",
    faction     = "Horda (anterior) / Independiente",
    race        = "Elfa de la Noche (No-Muerto)",
    location    = "Lo que fue la Ciudad Subterránea · El Más Allá",
    summary     = "Jinete de la Reina Banu, luego ranger-general de Silvermoon, convertida en no-muerta por Arthas. Antigua Jefa de Guerra de la Horda.",
    description = "Sylvanas fue la mejor jinete de Quel'Thalas y ranger-general de Silvermoon bajo la dirección de Alleria Brisaviento. Arthas Menethil la corrompió durante la caída de Quel'Thalas, convirtiéndola en una banshee al servicio del Rey Exánime. Cuando se rebeló contra él, recuperó su propio cuerpo y fundó a los Renegados. Más tarde ganó la Jefatura de Guerra de la Horda tras la muerte de Vol'jin. Durante la Cuarta Guerra rompió el Muro de la Sombra entre los reinos de los vivos y los muertos, lo que llevó a una guerra civil en la Horda y a su derrota final. Según se reveló, actuó bajo la influencia del Calabozo de Zovaal. Su destino final la llevó al Más Allá, donde se convirtió en una nueva especie de acosadora del más allá.",
    tags        = {"no-muerto", "elfa de la noche", "líder horda", "jefa de guerra", "banshee", "ranger"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL"},
    related     = {"arthas", "varok", "voljin", "horda", "rey_exanime", "alleria", "quelthalas"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
        "Novela: Arthas: Rise of the Lich King (2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- ILLIDAN TEMPESTIRA
-- ============================================================
AddNPC {
    id          = "illidan",
    name        = "Illidan Tempestira",
    title       = "El Doble Agente · Señor del Terror",
    faction     = "Illidari (independiente)",
    race        = "Elfo de la Noche (Draenei)",
    location    = "El Ojo de Sargeras (Terrallende)",
    summary     = "Hermano gemelo de Malfurion, primer cazador de demonios. Amó a Tyrande en secreto durante milenios.",
    description = "Nacido hace 10.000 años, Illidan fue el gemelo de Malfurion Tempestad. Mientras Malfurion estudiaba druidismo bajo Cenarius, Illidan practicó magia arcana, lo que le valió el exilio. Durante la Guerra de los Ancestros fue crucial para crear el Pozo de la Eternidad y rechazar a la Legión Ardiente, pero Cenarius le arrancó los ojos como castigo por su sed de poder. Aceptó los ojos demoníacos que le ofreció Kil'jaeden a cambio de perseguir a la Legión. Arthas lo 'mató' en el Pico de la Nieve Eterna, pero su cuerpo fue recuperado por Kil'jaeden. En Terrallende, Illidan absorbió el poder del Ojo de Sargeras y creó los Illidari, su propia fuerza de cazadores de demonios. Su destino final lo enfrentó a la Guja de Gul'dan, sacrificándose para sellar el portal de la Legión. En la expansión Legion, regresó como el Guardián de la Legión, vindicado póstumamente.",
    tags        = {"elfo de la noche", "cazador de demonios", "hermano malfurion", "antihéroe", "tyrande"},
    expansions  = {"TBC", "Legion"},
    related     = {"malfurion", "tyrande", "cenarius", "arthas", "kriljaden", "xavius"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft: The Burning Crusade (2007)",
        "World of Warcraft: Legion (2016)",
        "Novela: Stormrage (2010)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- ARTHAS MENETHIL
-- ============================================================
AddNPC {
    id          = "arthas",
    name        = "Arthas Menethil",
    title       = "El Rey Exánime · Príncipe de Lordaeron",
    faction     = "Plaga (anterior) / Independiente",
    race        = "Humano (No-Muerto)",
    location    = "Pico de la Nieve Eterna (sellado)",
    summary     = "Príncipe de Lordaeron, paladín de la Mano de Plata que cayó en la oscuridad. Portador de la escarcha.",
    description = "Arthas fue el único hijo del rey Terenas Menethil y heredero de Lordaeron. Como joven paladín, estaba prometido a Jaina Valiente. Su caída comenzó en Stratholme, cuando decidió purgar la ciudad antes de que la plaga la convirtiera. Esa decisión marcó su descenso: tomó la espada maldita Agonía de Escarcha, viajó a Rasganorte y se fusionó con el Rey Exánime, Ner'zhul, matando a su propio padre. Como nuevo Rey Exánime, extendió la Plaga por Lordaeron y Quel'Thalas, mató a Sylvanas, e intentó invadir Terrallende. Su destino terminó en el Pico de la Nieve Eterna cuando Illidan le asestó el golpe final con la Guja de Gul'dan. Su espíritu fue liberado del Rey Exánime, pero la entidad completa resurgió con fuerza en Wrath of the Lich King.",
    tags        = {"paladín", "rey exánime", "lordaeron", "príncipe", "caída", "escarcha"},
    expansions  = {"Vanilla", "TBC", "WotLK"},
    related     = {"jaina", "illidan", "uthuin", "thrall", "sylvanas", "nerzhul", "rey_exanime"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
        "Novela: Arthas: Rise of the Lich King (2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- ANDUIN WRYNN
-- ============================================================
AddNPC {
    id          = "anduin",
    name        = "Anduin Wrynn",
    title       = "Rey de Ventormenta · El Niño Rey",
    faction     = "Alianza",
    race        = "Humano",
    location    = "Ventormenta",
    summary     = "Hijo de Varian Wrynn, pacifista por naturaleza, se convirtió en rey siendo muy joven. Es el actual líder de la Alianza.",
    description = "Anduin creció sin su padre, Varian Wrynn, quien estuvo ausente durante años. Educado por la sabia matriarca de los pandaren, fue un niño amable y reflexivo, muy diferente al guerrero que se esperaba de un rey. Cuando Varian murió defendiendo la ruptura del Muro de la Sombra, Anduin ascendió al trono con apenas 18 años. Inicialmente fue visto como un rey débil, pero demostró una inteligencia política y diplomática excepcional. Forjó una amistad improbable con la elfa de la noche Shandris, e incluso negoció con Sylvanas antes del estallido de la Cuarta Guerra. Tras la crisis de las Almas y la derrota de los Jailer, Anduin ha liderado la reconstrucción de la Alianza y la exploración de las Islas Dragón, donde descubrió un poder vinculado a la Luz y a la Llama de las Sombras. Continúa reinando desde Ventormenta en la actual era de The War Within.",
    tags        = {"humano", "rey", "ventormenta", "pacifista", "hijo varian", "alicia"},
    expansions  = {"Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"varian", "alicia", "ventormenta", "alemania", "shandris", "thrall"},
    sources     = {
        "World of Warcraft (2004-presente)",
        "Novela: The Shattering (2010)",
        "World of Warcraft: Battle for Azeroth (2018)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- ANDUIN WRYNN - Variante con título de Rey añadida (duplicado eliminado)
-- ============================================================
-- (La entrada anterior ya cubre la versión "Rey de Ventormenta")

-- ============================================================
-- VARIAN WRYNN
-- ============================================================
AddNPC {
    id          = "varian",
    name        = "Varian Wrynn",
    title       = "El Lobo de Ventormenta · Rey de Ventormenta",
    faction     = "Alianza",
    race        = "Humano",
    location    = "Ventormenta (fallecido)",
    summary     = "Padre de Anduin, fue secuestrado y dividido en dos versiones de sí mismo. Rey de la Alianza durante la Tercera Guerra y más allá.",
    description = "Varian perdió a su madre, Tiffin, cuando era niño, en un accidente causado por la turba enfurecida tras la crisis de la Piedra de Sombra. Cuando tenía 19 años, fue traicionado por la nobleza de Ventormenta y secuestrado por la Hermandad Defias. Un mago llamado Nagocio le plantó recuerdos falsos, pero los verdaderos recuerdos de su hijo Anduin le devolvieron su identidad. Durante años, fue dos personas: el gladiador 'Lo'Gosh' en Terrallende y el rey titiritero de Ventormenta. Tras la Tercera Guerra, lideró la Alianza con mano firme pero justa. Murió heroicamente durante la ruptura de Bolvar Fordragón en la Batalla de la Costa Quebrada, intentando detener a Sylvanas. Su sacrificio dejó a su hijo Anduin como rey.",
    tags        = {"humano", "rey", "ventormenta", "padre anduin", "gladiador", "logosh"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA"},
    related     = {"anduin", "jaina", "alemania", "ventormenta", "onnit"},
    sources     = {
        "World of Warcraft (2004-presente)",
        "Novela: The Shattering (2010)",
        "Cómic: World of Warcraft (2007-2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- VAROK SAUROS
-- ============================================================
AddNPC {
    id          = "varok",
    name        = "Varok Saurfang",
    title       = "El Mártir · Hijo de Broxigar",
    faction     = "Horda",
    race        = "Orco (Roca Negra)",
    location    = "Orgrimmar (memorial)",
    summary     = "Veterano de mil batallas, padre de Dranosh y figura clave de la Horda. Honró a Thrall y protegió a Anduin.",
    description = "Saurfang es el último hijo vivo de Broxigar, el orco que atravesó el Portal Oscuro con un hacha y logró hacer sangrar al titan Sargeras. Como casi todos los veteranos de la vieja Horda, fue corrompido por la sangre de Mannoroth, pero combatió en incontables guerras con honor. Su hijo Dranosh cayó en la defensa de la Capilla de la Esperanza de la Luz, momento que marcó a Saurfang profundamente. Durante la Cuarta Guerra, fue un líder veterano que despreciaba a Sylvanas y a su guerra sin honor. Se alió secretamente con Anduin Wrynn para un golpe de estado pacífico en Orgrimmar, pero fue traicionado por Sylvanas y ejecutado frente a la ciudad. Sus últimas palabras, 'No hay esperanza... sólo Saurfang', han quedado grabadas en la memoria de la Horda.",
    tags        = {"orco", "horda", "veterano", "padre dranosh", "mártir", "cuarta guerra"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "BfA", "SL"},
    related     = {"anduin", "sylvanas", "thrall", "horda", "dranosh", "garrosh"},
    sources     = {
        "World of Warcraft (2004-presente)",
        "World of Warcraft: Battle for Azeroth (2018)",
        "Cómic: World of Warcraft (2007-2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- MALFURION TEMPESTAD
-- ============================================================
AddNPC {
    id          = "malfurion",
    name        = "Malfurion Tempestad",
    title       = "El Archidruida · Primer druida",
    faction     = "Cenarion",
    race        = "Elfo de la Noche",
    location    = "Santuario de Malorne (Monte Hyjal)",
    summary     = "El primer druida de Azeroth, hermano gemelo de Illidan y amante de Tyrande. Líder de los druidas.",
    description = "Malfurion fue el primer mortal en aprender el druidismo de Cenarius durante la Guerra de los Ancestros, hace 10.000 años. Junto con su hermano Illidan y Tyrande Susurravientos, lideró la resistencia contra la Legión Ardiente durante la Invasión de la Plaga. Tras la victoria, se convirtió en el Archidruida de los Cenarion y cayó en el Sueño Esmeralda durante milenios. Regresó durante la Tercera Guerra para ayudar a los elfos de la noche a recuperar el Monte Hyjal. Su relación amorosa con Tyrande siempre fue complicada por la presencia de su hermano Illidan, lo que provocó un conflicto trágico en Terrallende. Durante la Catástrofe, trabajó junto al Aspecto Dragón Cenarion Alexstrasza y Ysera para sanar al mundo. Hoy sigue siendo una de las figuras más sabias de Azeroth, aunque el peso de los años empieza a notarse en él.",
    tags        = {"elfo de la noche", "druida", "cenarion", "hermano illidan", "tyrande", "sueño esmeralda"},
    expansions  = {"Vanilla", "Cata", "Legion"},
    related     = {"illidan", "tyrande", "cenarius", "ysera", "sueño_esmeralda"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
        "Novela: Stormrage (2010)",
        "World of Warcraft: Cataclysm (2010)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- TYRANDE SUSURRAVIENTOS
-- ============================================================
AddNPC {
    id          = "tyrande",
    name        = "Tyrande Susurravientos",
    title       = "Suma Sacerdotisa de Eluna · General de los Centinelas",
    faction     = "Alianza (Kaldorei)",
    race        = "Elfa de la Noche",
    location    = "Santuario de Eluna (Val'sharah)",
    summary     = "Líder de los Centinelas y suma sacerdotisa de Eluna. Esposa de Malfurion y antigua amada de Illidan.",
    description = "Tyrande ha sido la líder espiritual de los elfos de la noche durante milenios, como suma sacerdotisa del dios Eluna. Cuando la Legión Ardiente invadió durante la Guerra de los Ancestros, ella eligió a Malfurion sobre Illidan, una decisión que marcó la historia. Dirigió los Centinelas en la defensa de Ashenvale y en la reconquista del Monte Hyjal. Tras la Catástrofe, tomó la decisión radical de sellar los portales a los bosques y renunciar a la noche eterna. Ha sido una aliada clave de la Alianza en la guerra contra la Horda, en la lucha contra la Legión y en la crisis de las Almas. En la actual era de The War Within, sigue siendo una de las voces más respetadas entre los kaldorei, con la difícil tarea de guiar a su pueblo en un mundo cambiante.",
    tags        = {"elfa de la noche", "sacerdotisa", "centinelas", "esposa malfurion", "eluna", "kaldorei"},
    expansions  = {"Vanilla", "Cata", "MoP", "WoD", "Legion", "BfA", "DF", "TWW"},
    related     = {"malfurion", "illidan", "shandris", "kaldorei", "centinelas", "eluna"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
        "Novela: Stormrage (2010)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- GARROSH GRITO INFERNAL
-- ============================================================
AddNPC {
    id          = "garrosh",
    name        = "Garrosh Grito Infernal",
    title       = "Hijo de Grito Infernal · Ex Jefe de Guerra de la Horda",
    faction     = "Horda (anterior) / Mando de Hierro",
    race        = "Orco (Grito Infernal)",
    location    = "Línea temporal alternativa (WoD)",
    summary     = "Hijo de Grom Grito Infernal, fue Jefe de Guerra de la Horda y desencadenó la Cuarta Guerra. Viajó al Draenor alternativo.",
    description = "Garrosh creció a la sombra de la leyenda de su padre Grom Grito Infernal, que liberó a los orcos de la corrupción demoníaca. Cuando Grom murió luchando contra Mannoroth, Garrosh fue enviado a Nagrand por su madre, donde pasó una infancia idílica. Al llegar a Orgrimmar, Thrall lo nombró sucesor como Jefe de Guerra. Bajo el peso de la responsabilidad y la bebida, Garrosh se convirtió en un líder cada vez más agresivo y paranoico. Destruyó Theramore con la bomba de maná, abrió las fosas de Terrallende y terminó provocando la Cuarta Guerra. Derrotado por una coalición de Horda y Alianza, logró escapar a un Draenor paralelo a través del portal de las fosas. En esa línea temporal fundó el Mando de Hierro y casi destruye a los draenei antes de ser ejecutado por Thrall en combate singular.",
    tags        = {"orco", "horda", "jefe de guerra", "hijo grom", "mando de hierro", "villano"},
    expansions  = {"Cata", "MoP", "WoD"},
    related     = {"thrall", "varok", "jaina", "grom", "theramore", "horda"},
    sources     = {
        "World of Warcraft: Cataclysm (2010)",
        "World of Warcraft: Mists of Pandaria (2012)",
        "World of Warcraft: Warlords of Draenor (2014)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- UTHER EL ILUMINADO
-- ============================================================
AddNPC {
    id          = "uther",
    name        = "Uther el Iluminado",
    title       = "Primer Paladín · Caballero de la Mano de Plata",
    faction     = "Alianza (Mano de Plata)",
    race        = "Humano",
    location    = "Tumba de Uther (Tierras de la Peste del Oeste)",
    summary     = "El primer paladín humano, mentor y amigo de Arthas. Murió a manos de su propio pupilo. Su tumba es sagrada.",
    description = "Uther fue el primer humano en recibir los poderes de la Luz después del que el profeta tuvo la visión que marcó el inicio de la orden de la Mano de Plata. Fue mentor de Arthas Menethil, a quien quería como a un hijo. Cuando descubrió que Arthas tenía una relación con Jaina Valiente, lo desaprobó por ser impropio de un paladín. Su momento más trágico llegó en Andorhal, cuando se negó a levantar la espada Agonía de Escarcha del lago contaminado por la Plaga, desobedeciendo a Arthas. El joven príncipe, cegado por la sed de venganza, lo asesinó. Su tumba en las Tierras de la Peste del Oeste se convirtió en un punto de peregrinación para paladines, e incluso acogió un encuentro crucial de la Cuarta Guerra entre Varok Saurfang y Anduin Wrynn. Su espíritu ha aparecido en varias ocasiones para guiar a la Luz.",
    tags        = {"paladín", "humano", "mentor arthas", "luz", "mártir", "primera guerra"},
    expansions  = {"Vanilla", "TBC", "WotLK", "BfA"},
    related     = {"arthas", "jaina", "tirion", "luz", "mano_de_plata"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
        "Novela: Arthas: Rise of the Lich King (2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- VOL'JIN
-- ============================================================
AddNPC {
    id          = "voljin",
    name        = "Vol'jin",
    title       = "El Sombralumbre · Ex Jefe de Guerra de la Horda",
    faction     = "Horda",
    race        = "Trol (Lanza Negra)",
    location    = "Cementerio de los Lanza Negra (Zandalar)",
    summary     = "Joven rebelde trol que se convirtió en Jefe de Guerra. Murió protegiendo Orgrimmar de la Legión y nombró a Sylvanas sucesora.",
    description = "Vol'jin era el hijo del Sombralumbre, líder de los Lanza Negra, pero creció como un huérfano en las calles de Orgrimmar tras la muerte de su padre a manos de Zalazane. Tras una serie de aventuras, recuperó el bastón del Sombralumbre y lideró a su pueblo. En la Catástrofe, fue herido de muerte por una reliquia de los Zandalari, pero fue sanado por la profecía de Bwonsamdi, el loa de la muerte. Durante la invasión de la Legión, murió defendiendo Orgrimmar en el portal de la Tumba de Sargeras. Sus últimas palabras nombraron a Sylvanas Brisaviento como nueva Jefa de Guerra, una decisión que muchos vieron como una profecía malinterpretada o una influencia del Val'kyr oscuro. Su legado vive en Zandalar, donde su espíritu guía a su pueblo.",
    tags        = {"trol", "horda", "lanzanegra", "jefe de guerra", "sombralumbre", "bwonsamdi"},
    expansions  = {"Cata", "MoP", "WoD", "Legion"},
    related     = {"sylvanas", "thrall", "horda", "bwonsamdi", "lanzanegra", "zandalar"},
    sources     = {
        "World of Warcraft: Cataclysm (2010)",
        "World of Warcraft: Mists of Pandaria (2012)",
        "World of Warcraft: Legion (2016)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- DUROTAN
-- ============================================================
AddNPC {
    id          = "durotan",
    name        = "Durotan",
    title       = "Jefe del clan Lobo Temible · Padre de Thrall",
    faction     = "Clan Lobo Temible",
    race        = "Orco (Frostwolf)",
    location    = "Nagrand (Draenor alternativo)",
    summary     = "Líder noble del clan Lobo Temible, se negó a beber la sangre de Mannoroth y fue asesinado por ello. Padre de Thrall.",
    description = "Durotan fue el jefe del clan Lobo Temible durante la Primera Guerra. Junto con Orgrim Doomhammer, fue uno de los pocos líderes orcos que se negó a beber la sangre de Mannoroth, sabiendo que la corrupción demoníaca destruiría a su pueblo. Fue por esto que Gul'dan traicionó al clan, organizando su asesinato en una reunión nocturna. Su hijo Go'el, que no era más que un bebé, fue salvado por un humano llamado Aedelas Blackmoore, que lo crió como esclavo. Décadas después, ese bebé se convirtió en Thrall, el líder de la nueva Horda. En la línea temporal alternativa de Warlords of Draenor, el Durotan de ese universo sobrevivió, conoció a su hijo adulto y se convirtió en un aliado clave de la Resistencia de Draenor contra el Mando de Hierro.",
    tags        = {"orco", "lobo temible", "padre thrall", "noble", "primera guerra", "frostwolf"},
    expansions  = {"TBC", "WoD"},
    related     = {"thrall", "orgrim", "guldan", "mannoroth", "lobo_temible"},
    sources     = {
        "Warcraft: Orcs & Humans (1994)",
        "Warcraft III: Reign of Chaos (2002)",
        "Novela: The Rise of the Horde (2006)",
        "World of Warcraft: Warlords of Draenor (2014)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- TIRION VADÍN
-- ============================================================
AddNPC {
    id          = "tirion",
    name        = "Tirion Vadín",
    title       = "El Portador de la Luz · Señor de la Orden de la Mano de Plata",
    faction     = "Alianza (Mano de Plata)",
    race        = "Humano",
    location    = "Capilla de la Esperanza de la Luz (Tierras de la Peste)",
    summary     = "Líder de la Mano de Plata, portador del poderoso martillo Grito de Guerra. Liberó a Arthas de la escarcha.",
    description = "Tirion Vadín fue un caballero de la Mano de Plata que, tras perder a casi todos sus hombres en la Segunda Guerra, se retiró como granjero en una granja de la Peste del Oeste. La llegada de la Plaga y el descubrimiento de que sus tierras estaban contaminadas lo hicieron volver al combate. En una escena épica en la Capilla de la Esperanza de la Luz, recuperó el martillo Grito de Guerra del cuerpo de su hijo Taelan, que él mismo había ejecutado por caer en la oscuridad. Con su martillo, Tirion lideró la Ofensiva de la Luz y la Cruzada Argenta contra el Rey Exánime. En la cima del Pico de la Nieve Eterna, se enfrentó a Arthas, quien cayó en la derrota. Aunque Arthas intentó evitarlo, Tirion liberó al alma de su padre, Terenas, y luego ejecutó al Rey Exánime con el martillo.",
    tags        = {"paladín", "humano", "luz", "grito de guerra", "cruzada argenta", "arthas"},
    expansions  = {"TBC", "WotLK"},
    related     = {"uther", "arthas", "rey_exanime", "mano_de_plata", "grito_de_guerra"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
        "Novela: Arthas: Rise of the Lich King (2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}
