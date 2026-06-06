-- ============================================================
-- Codex of Azeroth :: Events (Eventos Históricos)
-- ============================================================
-- Base de datos de eventos importantes del lore de WoW.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local function AddEvent(entry)
    entry.category = "events"
    if CoA.Database and CoA.Database.AddEntry then
        CoA.Database:AddEntry(entry)
    end
end

-- ============================================================
-- GUERRA DE LOS ANCESTROS (hace 10.000 años)
-- ============================================================
AddEvent {
    id          = "guerra_de_los_ancestros",
    name        = "La Guerra de los Ancestros",
    title       = "La primera invasión de la Legión",
    faction     = "Múltiple",
    location    = "Kalimdor (mundo antiguo)",
    summary     = "Hace 10.000 años, la Legión Ardiente invadió Azeroth. Los elfos de la noche, liderados por Malfurion, finalmente rechazaron a la Legión, pero la explosión del Pozo de la Eternidad partió el mundo.",
    description = "La Guerra de los Ancestros fue el primer gran conflicto de Azeroth, hace 10.000 años. Sargeras abrió el Portal Oscuro y lideró a la Legión Ardiente a través del Pozo de la Eternidad, con el objetivo de destruir el Árbol del Mundo. La resistencia fue liderada por los elfos de la noche bajo el mando de Malfurion, Tyrande, Illidan y Cenarius. La guerra culminó con la explosión del Pozo de la Eternidad, que destruyó a Archimonde y partió el continente de Kalimdor en varios pedazos. El Pozo se transformó en un mar (el Mar de los Sudorosos), dejando sólo unas pocas islas. Los elfos supervivientes se dividieron en tres grupos: los que se quedaron en el nuevo mundo (elfos de la noche), los que navegaron a Lordaeron (elfos nobles/altos) y los que fueron transformados por la energía del Pozo (Sátiros y Naga). Este evento marca el fin de la Era Antigua y el comienzo de la historia moderna de Azeroth.",
    tags        = {"evento", "legion", "guerra", "antigua", "pozo de la eternidad", "elfos de la noche"},
    expansions  = {"Vanilla", "TBC", "Cata", "Legion"},
    related     = {"sargeras", "archimonde", "malfurion", "illidan", "tyrande", "cenarius", "pozo_eternidad"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- PRIMERA GUERRA
-- ============================================================
AddEvent {
    id          = "primera_guerra",
    name        = "La Primera Guerra",
    title       = "La invasión orca de Azeroth",
    faction     = "Horda original vs Humanos",
    location    = "Azeroth (Reino de Ventormenta)",
    summary     = "Los orcos de Draenor, dirigidos por Gul'dan y Blackhand, cruzaron el Portal Oscuro y conquistaron el Reino de Ventormenta. Primera guerra de la saga moderna.",
    description = "La Primera Guerra comenzó cuando Gul'dan y el hechicero Medivh (poseído por Sargeras) abrieron el Portal Oscuro desde Draenor hasta Azeroth. Los clanes orcos, corrompidos por la sangre de Mannoroth, invadieron el continente oriental a través de este portal. Aunque algunos clanes como los Lobo Temible se opusieron, la mayoría cayeron bajo el yugo demoníaco. El Reino de Ventormenta, gobernado por el rey Llane Wrynn, fue devastado en una campaña brutal. La guerra culminó con la traición de Orgrim Doomhammer a su líder Blackhand, la derrota de Ventormenta y la muerte de Llane a manos de Grom Grito Infernal. Lothar, un gran guerrero, juró venganza y unió a las naciones humanas en lo que se convertiría en la Alianza. Tras la Primera Guerra, la Horda se preparó para invadir Lordaeron, comenzando la Segunda Guerra. Blackrock Spire y la Cueva Blackrock fueron escenarios clave de esta guerra.",
    tags        = {"evento", "guerra", "orcos", "primera", "portal oscuro", "ventormenta"},
    expansions  = {"Vanilla", "TBC", "WoD"},
    related     = {"guldan", "blackhand", "orgrim", "llane", "lothar", "medivh", "llane"},
    sources     = {
        "Warcraft: Orcs & Humans (1994)",
        "Warcraft III: Reign of Chaos (2002)",
        "Novela: The Last Guardian (2002)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- SEGUNDA GUERRA
-- ============================================================
AddEvent {
    id          = "segunda_guerra",
    name        = "La Segunda Guerra",
    title       = "La Horda contra la Alianza de Lordaeron",
    faction     = "Horda vs Alianza (Lordaeron)",
    location    = "Azeroth (Lordaeron, Khaz Modan)",
    summary     = "Tras la Primera Guerra, la Horda invadió Lordaeron. Las naciones humanas y élficas se unieron en la Alianza para detenerlos.",
    description = "La Segunda Guerra fue el conflicto más grande de la historia reciente de Azeroth antes de la Tercera Guerra. Orgrim Doomhammer, ahora Jefe de Guerra de la Horda, lanzó una invasión a gran escala contra Lordaeron. Quemó las Tierras Altas de Arathi y amenazó las Tierras del Interior. Lothar, junto con el elfo Alleria Brisaviento, el enano Muradin Barbabronce y otros héroes, fundó la Alianza de Lordaeron para detener a la Horda. La guerra culminó con varias batallas épicas, incluyendo la caída de la Fortaleza de Nethergarde y la liberación de Ventormenta. El golpe final vino cuando los orcos se vieron afectados por una plaga que les hizo lethargicarse (un efecto secundario de la corrupción demoníaca). Doomhammer fue derrotado por Lothar, aunque Lothar murió en la batalla. Turalyon y Alleria lideraron la Ofensiva a través del Portal Oscuro hasta Draenor, donde destruyeron la base de la Horda. Esta guerra consolidó la estructura de la Alianza y la Horda que conocemos.",
    tags        = {"evento", "guerra", "horda", "alianza", "lordaeron", "portal oscuro"},
    expansions  = {"Vanilla", "TBC", "WoD"},
    related     = {"orgrim", "lothar", "turalyon", "alleria", "medivh", "llane"},
    sources     = {
        "Warcraft II: Tides of Darkness (1995)",
        "Warcraft II: Beyond the Dark Portal (1996)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- TERCERA GUERRA
-- ============================================================
AddEvent {
    id          = "tercera_guerra",
    name        = "La Tercera Guerra",
    title       = "La invasión de la Plaga y la Legión",
    faction     = "Múltiple (todos)",
    location    = "Lordaeron, Quel'Thalas, Kalimdor",
    summary     = "La Plaga del Rey Exánime y la Legión Ardiente atacaron Azeroth. La culminación de Warcraft III.",
    description = "La Tercera Guerra es el conflicto narrado en Warcraft III: Reign of Chaos y The Frozen Throne. La Plaga del Rey Exánime, dirigida por el Príncipe Arthas Menethil, devastó Lordaeron, mató al rey Terenas y corrompió a Arthas hasta convertirlo en el nuevo Rey Exánime. La Plaga cayó sobre Quel'Thalas, destruyendo Luna de Plata y creando a Sylvanas. La Legión Ardiente también invadió Kalimdor, buscando el Pozo de la Eternidad. Thrall, Grom y los orcos rechazaron la corrupción de Mannoroth. Jaina y Thrall se unieron para detener a Archimonde en el Monte Hyjal, donde la explosión del árbol del mundo lo destruyó. Turalyon y Alleria continuaron luchando. La crisis llevó a la creación de las Islas Quebradas, la caída de Lordaeron, y al nacimiento de varias facciones (Renegados, Horda moderna). Es el conflicto que establece la línea temporal de World of Warcraft.",
    tags        = {"evento", "guerra", "plaga", "legion", "rey exánime", "arthas"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata"},
    related     = {"arthas", "jaina", "thrall", "sylvanas", "illidan", "rey_exanime", "terenas"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "Warcraft III: The Frozen Throne (2003)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- INVASIÓN DE LA LEGIÓN (Burning Crusade)
-- ============================================================
AddEvent {
    id          = "invasion_legion",
    name        = "Invasión de la Legión Ardiente",
    title       = "La tercera invasión de la Legión",
    faction     = "Múltiple vs Legión",
    location    = "Terrallende, Monte Hyjal, Rasganorte",
    summary     = "La Legión Ardiente lanzó una invasión a gran escala de Azeroth, atacando el Monte Hyjal y enviando a Illidan a Terrallende. Escenario de World of Warcraft: Legion.",
    description = "La Invasión de la Legión fue el conflicto central de la expansión Legion (2016). Tras años de aparente calma, Illidan Tempestira, resucitado por Khadgar y Maiev, abrió un portal desde la Tumba de Sargeras hasta Azeroth para traer a Gul'dan de vuelta. La Legión comenzó a invadir múltiples puntos: el Monte Hyjal, las Islas Quebradas, Suramar y Val'sharah. La respuesta de Azeroth fue la formación de la Orden de las Mil Alas, una coalición de las fuerzas más poderosas del mundo. Héroes de todas las razas se unieron para detener a Gul'dan, incluyendo a Khadgar, Illidan, Velen, Tyrande, Malfurion y muchos otros. La campaña culminó con la invasión de Argus, el mundo natal de los eredar, y el enfrentamiento final con Sargeras en la Tumba de Sargeras, donde Illidan le asestó el golpe final. Tras la derrota de la Legión, los Vuelos Dragón transfirieron sus poderes para sellar la herida del planeta.",
    tags        = {"evento", "legion", "invasión", "sargeras", "illidan", "argus"},
    expansions  = {"Legion"},
    related     = {"illidan", "khadgar", "sargeras", "velen", "guldan", "titanes"},
    sources     = {
        "World of Warcraft: Legion (2016)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- CUARTA GUERRA
-- ============================================================
AddEvent {
    id          = "cuarta_guerra",
    name        = "La Cuarta Guerra",
    title       = "Horda y Alianza en conflicto por Azerite",
    faction     = "Horda vs Alianza",
    location    = "Múltiple (Zandalar, Kul Tiras, Silithus)",
    summary     = "Guerra total entre Horda y Alianza desatada por Sylvanas. Escenario central de Battle for Azeroth.",
    description = "La Cuarta Guerra fue el conflicto principal de la expansión Battle for Azeroth (2018). Tras la muerte de Vol'jin y el ascenso de Sylvanas a Jefa de Guerra, la Horda incendió Teldrassil (el Árbol del Mundo) en una brutal sorpresa. La Alianza respondió invadiendo Zandalar y los trolls Zandalari. La guerra se extendió por múltiples frentes: Kul Tiras se unió a la Alianza, los Zandalari a la Horda, y Azerite (un nuevo mineral) se convirtió en el centro del conflicto. Héroes como Jaina, Anduin, Saurfang y Nathanos fueron clave. Varok Saurfang intentó una paz negociada con Anduin, pero fue traicionado por Sylvanas y ejecutado. La guerra culminó con la revelación de que Sylvanas servía al Calabozo de Zovaal, el señor del Más Allá. La paz fue firmada entre Horda y Alianza para detener la verdadera amenaza, pero dejó cicatrices profundas en ambas facciones.",
    tags        = {"evento", "guerra", "cuarta", "sylvanas", "azerite", "horda", "alianza"},
    expansions  = {"BfA", "SL"},
    related     = {"sylvanas", "anduin", "varok", "jaina", "garrosh", "voljin"},
    sources     = {
        "World of Warcraft: Battle for Azeroth (2018)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- CRISIS DE LAS ALMAS (Shadowlands)
-- ============================================================
AddEvent {
    id          = "crisis_almas",
    name        = "La Crisis de las Almas",
    title       = "La ruptura del Muro de la Sombra",
    faction     = "Múltiple",
    location    = "Más Allá (Shadowlands)",
    summary     = "El Muro de la Sombra se rompió, revelando el reino de la muerte. La batalla final contra el Calabozo de Zovaal.",
    description = "La Crisis de las Almas fue el conflicto central de la expansión Shadowlands (2020). Tras la Cuarta Guerra, Sylvanas rompió el Muro de la Sombra entre los reinos de los vivos y los muertos, revelando el Más Allá. Este reino está gobernado por los kyrianos eternos y dividido en cinco zonas (Bastión, Maldraxxus, Ardenweald, Revendreth y La Ciénaga). Sylvanas trabajó para el Calabozo de Zovaal, el carcelero de los kyrianos, que quería reescribir las reglas de la muerte. Héroes de Azeroth viajaron al Más Allá para detenerlo, incluyendo a Bolvar Fordragón (que se convirtió en el nuevo Aspecto del Vuelo Negro tras la Catástrofe). La crisis culminó con el enfrentamiento final en la Prisión de Zovaal, donde los jugadores derrotaron al Carcelero. Tras la crisis, se restauró el orden natural de la muerte, aunque la confianza entre Horda y Alianza quedó seriamente dañada.",
    tags        = {"evento", "shadowlands", "almas", "sylvanas", "zovaal", "carcelero"},
    expansions  = {"SL"},
    related     = {"sylvanas", "bolvar", "anduin", "jaina", "thrall"},
    sources     = {
        "World of Warcraft: Shadowlands (2020)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- LA CATÁSTROFE
-- ============================================================
AddEvent {
    id          = "catastrofe",
    name        = "La Catástrofe",
    title       = "El regreso de Alamuerte",
    faction     = "Múltiple",
    location    = "Azeroth (global)",
    summary     = "Deathwing (Alamuerte) emergió del Inframundo y causó la fractura del mundo, separando a los continentes.",
    description = "La Catástrofe fue el evento central de la expansión Cataclysm (2010). El Vuelo Negro, encabezado por Deathwing, había pasado 10.000 años en el Inframundo alimentándose de los elementos. Cuando regresó, la lucha final con Neltharion, la Aspecto de la Tierra, terminó con su transformación en una criatura imparable: un dragón con armadura de placas de adamantium. Su emergencia provocó el Evento Sísmico, que fracturó Azeroth, separó los continentes, sumergió parte de Azshara bajo el mar, y arrasó muchas zonas. La muerte del aspecto dragón Alexstrasza en las Tierras del Fuego, y el esfuerzo de Thrall, los Aspectos, y los héroes de Azeroth, culminó con la derrota de Deathwing en el Foso de Alma Draenei. La Catástrofe también marcó el regreso de la Alianza Goblin, y el inicio de las hostilidades de los elfos de la noche contra la Horda, así como la guerra entre la Horda y la Alianza por el control de nuevos territorios.",
    tags        = {"evento", "catástrofe", "deathwing", "alamuerte", "dragón", "tierra"},
    expansions  = {"Cata"},
    related     = {"deathwing", "neltharion", "thrall", "alexstrasza", "vuelo_dragon", "titanes"},
    sources     = {
        "World of Warcraft: Cataclysm (2010)",
    },
    icon        = "INV_Misc_QuestionMark",
}
