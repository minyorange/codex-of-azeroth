# 🤝 Contribution Guide / Guía de Contribución

*Read this in other languages: [English](#english) | [Español](#español)*

---

## English

Thank you for your interest in improving **Codex of Azeroth**! Any help is welcome.

### 📋 Ways to Contribute

- 🐛 **Report bugs** by opening an [Issue](../../issues)
- 💡 **Suggest features**
- 📝 **Add new lore entries** or improve existing ones
- 🌍 **Translate** into other languages
- 💻 **Improve the addon code**
- 📚 **Correct inaccuracies** in descriptions

### 📝 How to Add New Entries

#### 1. Find the correct file

| Category | File |
|-----------|---------|
| NPCs (Characters) | `Data/NPCs.lua` |
| Locations | `Data/Locations.lua` |
| Factions | `Data/Factions.lua` |
| Historical Events | `Data/Events.lua` |
| Lore Concepts | `Data/Concepts.lua` |

#### 2. Follow the established format

```lua
AddNPC {
    id          = "unique_id_without_spaces",  -- Unique identifier
    name        = "Character Name",
    title       = "Titles or nicknames (optional)",
    faction     = "Horde/Alliance/Neutral (optional)",
    race        = "Character race (optional)",
    location    = "Current location (optional)",
    summary     = "Short 1-2 line summary",  -- REQUIRED
    description = "Full lore description...",  -- REQUIRED
    tags        = {"tag1", "tag2", "tag3"},  -- For searching
    expansions  = {"Vanilla", "TBC", "WotLK", ...},  -- Associated expansions
    related     = {"related_id1", "related_id2"},  -- IDs of related entries
    sources     = {  -- Citations of official sources
        "Warcraft III: Reign of Chaos (2002)",
        "Novel: Rise of the Horde (2006)",
        "World of Warcraft (2004-present)",
    },
    icon        = "INV_Misc_QuestionMark",  -- In-game icon path
}
```

#### 3. Style Rules

##### ✅ DO:
- Write **original** descriptions in your own words.
- **Cite sources** (games, novels, comics).
- Maintain the same level of detail as existing entries.
- Use lowercase IDs without spaces (use underscores).
- Add relevant tags to facilitate search.
- Link related entries using their IDs.

##### ❌ DON'T:
- ❌ Do not copy text verbatim from novels or game scripts.
- ❌ Do not include unmarked spoilers for very recent expansions.
- ❌ Do not use duplicate IDs.
- ❌ Do not add external images (only in-game icons like `Interface\Icons\...`).
- ❌ Do not include information without a verifiable source.

---

## Español

¡Gracias por tu interés en mejorar **Codex of Azeroth**! Toda ayuda es bienvenida.

### 📋 Formas de Contribuir

- 🐛 **Reportar bugs** abriendo un [Issue](../../issues)
- 💡 **Sugerir funcionalidades** nuevas
- 📝 **Añadir entradas de lore** nuevas o mejorar las existentes
- 🌍 **Traducir** a otros idiomas
- 💻 **Mejorar el código** del addon
- 📚 **Corregir imprecisiones** en las descripciones

### 📝 Cómo Añadir Nuevas Entradas

#### 1. Encuentra el archivo correcto

| Categoría | Archivo |
|-----------|---------|
| NPCs (Personajes) | `Data/NPCs.lua` |
| Lugares | `Data/Locations.lua` |
| Facciones | `Data/Factions.lua` |
| Eventos Históricos | `Data/Events.lua` |
| Conceptos del Lore | `Data/Concepts.lua` |

#### 2. Sigue el formato establecido

```lua
AddNPC {
    id          = "nombre_unico_sin_espacios",  -- Identificador único
    name        = "Nombre del Personaje",
    title       = "Títulos o apodos (opcional)",
    faction     = "Horda/Alianza/Neutral (opcional)",
    race        = "Raza del personaje (opcional)",
    location    = "Ubicación actual (opcional)",
    summary     = "Resumen corto de 1-2 líneas",  -- OBLIGATORIO
    description = "Descripción completa del lore...",  -- OBLIGATORIO
    tags        = {"tag1", "tag2", "tag3"},  -- Para búsqueda
    expansions  = {"Vanilla", "TBC", "WotLK", ...},  -- Expansiones donde aparece
    related     = {"id_relacionado1", "id_relacionado2"},  -- IDs de entradas relacionadas
    sources     = {  -- Citas de fuentes oficiales
        "Warcraft III: Reign of Chaos (2002)",
        "Novela: Rise of the Horde (2006)",
        "World of Warcraft (2004-presente)",
    },
    icon        = "INV_Misc_QuestionMark",  -- Icono del juego
}
```

#### 3. Reglas de Estilo

##### ✅ Lo que SÍ debes hacer:
- Escribir descripciones **originales** con tus propias palabras
- **Citar las fuentes** (juegos, novelas, comics)
- Mantener el mismo nivel de detalle que las entradas existentes
- Usar IDs en minúsculas y sin espacios (usar guiones bajos)
- Añadir tags relevantes para facilitar la búsqueda
- Vincular entradas relacionadas con sus IDs

##### ❌ Lo que NO debes hacer:
- ❌ Copiar texto verbatim de novelas o scripts del juego
- ❌ Incluir spoilers de expansiones muy recientes sin marcar
- ❌ Usar IDs duplicados (cada uno debe ser único)
- ❌ Añadir imágenes externas (solo iconos del juego: `Interface\Icons\...`)
- ❌ Incluir información sin fuente verificable

---

## 🌍 Translation / Traducción

To add a new language / Para añadir un nuevo idioma:

1. Create a file / Crea un archivo `Core/Localization.<locale>.lua` (e.g. / ej: `Core/Localization.enUS.lua`)
2. Copy the structure / Copia la estructura de `Core/Localization.lua`
3. Translate the values (NOT the keys) / Traduce los valores (NO las claves)
4. Add the locale to / Añade el código a la línea `## X-Localizations:` en `CodexOfAzeroth.toc`

---

*Thank you for making Codex of Azeroth a better resource for the community! 🎉*
*¡Gracias por hacer de Codex of Azeroth un mejor recurso para la comunidad! 🎉*
