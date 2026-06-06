-- ============================================================
-- Codex of Azeroth :: Concepts (Conceptos)
-- ============================================================
-- Conceptos importantes del lore: magia, fuerzas, filosofías, etc.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local function AddConcept(entry)
    entry.category = "concepts"
    if CoA.Database and CoA.Database.AddEntry then
        CoA.Database:AddEntry(entry)
    end
end

-- ============================================================
-- LA LUZ
-- ============================================================
AddConcept {
    id          = "luz",
    name        = "La Luz",
    title       = "La fuerza de la fe y la esperanza",
    faction     = "Neutral (Múltiple)",
    location    = "Universal",
    summary     = "Una fuerza cósmica opuesta a las Sombras. Fuente del poder de paladines, sacerdotes y creyentes.",
    description = "La Luz es una fuerza cósmica fundamental del universo, opuesta a las Sombras. No es un dios, sino una energía espiritual que responde a la fe, la esperanza y la voluntad de actuar por el bien común. Los paladines canalizan la Luz a través de juramentos sagrados, los sacerdotes mediante la fe, y los draenei mediante la conexión con los naaru (seres de Luz cristalizada). La Luz puede ser corrompida por el fanatismo o el extremismo, como demuestra el caso de los Hijos de la Luz, o de la Iglesia de la Luz en los días de Lordaeron. La relación entre Luz y Vacío es una dualidad cósmica fundamental: la Luz sin Sombras ciega, y las Sombras sin Luz corrompen. Los Vuelos Dragón Rojo son los guardianes de la Vida, una manifestación de la Luz.",
    tags        = {"concepto", "luz", "magia", "cosmica", "paladin", "sacerdote"},
    expansions  = {"Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF", "TWW"},
    related     = {"paladines", "naaru", "vacio", "sacerdotes", "alexstrasza"},
    sources     = {
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- EL VACÍO
-- ============================================================
AddConcept {
    id          = "vacio",
    name        = "El Vacío",
    title       = "La fuerza del caos y la entropía",
    faction     = "Antagonista potencial",
    location    = "Universal",
    summary     = "Una fuerza cósmica opuesta a la Luz. Los Antiguos Dioses son manifestaciones del Vacío. Los elfos del vacío y los orcos del vacío lo canalizan.",
    description = "El Vacío es la otra fuerza cósmica fundamental del universo, opuesta a la Luz. Mientras la Luz representa el orden y la vida, el Vacío representa la entropía, el caos y la muerte. Los Dioses Antiguos (como C'Thun, Yogg-Saron, N'Zoth) son manifestaciones del Vacío atrapadas en Azeroth. Los sirvientes del Vacío incluyen a los elfos del vacío (que renuncian a la Luz para alcanzar el poder), a los orcos del vacío (Mag'har) y a las criaturas sombrías. La filosofía del Vacío es la del nihilismo: nada es eterno, todo debe terminar. Los naaru, seres de pura Luz, pueden corromperse en Vacío cuando sufren lo suficiente (como K'ure en Auchindoun). El equilibrio entre Luz y Vacío es delicado: la Luz sin Sombras ciega, y el Vacío sin Luz consume todo.",
    tags        = {"concepto", "vacio", "cosmica", "antigua", "dioses_antiguos", "entropia"},
    expansions  = {"Cata", "MoP", "WoD", "Legion", "BfA", "SL", "DF"},
    related     = {"luz", "dioses_antiguos", "elfos_vacio", "naaru"},
    sources     = {
        "World of Warcraft (2004-presente)",
        "World of Warcraft: Battle for Azeroth (2018)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- EL MÁS ALLÁ / SHADOWLANDS
-- ============================================================
AddConcept {
    id          = "mas_alla",
    name        = "El Más Allá (Shadowlands)",
    title       = "El reino de la muerte",
    faction     = "Neutral",
    location    = "Dimensión alternativa",
    summary     = "El plano de existencia al que van las almas tras la muerte. Gobernado por los kyrianos y dividido en cinco zonas.",
    description = "El Más Allá, o Shadowlands, es el plano de existencia al que van las almas tras la muerte. Antes de Shadowlands (la expansión), era un concepto abstracto y poco explorado del lore. La expansión del 2020 reveló que está gobernado por los kyrianos, los eternos custodios del orden natural de la muerte. El Más Allá se divide en cinco zonas, cada una con un propósito específico: Bastión (entrega de almas virtuosas a kyria), Maldraxxus (defensa contra amenazas), Ardenweald (ciclo de naturaleza y muerte), Revendreth (redención de almas pecadoras) y La Ciénaga (aniquilación de almas irredimibles). El Calabozo de Zovaal, que era el primer carcelero, intentó reescribir las reglas de la muerte y hacerse con el poder total, lo que llevó a la crisis de las Almas.",
    tags        = {"concepto", "muerte", "shadowlands", "alma", "kyria", "eternidad"},
    expansions  = {"SL"},
    related     = {"sylvanas", "zovaal", "bolvar", "kyria"},
    sources     = {
        "World of Warcraft: Shadowlands (2020)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- EL SUEÑO ESMERALDA
-- ============================================================
AddConcept {
    id          = "sueno_esmeralda",
    name        = "El Sueño Esmeralda",
    title       = "La dimensión espiritual de la naturaleza",
    faction     = "Cenarion",
    location    = "Dimensión paralela",
    summary     = "Un plano de existencia paralelo que refleja el mundo de los espíritus de la naturaleza. Los druidas lo visitan para mantener el equilibrio.",
    description = "El Sueño Esmeralda es un plano de existencia paralelo al mundo físico, accesible a través de la meditación druídica o el Árbol del Mundo. Es un reflejo espiritual de Azeroth, habitado por los espíritus de la naturaleza, los animales, los elementales y los ancestros. En su centro, el Sueño Esmeralda está gobernado por Ysera, la Aspecto del Vuelo Verde, que cayó en un sueño eterno desde la Guerra de los Ancestros. Los druidas, especialmente Malfurion, utilizan el Sueño para vigilar el equilibrio del mundo natural. La Crisis del Sueño Esmeralda, causada por Xavius y el Rey Exánime, casi destruye este plano. Cenarius trabaja para restaurarlo. Con la muerte de Ysera en Legion, el Sueño ha perdido a su protectora, aunque nuevos héroes han tomado su lugar.",
    tags        = {"concepto", "sueño", "esmeralda", "druida", "naturaleza", "ysera"},
    expansions  = {"Vanilla", "Cata", "Legion"},
    related     = {"ysera", "malfurion", "cenarius", "druida", "xavius"},
    sources     = {
        "World of Warcraft (2004-presente)",
        "Novela: Stormrage (2010)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- TITANES
-- ============================================================
AddConcept {
    id          = "dioses_antiguos",
    name        = "Los Dioses Antiguos",
    title       = "Manifestaciones del Vacío en Azeroth",
    faction     = "Antagonista cósmico",
    location    = "Bajo Azeroth",
    summary     = "Seres cósmicos del Vacío, encarcelados bajo Azeroth por los Titanes. C'Thun, Yogg-Saron, Y'Shaarj, N'Zoth.",
    description = "Los Dioses Antiguos son entidades cósmicas del Vacío que fueron enviadas a Azeroth para corromper el mundo. Hace millones de años, los Titanes llegaron a Azeroth y encontraron el mundo en guerra contra estos seres. Tras derrotarlos, los encadenaron bajo la tierra, donde quedaron dormidos pero soñando. Su influencia se ha extendido a través de las razas de Azeroth: los qiraji (bajo C'Thun), los naga (bajo N'Zoth), los aqir, los nerubian y otros. Los Dioses Antiguos son cinco: C'Thun (en Ahn'Qiraj), Yogg-Saron (en Ulduar), Y'Shaarj (muerto y extirpado en Mists of Pandaria), N'Zoth (en Ny'alotha) y G'huun (en Uldir). Aunque están encadenados, su influencia persiste y sigue siendo una amenaza para Azeroth. La conexión entre los Dioses Antiguos y la Aguja de los Titanes sigue siendo un misterio.",
    tags        = {"concepto", "dioses antiguos", "vacio", "cthun", "yogg", "nzoth"},
    expansions  = {"Vanilla", "Cata", "MoP", "BfA"},
    related     = {"vacio", "titanes", "cthun", "nzoth", "yogg_saron"},
    sources     = {
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}

-- ============================================================
-- POZO DE LA ETERNIDAD
-- ============================================================
AddConcept {
    id          = "pozo_eternidad",
    name        = "El Pozo de la Eternidad",
    title       = "Fuente de magia arcana en el mundo antiguo",
    faction     = "Neutral",
    location    = "Kalimdor (antiguo)",
    summary     = "Un lago de magia arcana pura que fue el centro de la civilización de los elfos de la noche. Su explosión creó el Mar de los Sudorosos.",
    description = "El Pozo de la Eternidad fue un vasto lago de magia arcana pura que se encontraba en el centro de Kalimdor, en lo que hoy es el Mar de los Sudorosos. Hace 10.000 años, los elfos de la noche lo usaron como fuente de poder para construir su civilización avanzada, incluyendo la ciudad de Suramar. La energía del Pozo llamó la atención de Sargeras, quien abrió un portal desde el Vacío Abisal para invadir Azeroth. Durante la Guerra de los Ancestros, la explosión del Pozo destruyó a Archimonde y partió el continente de Kalimdor. Sus restos se transformaron en el Mar de los Sudorosos, y un nuevo Pozo más pequeño, el Pozo del Alba, brotó en el Cementerio de Dragones para proteger Nordrassil. Otro Pozo, el Pozo de la Eternidad, se encuentra en Val'sharah, conectado al Sueño Esmeralda.",
    tags        = {"concepto", "pozo", "eternidad", "magia arcana", "antigua", "kalimdor"},
    expansions  = {"Vanilla", "TBC", "Cata", "Legion"},
    related     = {"sargeras", "archimonde", "malfurion", "tyrande", "illidan", "cenarius"},
    sources     = {
        "Warcraft III: Reign of Chaos (2002)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",
}
