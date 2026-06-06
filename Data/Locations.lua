-- ============================================================
-- Codex of Azeroth :: Locations (Lugares)
-- ============================================================
-- Base de datos de lugares, regiones y capitales importantes.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local function AddLocation(entry)
    entry.category = "locations"
    if CoA.Database and CoA.Database.AddEntry then
        CoA.Database:AddEntry(entry)
    end
end

-- ============================================================
-- ORGRIMMAR
-- ============================================================
AddLocation {
    id          = "orgrimmar",
    name        = "Orgrimmar",
    title       = "Capital de la Horda",
    faction     = "Horda",
    location    = "Durotar (Kalimdor)",
    summary     = "La capital de la Horda, fundada por Thrall en honor a Orgrim Doomhammer. Construida en una serie de valles en Durotar.",
    description = "Orgrimmar fue fundada por Thrall poco después de la Tercera Guerra, en honor a su mentor Orgrim Doomhammer, quien lo liberó de la esclavitud. La ciudad está construida en una serie de valles y riscos dentro de la región de Durotar, en el continente de Kalimdor. Su diseño se inspira en las fortalezas orcas tradicionales, con empalizadas, tambores de guerra y el fuerte de Grommash en el centro, donde se llevan a cabo las ceremonias y reuniones más importantes. La capital ha sido testigo de momentos decisivos: la coronación de Garrosh como Jefe de Guerra, la revuelta de los Renegados, la guerra civil de la Cuarta Guerra y la llegada de los Mag'har de la línea temporal alternativa. Hoy, Orgrimmar es una ciudad vibrante donde conviven orcos, trols, tauren, no-muertos, elfos de la sangre y gnomos.",
    tags        = {"capital", "horda", "orco", "thrall", "kalimdor", "durotar"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"thrall", "durotar", "horda", "grommash", "kalimdor"},
    sources     = {
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- VENTORMENTA
-- ============================================================
AddLocation {
    id          = "ventormenta",
    name        = "Ventormenta",
    title       = "Capital de la Alianza",
    faction     = "Alianza",
    location    = "Bosque de Elwynn (Azeroth Oriental)",
    summary     = "La capital del reino humano, reconstruida sobre las ruinas de la fortaleza de los enanos. Centro de la Alianza.",
    description = "Ventormenta, también conocida como la Ciudad Alta, fue originalmente una fortaleza enana llamada Khaz Modan, hasta que los humanos la tomaron durante la Primera Guerra. Tras la caída de Lordaeron, se convirtió en el último bastión de la Alianza, liderada por Varian Wrynn. La ciudad está dividida en tres distritos principales: la Ciudad Alta (nobleza y comercio), el Casco Antiguo (refugio de la Hermandad Defias) y el Puerto de Ventormenta. Su fortaleza, el Castillo de Ventormenta, alberga al trono real donde actualmente reina Anduin Wrynn. La ciudad ha sido atacada en múltiples ocasiones: por la Plaga, por la Horda, e incluso por un dragón rojo. Hoy, Ventormenta es una metrópolis próspera y un símbolo de la resistencia humana.",
    tags        = {"capital", "alianza", "humano", "anadas", "anduin", "reino"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"anduin", "varian", "alemania", "alianza", "llamas"},
    sources     = {
        "Warcraft: Orcs & Humans (1994)",
        "Warcraft II: Tides of Darkness (1995)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- DALARAN
-- ============================================================
AddLocation {
    id          = "dalaran",
    name        = "Dalaran",
    title       = "La Ciudad de la Magia",
    faction     = "Neutral (Kirin Tor)",
    location    = "Flotante sobre las Islas Quebradas (Pandaria) / Lago Lordamere (en ruinas)",
    summary     = "La gran ciudad de la magia, hogar del Kirin Tor y del Concilio de Tirisfal. Flota sobre las Islas Quebradas.",
    description = "Dalaran fue fundada por los humanos hace más de 2.000 años como una ciudad dedicada al estudio de la magia arcana. Alberga al Kirin Tor, la orden de magos más poderosa de Azeroth, y durante mucho tiempo fue sede del Concilio de Tirisfal, la organización secreta que vigilaba a los guardianes de la Luz. Tras la Segunda Guerra, la ciudad fue destruida por Archimonde y reconstruida flotando sobre las Islas Quebradas de Rasganorte. Durante la crisis del Rey Exánime, el archimago Rhonin lideró la defensa. Tras la derrota de la Plaga, la ciudad se trasladó sobre la costa de Pandaria, donde permaneció hasta la Tercera Guerra, cuando el archimago Khadgar la devolvió a su ubicación original en Rasganorte. Khadgar también descubrió que la ciudad ocultaba la Tumba de Sargeras, y tuvo que hundirla para sellar el portal de la Legión.",
    tags        = {"capital", "magia", "kirin tor", "flotante", "neutral", "mage"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA"},
    related     = {"khadgar", "antonidas", "jaina", "rhonin", "kirin_tor", "rey_exanime"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
        "Novela: Arthas: Rise of the Lich King (2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- ORGRIMMAR (duplicado evitado) - Asentamientos principales
-- ============================================================

-- ============================================================
-- MONTE HYJAL
-- ============================================================
AddLocation {
    id          = "monte_hyjal",
    name        = "Monte Hyjal",
    title       = "Santuario de los Antiguos · Árbol del Mundo",
    faction     = "Cenarion",
    location    = "Frontera entre Vallefresno, Feralas y Frondavil (Kalimdor)",
    summary     = "Antiguo hogar del Árbol del Mundo Nordrassil. Aquí se produjo la Batalla del Monte Hyjal al final de la Tercera Guerra.",
    description = "El Monte Hyjal es un volcán inactivo y sagrado, hogar de los elfos de la noche desde la Guerra de los Ancestros. En su cima crecía Nordrassil, el Árbol del Mundo, hasta que fue destruido durante la Invasión de la Plaga. Más tarde se plantó Teldrassil, que sería destruido por Sylvanas. Durante la Tercera Guerra, la cumbre del Hyjal fue escenario de la batalla final contra Archimonde, el líder de la Legión Ardiente. La victoria detuvo la invasión, pero costó la vida de muchos héroes, incluyendo a Jaina y Thrall. Hoy, Hyjal es un santuario druídico gobernado por los Cenarion, donde crece un nuevo árbol joven. Cenarius y Malfurion velan por su protección. Es un lugar de peregrinación para todos los que aman la naturaleza.",
    tags        = {"santuario", "cenarion", "árbol del mundo", "nordrassil", "kalimdor", "batalla"},
    expansions  = {"Vanilla", "Cata"},
    related     = {"cenarius", "malfurion", "nordrassil", "cenarion", "archimonde"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- THERAMORE
-- ============================================================
AddLocation {
    id          = "theramore",
    name        = "Theramore",
    title       = "La Ciudad Refugio (destruida)",
    faction     = "Alianza",
    location    = "Pantano de las Penas (Kalimdor)",
    summary     = "Isla-ciudad fundada por Jaina Valiente como refugio neutral. Destruida por Garrosh con la bomba de maná.",
    description = "Theramore fue fundada por Jaina Valiente en los días posteriores a la Tercera Guerra, como un refugio neutral para supervivientes de ambos bandos. La ciudad se convirtió en un símbolo del idealismo: humanos, orcos, elfos y trolls viviendo en paz. Jaina mantuvo esta neutralidad incluso cuando otros, como su propio padre, la instaban a alzarse contra la Horda. El trágico destino de Theramore llegó durante Mists of Pandaria, cuando Garrosh Grito Infernal, ya como Jefe de Guerra, usó el Pozo de la Almas de los Pandaren para enfocar una bomba de maná que destruyó la ciudad por completo, matando a casi todos sus habitantes. Jaina sobrevivió y regresó convertida en una líder implacable que juró destruir a Garrosh. La isla hoy es un páramo cristalizado, vigilado por las ruinas de lo que alguna vez fue un faro de esperanza.",
    tags        = {"isla", "alianza", "refugio neutral", "destruida", "bomba de maná", "garrosh"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP"},
    related     = {"jaina", "garrosh", "alemania", "pantano_de_las_penas"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
        "World of Warcraft: Mists of Pandaria (2012)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- KARAZHAN
-- ============================================================
AddLocation {
    id          = "karazhan",
    name        = "Karazhan",
    title       = "La Atalaya de Medivh",
    faction     = "Neutral",
    location    = "Pantano de las Penas (Laderas de Trabalomas)",
    summary     = "Torre del último guardián de Tirisfal, Medivh. Centro de conspiración durante Warcraft III. Ahora es una dungeon de 10 y 15 jugadores.",
    description = "Karazhan es una torre mágica que fue hogar de Medivh, el último guardián de Tirisfal, y donde se engendró la corrupción que dio origen a la Horda. Construida originalmente por los magos del Kirin Tor, fue la base de operaciones de Medivh mientras investigaba los misterios del universo y, sin saberlo, trabajaba para Sargeras a través de su cuerpo poseído. Tras la muerte de Medivh a manos de Khadgar y Lothar, la torre cayó en desuso. Hoy en día, Karazhan es una dimensión de bolsillo mágica, accesible a través del sótano de una taberna abandonada. En su interior, el espíritu de Medivh organiza fiestas eternas y la torre está habitada por monstruos, fantasmas y demonios. Es una de las dungeons más icónicas de World of Warcraft.",
    tags        = {"torre", "medivh", "karazhan", "tirisfal", "magia", "dungeon"},
    expansions  = {"Vanilla", "TBC", "Legion"},
    related     = {"medivh", "khadgar", "guldan", "tirisfal", "sargeras"},
    sources     = {
        "Warcraft: Orcs & Humans (1994)",
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- SHATTRATH
-- ============================================================
AddLocation {
    id          = "shattrath",
    name        = "Shattrath",
    title       = "Ciudad santuario de Terrallende",
    faction     = "Neutral (Sha'tar y Arúspices)",
    location    = "Terrallende (noroeste)",
    summary     = "Ciudad flotante que sirve como santuario neutral en Terrallende. Hogar de los Sha'tar y los Arúspices.",
    description = "Shattrath es una gran ciudad que flota en el centro de Terrallende, construida por los draenei hace siglos como lugar de descanso para los peregrinos que viajan a Karabor. Tras la caída de la ciudad de Karabor ante la Legión y los orcos de Illidan, los draenei supervivientes se refugiaron aquí. La ciudad se divide en dos zonas: la baja, controlada por los Aldor, y la alta, controlada por los Arúspices. Los Sha'tar, naaru que expulsaron a la Legión de la ciudad, sirven como guías espirituales. Shattrath se convirtió en el centro neutral del Outland, donde Horda y Alianza podían encontrarse sin combatirse. Tras la destrucción del Portal Oscuro en el Cataclismo, la ciudad perdió su importancia como centro de cruce, pero sigue siendo un faro de esperanza para los draenei y un recordatorio del poder de la Luz.",
    tags        = {"ciudad santuario", "neutral", "draenei", "sha_tar", "aldor", "aruspices"},
    expansions  = {"TBC", "WoD"},
    related     = {"draenei", "naaru", "khadgar", "terrallende"},
    sources     = {
        "World of Warcraft: The Burning Crusade (2007)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- NORTHREND / RASGANORTE
-- ============================================================
AddLocation {
    id          = "rasganorte",
    name        = "Rasganorte",
    title       = "La Tierra de la Plaga",
    faction     = "Plaga (anterior) / Neutral",
    location    = "Extremo norte del mundo",
    summary     = "Continente helado del norte, hogar de la Plaga y el Rey Exánime. Escenario de la expansión Wrath of the Lich King.",
    description = "Rasganorte es un vasto continente helado en el extremo norte del mundo, separado de Azeroth por el Mar Bruma Helada. Antes de la Plaga, era el hogar ancestral de varias civilizaciones, incluyendo los enanos Férreos, los trols Drakkari y la ancestral Yeti-ah. La corrupción del Rey Exánime trajo la Plaga, y los Vrykul, antiguos ancestros de los humanos, fueron convertidos en no-muertos por Arthas. La expansión Wrath of la Lich King tuvo lugar casi en su totalidad en este continente, llevando a los jugadores a la Colina de los Corvos Quebrantahuesos, Zul'Drak, las Cumbres Tormentosas de Teldrassil y, finalmente, al Pico de la Nieve Eterna, donde se libró la batalla final contra Arthas. Tras la derrota del Rey Exánime, la Plaga se retiró, pero los peligros de Rasganorte siguen presentes.",
    tags        = {"continente", "norte", "plaga", "rey exánime", "icecrown", "hielo"},
    expansions  = {"WotLK"},
    related     = {"arthas", "rey_exanime", "tirion", "vrykul", "nerzhul"},
    sources     = {
        "World of Warcraft: Wrath of the Lich King (2008)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- PANDARIA
-- ============================================================
AddLocation {
    id          = "pandaria",
    name        = "Pandaria",
    title       = "La Tierra del Sueño Brumoso",
    faction     = "Pandaren (neutral)",
    location    = "Mar de los Sudorosos (sur de Azeroth)",
    summary     = "Continente ancestral de los pandaren, oculto por la Niebla Eterna durante 10.000 años. Escenario de Mists of Pandaria.",
    description = "Pandaria es un continente misterioso que fue separado del resto del mundo hace 10.000 años por una niebla mágica, después de la derrota de la Legión Ardiente. Sus habitantes, los pandaren, han vivido en paz y armonía con la naturaleza, en una sociedad que no conoce la guerra. El continente está dividido en cuatro regiones: el Valle de los Cuatro Vientos, el Bosque de Jade, el Pico Kun-Lai y la Llanura del Pasto Eterno. Cada una representa un aspecto de la filosofía pandaren: trabajo, naturaleza, valor y esperanza. La Niebla Eterna comenzó a disiparse con la muerte de Garrosh, momento en que Horda y Alianza descubrieron el continente. Mists of Pandaria narra la guerra por el control de Pandaria y la lucha contra el Sha de la Ambición, así como el conflicto interno entre el bando del Lotus Blanco y el del Shado-Pan.",
    tags        = {"continente", "pandaren", "niebla", "mística", "asia", "espiritual"},
    expansions  = {"MoP"},
    related     = {"chen", "lorewalker_cho", "shado_pan", "august_celestial"},
    sources     = {
        "World of Warcraft: Mists of Pandaria (2012)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- CEMENTERIO DE DRAGONES
-- ============================================================
AddLocation {
    id          = "cementerio_de_dragones",
    name        = "Cementerio de Dragones",
    title       = "Valle de los dragones caídos",
    faction     = "Plaga (anterior) / Neutral",
    location    = "Tierras de la Peste del Norte (Rasganorte)",
    summary     = "Antiguo cementerio donde se almacenan los huesos de dragones caídos. Arthas usó la piedra de Resurrección para invocar al nigromante Kel'Thuzad.",
    description = "El Cementerio de Dragones es un antiguo camposanto donde los dragones honran a sus muertos, custodiado por el Vuelo Rojo. Durante la Tercera Guerra, Arthas y sus soldados saquearon este lugar sagrado para robar los huesos de los dragones, ya que creía (equivocadamente) que podía usar la energía de sus restos para revivir a Kel'Thuzad. La profanación de este lugar sagrado contribuyó a que la Plaga se extendiera con mayor rapidez. Hoy en día, el Cementerio de Dragones es una zona neutral de Rasganorte, donde los dragones del Vuelo Rojo mantienen la vigilancia. Los jugadores pueden encontrar la entrada a la dungeon de set pieces, además de un campo de huesos impresionante. Su historia es un recordatorio del precio de la guerra contra los dragones.",
    tags        = {"cementerio", "dragones", "vuelo rojo", "plaga", "rasganorte", "sagrado"},
    expansions  = {"Vanilla", "TBC", "WotLK"},
    related     = {"arthas", "kelthuzad", "vuelo_rojo", "rasganorte"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- PICO DE LA NIEVE ETERNA
-- ============================================================
AddLocation {
    id          = "pico_de_la_nieve_eterna",
    name        = "Pico de la Nieve Eterna",
    title       = "Trono del Rey Exánime",
    faction     = "Plaga (anterior) / Neutral",
    location    = "Cumbres Tormentosas (Rasganorte)",
    summary     = "La fortaleza del Rey Exánime. Escenario de la batalla final de Wrath of the Lich King.",
    description = "El Pico de la Nieve Eterna es la fortaleza helada que corona Rasganorte, hogar del Rey Exánime. En su cima, encerrado en hielo y custodiado por la Plaga, dormía el cuerpo original de Arthas Menethil. La fortaleza cuenta con cinco alas separadas, cada una protegida por los generales más poderosos de la Plaga: Anub'Rekhan, Gran Viuda Faerlina, Noth el Peste de las Sombras, Heigan el Impuro y Sapphiron. En la cima aguardaba el mismísimo Rey Exánime, fusionado con Arthas, y la espada que lo creó: Agonía de Escarcha. En la expansión Wrath of the Lich King, los jugadores de la Alianza y la Horda unieron sus fuerzas para asediar la fortaleza, atravesar sus defensas y, finalmente, derrotar a Arthas. En el clímax, el espíritu de Terenas Menethil liberó a su hijo, y Tirion Vadín destrozó al Rey Exánime con Grito de Guerra. Aunque Arthas cayó, la Plaga no fue destruida por completo.",
    tags        = {"fortaleza", "plaga", "rey exánime", "icecrown", "rasganorte", "raid"},
    expansions  = {"WotLK"},
    related     = {"arthas", "rey_exanime", "tirion", "rasganorte", "sapphiron", "kelthuzad"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft: Wrath of the Lich King (2008)",
        "Novela: Arthas: Rise of the Lich King (2009)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- SILVERMOON / LUNA DE PLATA
-- ============================================================
AddLocation {
    id          = "luna_de_plata",
    name        = "Luna de Plata (Silvermoon)",
    title       = "Capital de los elfos de la sangre",
    faction     = "Horda (elfos de la sangre)",
    location    = "Quel'Thalas (norte de Lordaeron)",
    summary     = "La joya de Quel'Thalas, capital de los elfos de la sangre. Destruida parcialmente por Arthas durante la Tercera Guerra.",
    description = "Luna de Plata, o Silvermoon en su idioma natal, es la capital de los elfos de la sangre y la joya de la región de Quel'Thalas. Construida hace más de 7.000 años por los elfos nobles tras su marcha de Kalimdor, la ciudad es famosa por sus altos pináculos, sus torres de cristal y por el Faro de Luna de Plata, una estructura mágica que servía como fuente de poder para los elfos. Durante la Caída de Quel'Thalas, Arthas destruyó el Faro y la mayor parte de la ciudad, corrompiendo a Sylvanas y otros muchos elfos. La nueva generación de elfos de la sangre, liderados por Kael'thas, encontró en la Horda una nueva familia y reconstruyó la ciudad. Hoy, Luna de Plata es una ciudad vibrante que combina la antigua majestuosidad élfica con la nueva estética de los sin'dorei. Se llega a ella a través de las Tierras Fantasma, una zona encantada cercana.",
    tags        = {"capital", "elfos de la sangre", "quel_thalas", "horda", "magia", "luna"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"sylvanas", "kaelthas", "lor_themar", "quel_thalas", "rommath"},
    sources     = {
        "Warcraft III: The Frozen Throne (2003)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- TERRALLENDE / OUTLAND
-- ============================================================
AddLocation {
    id          = "terrallende",
    name        = "Terrallende (Outland)",
    title       = "El mundo roto de los draenei",
    faction     = "Neutral / Múltiple",
    location    = "Más allá del Portal Oscuro",
    summary     = "Antiguo planeta Draenor, destruido por Ner'zhul y reabierto por la Horda. Escenario de Burning Crusade y Warlords of Draenor.",
    description = "Terrallende, conocido también como Outland, es lo que queda del antiguo planeta Draenor, hogar de los orcos y los draenei. Antes era un mundo exuberante, con un vasto océano y praderas verdes. Pero cuando Ner'zhul abrió múltiples portales dimensionales para escapar de la persecución de la Alianza, la magia arcana destabilizó la estructura del planeta, lo que provocó su ruptura. Los fragmentos de Terrallende quedaron flotando en el vacío del Twisting Nether. La Burning Crusade tuvo lugar en este mundo fragmentado, con Illidan y Kael'thas como antagonistas principales. Décadas después, la línea temporal alternativa de Warlords of Draenor mostró un Draenor intacto, donde Gul'dan no completó sus planes. Tras la derrota del Mando de Hierro, la línea temporal se restauró, pero los cambios en el Portal Oscuro provocaron nuevas amenazas.",
    tags        = {"mundo", "draenei", "orco", "portal oscuro", "destruido", "dimensión"},
    expansions  = {"TBC", "WoD"},
    related     = {"nerzhul", "illidan", "guldan", "draenei", "khadgar"},
    sources     = {
        "Warcraft II: Beyond the Dark Portal (1996)",
        "World of Warcraft: The Burning Crusade (2007)",
        "World of Warcraft: Warlords of Draenor (2014)",
    },
    icon        = "INV_Misc_QuestionMark",
}
