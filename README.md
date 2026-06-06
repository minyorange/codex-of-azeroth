# 📚 Codex of Azeroth

*Read this in other languages: [English](#english) | [Español](#español)*

---

## English

> An interactive in-game Lore Compendium for World of Warcraft.

### ✨ Features

- 🗂️ **Browsable Lore Database:** Explore detailed entries of NPCs, locations, factions, events, and lore concepts.
- 🔍 **Search Engine:** Features a smart fuzzy search (typo tolerance) and accent normalization with a custom relevance scoring system.
- 📖 **Detailed Entries:** Offers rich information including summaries, full descriptions, race, faction, current location, associated expansions, tags, related items, and official cited sources.
- 🎨 **Clean and Modern UI:** Features a sleek navigation sidebar, detailed scrollable entries, and beautiful interactive search lists.
- 🔘 **Minimap Button:** A draggable floating button for quick toggle access.
- ⌨️ **Slash Commands:** Command line utility for keyboards.
- 📜 **100% Offline:** Fully standalone with all data bundled inside the addon—no external APIs or internet connection needed.
- ✅ **Fully Legal:** Complies with Blizzard's official AddOn Development Policy (no automated combat, no automation, no real-money transactions).

### 🚀 Installation

1. Copy the `CodexOfAzeroth` directory into your `World of Warcraft/_retail_/Interface/AddOns/` folder.
2. Restart the game or execute `/reload` in-game.
3. Type `/coa` or `/codex` to open the Compendium.

### 🎮 Commands

| Command | Action |
|---------|--------|
| `/coa` or `/codex` | Toggle main window open/close |
| `/coa thrall` | Open the specific entry for Thrall directly |
| `/coa buscar` | Open the window and focus on the search bar |
| `/coa ayuda` | Display the help menu |

---

## Español

> Un compendio interactivo del lore de World of Warcraft, integrado en la interfaz del juego.

### ✨ Características

- 🗂️ **Base de datos navegable** del lore: NPCs, lugares, facciones, eventos y conceptos.
- 🔍 **Motor de búsqueda** con soporte fuzzy (tolerante a typos) y normalización de acentos.
- 📖 **Entradas detalladas** con descripción, facción, raza, ubicación, tags, expansiones, relacionadas y fuentes citadas.
- 🎨 **Interfaz limpia y moderna** con sidebar de categorías y vista de entrada con scroll.
- 🔘 **Botón de minimapa** arrastrable para abrir/cerrar rápidamente.
- ⌨️ **Slash commands** para acceso rápido desde teclado.
- 📜 **100% offline** — los datos van dentro del addon, sin llamadas a APIs externas.
- ✅ **Totalmente legal** — cumple con la política oficial de desarrollo de addons de Blizzard.

### 🚀 Instalación

1. Copia la carpeta `CodexOfAzeroth` a `World of Warcraft/_retail_/Interface/AddOns/`
2. Reinicia el juego o haz un `/reload`
3. Escribe `/coa` para abrir el Códice

### 🎮 Comandos

| Comando | Acción |
|---------|--------|
| `/coa` o `/codex` | Abre/cierra la ventana principal |
| `/coa thrall` | Abre directamente la entrada de Thrall |
| `/coa buscar` | Abre la ventana y enfoca la búsqueda |
| `/coa ayuda` | Muestra la ayuda |

---

## 🗂️ Project Structure / Estructura del Proyecto

```
CodexOfAzeroth/
├── CodexOfAzeroth.toc          # Addon manifest / Manifiesto del addon
├── Core/
│   ├── Localization.lua         # Translations (Spanish) / Localización
│   ├── Codex.lua                # Main addon core / Clase principal
│   ├── Database.lua             # Database engine / Sistema de base de datos
│   └── Search.lua               # Fuzzy search engine / Motor de búsqueda
├── Data/
│   ├── NPCs.lua                 # 11 cataloged NPCs / Personajes
│   ├── Locations.lua            # 11 cataloged Locations / Lugares
│   ├── Factions.lua             # 10 cataloged Factions / Facciones
│   ├── Events.lua               # 8 historical events / Eventos históricos
│   ├── Concepts.lua             # 6 lore concepts / Conceptos del lore
│   ├── Timeline.lua             # Azeroth chronology / Línea temporal de Azeroth
│   └── LoreData.lua             # Stats and aggregations / Estadísticas
└── UI/
    ├── Categories.lua           # Navigation sidebar / Sidebar de categorías
    ├── CodeEntry.lua            # Entry details & list buttons / Vista de entradas
    ├── MinimapButton.lua        # Minimap button / Botón flotante
    └── MainFrame.lua            # Main window container / Ventana principal
```

## 📊 Current Content / Contenido Actual

- **~46 entries** of WoW lore across 5 categories / **~46 entradas** de lore en 5 categorías.
- **Complete Timeline** from the Titans to The War Within and Midnight / **Línea temporal completa** desde los Titanes hasta Midnight.
- Coverage of **major eras**: Ancient Era, Warcraft I-III, WoW, and expansions / Cobertura de las **principales eras** de la saga.

## 🛣️ Roadmap (Future / Futuras versiones)

- [ ] Persistent favorites system (SavedVariables) / Sistema de favoritos persistente.
- [ ] Personal notes per entry / Notas personales por entrada.
- [ ] Game tooltips for NPCs with lore / Tooltips en NPCs del juego con lore.
- [ ] World map pins / Pines de lugares en el mapa del mundo.
- [ ] English localization / Localización completa al inglés.
- [ ] Interactive visual timeline / Línea temporal visual interactiva.
- [ ] More entries (Goal: 200+ in v1.0) / Más entradas (Objetivo: 200+ en v1.0).

## 🤝 Contributing / Contribuir

Do you want to add lore entries? Edit files in the `Data/` directory following this format:
¿Quieres añadir entradas de lore? Edita los archivos en la carpeta `Data/` siguiendo este formato:

```lua
AddNPC {
    id          = "unique_id",
    name        = "Name",
    title       = "Title",
    faction     = "Faction",
    summary     = "Short summary",
    description = "Full lore description",
    tags        = {"tag1", "tag2"},
    expansions  = {"Vanilla", "TBC", ...},
    related     = {"related_id1", "related_id2"},
    sources     = {"Novel X", "Game Y"},
}
```

## 📜 License / Licencia

This addon is a non-profit community project. Warcraft lore and assets are property of Blizzard Entertainment. Lore descriptions are original summaries citing official sources.

Este addon es un proyecto comunitario sin ánimo de lucro. El lore de Warcraft es propiedad de Blizzard Entertainment. Las descripciones son resúmenes originales que citan las fuentes oficiales.

## ⚖️ Compatibility / Compatibilidad

- **World of Warcraft: Retail** (The War Within & Midnight, 11.0+ / 12.0+)
- Standalone - No external dependencies / Sin dependencias externas.

---

*Made with ❤️ for the WoW Community / Hecho con ❤️ para la comunidad de WoW*
