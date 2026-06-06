-- ============================================================
-- Codex of Azeroth :: Factions (Facciones)
-- ============================================================
-- Base de datos de facciones, razas y organizaciones importantes.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local function AddFaction(entry)
    entry.category = "factions"
    if CoA.Database and CoA.Database.AddEntry then
        CoA.Database:AddEntry(entry)
    end
end

-- ============================================================
-- HORDA
-- ============================================================
AddFaction {
    id          = "horda",
    name        = "La Horda",
    title       = "Coalición de las razas libres",
    faction     = "Horda",
    location    = "Múltiple (capital: Orgrimmar)",
    summary     = "Coalición de razas unidas originalmente por Thrall. Engloba orcos, trols, tauren, no-muertos, elfos de la sangre, goblins y pandaren.",
    description = "La Horda fue originalmente una alianza de clanes orcos reunidos bajo el yugo demoníaco de la Legión Ardiente. Tras la liberación de Thrall, se convirtió en una coalición de razas que buscaban un hogar en Azeroth. Hoy incluye a los orcos, los trols Lanza Negra, los tauren, los Renegados (antiguamente parte de la Horda, ahora independientes), los elfos de la sangre, los goblins del Cártel Bonvapor y los pandaren del Lotus Blanco. Aunque la Horda y la Alianza han sido aliadas en momentos clave (como en la lucha contra la Legión), las tensiones entre las dos facciones han provocado tres grandes guerras. Su cultura es más guerrera que la Alianza, pero también más diversa y tolerante con las diferencias raciales. El liderazgo ha sido tradicionalmente el cargo de Jefe de Guerra, aunque tras la Cuarta Guerra y la crisis de las Almas, ambos bandos están en una paz incómoda.",
    tags        = {"faccion", "horda", "thrall", "coalición", "orcos", "orgrimmar"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"thrall", "orgrimmar", "voljin", "sylvanas", "garrosh", "alianza"},
    sources     = {
        "Warcraft: Orcs & Humans (1994)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- ALIANZA
-- ============================================================
AddFaction {
    id          = "alianza",
    name        = "La Alianza",
    title       = "Coalición de las razas unidas de Azeroth",
    faction     = "Alianza",
    location    = "Múltiple (capital: Ventormenta)",
    summary     = "Coalición de razas fundada para detener la Horda. Engloba humanos, enanos, elfos de la noche, gnomos, draenei, worgen, pandaren y elfos del vacío.",
    description = "La Alianza fue fundada durante la Segunda Guerra, cuando las naciones humanas de Lordaeron se unieron para hacer frente a la amenaza orca. Originalmente incluía humanos, enanos de Ironforge, elfos de Quel'Thalas y gnomos de Gnomeregan. Tras la Tercera Guerra, muchos elfos de la noche y draenei se unieron a la Alianza. En Cataclysm se sumó el reino de Gilneas (worgen) y los pandaren del Acuerdo Tushui. Su capital tradicional es Ventormenta, pero tiene muchas ciudades-estado importantes como Ironforge, Darnassus (en ruinas) y la Exodar. La Alianza se caracteriza por su estructura más formal, con un rey (Anduin Wrynn) y un consejo de líderes raciales. Aunque a menudo se le critica por su rigidez y elitismo, ha demostrado ser una fuerza indispensable contra amenazas como la Plaga, la Legión y la Cuarta Guerra.",
    tags        = {"faccion", "alianza", "anadas", "ventormenta", "humanos", "enanos"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"anduin", "ventormenta", "varian", "jaina", "horda"},
    sources     = {
        "Warcraft II: Tides of Darkness (1995)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- KIRIN TOR
-- ============================================================
AddFaction {
    id          = "kirin_tor",
    name        = "El Kirin Tor",
    title       = "La orden de magos de Dalaran",
    faction     = "Neutral",
    location    = "Dalaran",
    summary     = "La orden de magos más poderosa de Azeroth, con sede en Dalaran. Gobierna la ciudad de la magia.",
    description = "El Kirin Tor es la orden de magos más antigua y poderosa de Azeroth, fundada hace más de 2.000 años. Su sede es la ciudad flotante de Dalaran, aunque también tiene representación en todas las naciones que usan magia arcana. Entre sus miembros más famosos están Antonidas (mentor de Jaina), Rhonin (que murió defendiendo la Cumbre del Trueno), Khadgar (discípulo de Medivh) y la propia Jaina Valiente. Históricamente, el Kirin Tor se mantuvo neutral en los conflictos entre Horda y Alianza, aunque en Wrath of the Lich King se vio obligado a intervenir para detener a la Plaga. El Kirin Tor también custodia poderosos artefactos mágicos, incluyendo el Ojo de Sargeras, que custodia en secreto desde hace siglos. Tras la caída de Dalaran en Legion, el Kirin Tor se ha reorganizado bajo la dirección de Khadgar y la Archimaga Modera.",
    tags        = {"faccion", "magos", "dalaran", "neutral", "antiguos", "kirin tor"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA"},
    related     = {"dalaran", "khadgar", "jaina", "rhonin", "antonidas", "modera"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- MANO DE PLATA
-- ============================================================
AddFaction {
    id          = "mano_de_plata",
    name        = "La Mano de Plata",
    title       = "La orden de los paladines",
    faction     = "Alianza (originalmente)",
    location    = "Múltiple",
    summary     = "La orden original de paladines de la Luz, fundada por el profeta para detener la Plaga. Casi desapareció tras la Tercera Guerra.",
    description = "La Mano de Plata fue fundada hace unos 20 años, cuando el profeta vio la llegada de la Plaga y convocó a los mejores caballeros de la Alianza para combatirlos. Con la ayuda del padre Malory, los caballeros fueron bendecidos con la Luz y se convirtieron en los primeros paladines. La orden contaba entre sus filas con figuras legendarias como Uther el Iluminado, Arthas Menethil, Tirion Vadín, Turalyon y Saidan Dathrohan. La caída de Lordaeron y la traición de Arthas destruyeron la orden, pero Tirion la reconstruyó para liderar la Ofensiva de la Luz contra el Rey Exánime. Hoy, la Mano de Plata ha evolucionado hacia la Cruzada Argenta, que incluye a los Caballeros de la Espada de Ébano (no-muertos paladines) y a los Hijos de la Luz. Sus principios siguen siendo la defensa de los inocentes y la lucha contra las fuerzas de la oscuridad.",
    tags        = {"faccion", "paladines", "luz", "orden", "uthuin", "tirion"},
    expansions  = {"Vanilla", "TBC", "WotLK"},
    related     = {"uther", "tirion", "arthas", "luz", "cruzada_argenta"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- CENARION
-- ============================================================
AddFaction {
    id          = "cenarion",
    name        = "Los Cenarion",
    title       = "La orden de los druidas de Azeroth",
    faction     = "Neutral",
    location    = "Monte Hyjal / Refugi de la Cima del Trueno (Cima del Trueno)",
    summary     = "La orden druídica fundada por Cenarius, dedicada a la protección de la naturaleza. Incluye a Malfurion, Hamuul Totem de Runa y los Cenarion tauren.",
    description = "Los Cenarion son la orden druídica más antigua de Azeroth, fundada por el semidiós Cenarius hace más de 10.000 años. Su propósito es proteger el equilibrio natural del mundo y custodiar los lugares sagrados como el Monte Hyjal. La orden estuvo al mando de Malfurion Tempestad durante milenios, pero tras la marcha de los Aspectos Dragón, pasó a ser liderada por Hamuul Totem de Runa entre los tauren, junto con el elfo de la noche Remulos. Los Cenarion también incluyen a los Cenarion tauren, los druidas Cenarion y los Guardabosques Cenarion, cada uno especializado en un aspecto diferente de la naturaleza. La orden fue devastada por la Crisis del Sueño Esmeralda, en la que Xavius intentó corromper el Sueño. Tras la derrota de Xavius, los Cenarion trabajan en la restauración del mundo tras la Catástrofe y la nueva lucha contra las fuerzas del Vacío.",
    tags        = {"faccion", "druidas", "naturaleza", "cenarius", "malfurion", "tauren"},
    expansions  = {"Vanilla", "Cata", "MoP", "Legion"},
    related     = {"cenarius", "malfurion", "hamuul", "sueño_esmeralda", "remulos"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
        "Novela: Stormrage (2010)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- VUELO DRAGÓN
-- ============================================================
AddFaction {
    id          = "vuelo_dragon",
    name        = "Los Vuelos Dragón",
    title       = "Los cinco Aspectos y sus descendientes",
    faction     = "Neutral",
    location    = "Múltiple (Antorus, Nido del Dragón Rojo, etc.)",
    summary     = "Los cinco Vuelos Dragón (Rojo, Azul, Verde, Negro, Bronce) y sus Aspectos. Encabezaron la lucha contra la Legión durante milenios.",
    description = "Los Vuelos Dragón son cinco razas de dragones inteligentes, encabezadas por sus respectivos Aspectos: Alexstrasza (Vuelo Rojo, Vida), Nozdormu (Vuelo Bronce, Tiempo), Malygos (Vuelo Azul, Magia), Ysera (Vuelo Verde, Naturaleza) y Neltharion (Vuelo Negro, Tierra). Los dragones fueron creados por los Titanes para proteger Azeroth. Durante la Guerra de los Ancestros y la Catástrofe, los Aspectos perdieron gran parte de su poder, hasta que en la crisis de los Almas transfirieron sus poderes a las Almacenes de Azeroth. Hoy, los Vuelos siguen activos, pero sus Aspectos han perdido su divinidad. Los Vuelos están fragmentados y buscan un nuevo propósito. Algunos dragones, como Sabia, han abrazado nuevas formas. El Vuelo Negro ha sido el más conflictivo, ya que Deathwing corrompió a muchos de sus miembros durante la Catástrofe.",
    tags        = {"faccion", "dragones", "aspectos", "titanes", "neutral", "vuelo"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "DF"},
    related     = {"alexstrasza", "nozdormu", "ysera", "malygos", "deathwing", "titanes"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- LEGIÓN ARDIENTE
-- ============================================================
AddFaction {
    id          = "legion_ardiente",
    name        = "La Legión Ardiente",
    title       = "El ejército demoníaco de Sargeras",
    faction     = "Antagonista",
    location    = "El Vacío Abisal (Twisting Nether)",
    summary     = "El ejército demoníaco liderado por Sargeras, dedicado a destruir toda la vida en el universo. Antagonista principal de WoW.",
    description = "La Legión Ardiente es un ejército infinito de demonios liderado por el Titán Oscuro Sargeras, cuyo único propósito es consumir toda la vida del universo en su nombre. La Legión ha intentado invadir Azeroth en múltiples ocasiones: la Guerra de los Ancestros (hace 10.000 años), la Tercera Guerra (cuando Archimonde atacó el Monte Hyjal) y la invasión de Legion (cuando la Legión volvió en masa). Sus rangos incluyen a los temibles Señores del Terror como Archimonde y Kil'jaeden, a las diabólicas sucubos y a incontables demonios menores. Sargeras fue en su día un Titán noble, pero la corrupción lo transformó. Aunque fue derrotado en Legion, los demonios siguen siendo una amenaza latente. La Legión dejó tras de sí un legado de destrucción, pero también héroes que se alzaron para detenerla, como Illidan Tempestira, que finalmente alcanzó la paz eterna como Guardián de la Legión.",
    tags        = {"faccion", "demonios", "legion", "sargeras", "antagonista", "archimonde"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA"},
    related     = {"sargeras", "archimonde", "kriljaden", "illidan", "titanes"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft: The Burning Crusade (2007)",
        "World of Warcraft: Legion (2016)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- TITANES
-- ============================================================
AddFaction {
    id          = "titanes",
    name        = "Los Titanes",
    title       = "Los creadores del orden",
    faction     = "Neutral / Cósmico",
    location    = "Múltiple (Ulduar, Antigua Azeroth)",
    summary     = "Seres cósmicos que crearon y ordenaron los mundos. Encabezaron la lucha contra los Dioses Antiguos hace eones.",
    description = "Los Titanes son seres cósmicos de energía pura, creados para traer orden al universo. Hace millones de años, un grupo de Titanes llegó a Azeroth para ordenar el mundo, que estaba siendo corrompido por los Dioses Antiguos. Liderados por Aman'Thul, derrotaron a los Dioses Antiguos y los enterraron bajo la tierra. Luego ordenaron Azeroth, creando las máquinas de titan, los Vuelos Dragón, y despertando a los hijos de los Titanes, los Titanes del Vigía. La historia de Azeroth está íntimamente ligada a los Titanes, que dejaron tras de sí un sinfín de artefactos y estructuras (Ulduar, Uldum, los Jardines de la Luna, etc.). Sargeras, uno de los Titanes originales, se corrompió y se convirtió en el Titán Oscuro, fundador de la Legión Ardiente. Hoy, los Titanes son venerados por algunas razas y desconocidos para otras, aunque su influencia se siente en cada rincón de Azeroth.",
    tags        = {"faccion", "titanes", "orden", "creadores", "cosmica", "sargeras"},
    expansions  = {"WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "DF"},
    related     = {"sargeras", "aman_thul", "dioses_antiguos", "vuelo_dragon", "ulduar"},
    sources     = {
        "World of Warcraft: Wrath of the Lich King (2008)",
        "World of Warcraft: Legion (2016)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- DRENEI
-- ============================================================
AddFaction {
    id          = "draenei",
    name        = "Los Draenei",
    title       = "Los exiliados de Argus",
    faction     = "Alianza",
    location    = "Exodar (Isla de Bruma Azur)",
    summary     = "Los descendientes de los eredar que se opusieron a Sargeras. Huyeron a Azeroth tras la destrucción de su mundo.",
    description = "Los draenei son una antigua raza de seres parecidos a los elfos, con pezuñas y cuernos. Hace 25.000 años, los eredar de Argus eran una raza avanzada bajo el liderazgo de Velen, Archimonde y Kil'jaeden. Sargeras les ofreció poder infinito a cambio de unirse a su Legión. Archimonde y Kil'jaeden aceptaron, pero Velen, guiado por una profecía de los naaru, se negó y huyó con sus seguidores. Durante milenios fueron perseguidos por los demonios, hasta que su nave, la Exodar, se estrelló en la Isla de Bruma Azur, frente a la costa de Kalimdor. Los draenei supervivientes se unieron a la Alianza y han luchado junto a ella desde entonces. Su capital es la propia Exodar, una nave-capilla naaru. El líder actual de los draenei es el Profeta Velen, aunque también hay otros líderes notables como Yrel, que fundó la Resistencia de Draenor en la línea temporal alternativa.",
    tags        = {"faccion", "draenei", "exodar", "velen", "naaru", "argus"},
    expansions  = {"TBC", "WoD", "Legion"},
    related     = {"velen", "yrel", "exodar", "naaru", "khadgar", "terrallende"},
    sources     = {
        "World of Warcraft: The Burning Crusade (2007)",
        "World of Warcraft: Warlords of Draenor (2014)",
        "World of Warcraft: Legion (2016)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- RENEGADOS
-- ============================================================
AddFaction {
    id          = "renegados",
    name        = "Los Renegados",
    title       = "Antiguamente Los Forjados en la Plaga",
    faction     = "Independientes (originalmente Horda)",
    location    = "Entrañas (antigua capital)",
    summary     = "Los no-muertos liberados del Rey Exánime por Sylvanas. Originalmente parte de la Horda, ahora independientes.",
    description = "Los Renegados son los miembros de la Plaga que, tras la derrota y caída del Rey Exánime, fueron liberados de su control. Sylvanas Brisaviento, su líder fundadora, les dio propósito y estructura, y los guió a la Horda, donde encontraron aliados contra la amenaza de su antigua señora, la Plaga. Los Renegados tienen su sede en la Entrañas, una red de cavernas bajo las ruinas de Lordaeron. Han mantenido una relación tensa con otras razas, especialmente los elfos de la sangre (con quienes comparten pasado), y a menudo se les ve con desconfianza. Su número crece con cada nueva alma arrancada al Rey Exánime. Tras la Cuarta Guerra y la revelación de que Sylvanas trabajaba para el Calabozo de Zovaal, los Renegados se han separado de la Horda. Ahora luchan por sobrevivir, perseguidos tanto por la Alianza como por quienes los consideran abominaciones.",
    tags        = {"faccion", "no-muertos", "sylvanas", "plaga", "horghada", "independiente"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL"},
    related     = {"sylvanas", "rey_exanime", "entranas", "horda"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- CRUZADA ARGENTA
-- ============================================================
AddFaction {
    id          = "cruzada_argenta",
    name        = "La Cruzada Argenta",
    title       = "La orden de la Luz contra la Plaga",
    faction     = "Neutral / Múltiple",
    location    = "Capilla de la Esperanza de la Luz (Tierras de la Peste)",
    summary     = "La orden que reemplazó a la Mano de Plata. Incluye a los Hijos de la Luz, los Caballeros de la Espada de Ébano y los Veraces.",
    description = "La Cruzada Argenta se formó tras la caída de la Mano de Plata, uniendo a varios grupos de combatientes de la Luz. Sus filas incluyen: los Hijos de la Luz (originalmente una orden alternativa, ahora integrada), los Caballeros de la Espada de Ébano (no-muertos paladines liderados por Darion Mograine), los Veraces (una orden de paladines leales a Uther) y muchos otros. Su sede principal es la Capilla de la Esperanza de la Luz, construida sobre el suelo consagrado que detuvo el avance de la Plaga. La Cruzada Argenta fue crucial en la lucha contra el Rey Exánime y en la Batalla de la Capilla en la Cuarta Guerra. Tras la derrota de la Plaga y la muerte de Tirion, la orden ha luchado por mantener su relevancia en un mundo donde la Plaga ya no es la principal amenaza. Algunos miembros han caído en la oscuridad, mientras otros siguen siendo faros de esperanza.",
    tags        = {"faccion", "luz", "paladines", "cruzada", "plaga", "tirion"},
    expansions  = {"WotLK", "BfA", "SL"},
    related     = {"tirion", "darion", "rey_exanime", "luz", "mano_de_plata"},
    sources     = {
        "World of Warcraft: Wrath of the Lich King (2008)",
        "World of Warcraft: Battle for Azeroth (2018)",
    },
    icon        = "INV_Misc_QuestionMark",
}
