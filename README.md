# 📚 Codex of Azeroth

> Un compendio interactivo del lore de World of Warcraft, integrado en la interfaz del juego.

## ✨ Características

- 🗂️ **Base de datos navegable** del lore: NPCs, lugares, facciones, eventos y conceptos
- 🔍 **Motor de búsqueda** con soporte fuzzy (tolerante a typos) y normalización de acentos
- 📖 **Entradas detalladas** con descripción, facción, raza, ubicación, tags, expansiones, relacionadas y fuentes citadas
- 🎨 **Interfaz limpia y moderna** con sidebar de categorías y vista de entrada con scroll
- 🔘 **Botón de minimapa** arrastrable para abrir/cerrar rápidamente
- ⌨️ **Slash commands** para acceso rápido desde teclado
- 📜 **100% offline** — los datos van dentro del addon, sin llamadas a APIs externas
- ✅ **Totalmente legal** — solo lee datos públicos de la API de WoW

## 🚀 Instalación

1. Copia la carpeta `CodexOfAzeroth` a `World of Warcraft/_retail_/Interface/AddOns/`
2. Reinicia el juego o haz un `/reload`
3. Escribe `/coa` para abrir el Códice

## 🎮 Comandos

| Comando | Acción |
|---------|--------|
| `/coa` o `/codex` | Abre/cierra la ventana principal |
| `/coa thrall` | Abre directamente la entrada de Thrall |
| `/coa buscar` | Abre la ventana y enfoca la búsqueda |
| `/coa ayuda` | Muestra la ayuda |

## 🗂️ Estructura del Proyecto

```
CodexOfAzeroth/
├── CodexOfAzeroth.toc          # Manifiesto del addon
├── Core/
│   ├── Localization.lua         # Textos en español
│   ├── Codex.lua                # Clase principal
│   ├── Database.lua             # Sistema de base de datos
│   └── Search.lua               # Motor de búsqueda fuzzy
├── Data/
│   ├── NPCs.lua                 # 11 personajes catalogados
│   ├── Locations.lua            # 11 lugares catalogados
│   ├── Factions.lua             # 10 facciones catalogadas
│   ├── Events.lua               # 8 eventos históricos
│   ├── Concepts.lua             # 6 conceptos del lore
│   ├── Timeline.lua             # Línea temporal de Azeroth
│   └── LoreData.lua             # Estadísticas y agregaciones
└── UI/
    ├── Categories.lua           # Sidebar de navegación
    ├── CodeEntry.lua            # Vista de entrada individual
    ├── MinimapButton.lua        # Botón flotante en minimapa
    └── MainFrame.lua            # Ventana principal
```

## 📊 Contenido Actual

- **~46 entradas** del lore de WoW en 5 categorías
- **Línea temporal completa** desde los Titanes hasta The War Within
- Cobertura de las **principales eras**: Era Antigua, Warcraft I-III, WoW, todas las expansiones

## 🛣️ Roadmap (futuras versiones)

- [ ] Sistema de favoritos persistente (SavedVariables)
- [ ] Notas personales por entrada
- [ ] Tooltips en NPCs del juego que tengan entrada en el Códice
- [ ] Pins de lugares en el mapa del mundo
- [ ] Localización completa al inglés
- [ ] Detector de quests con lore
- [ ] Línea temporal visual interactiva
- [ ] Más entradas (objetivo: 200+ en v1.0)

## 🤝 Contribuir

¿Quieres añadir entradas? Edita los archivos de `Data/` siguiendo el formato:

```lua
AddNPC {
    id          = "id_unico",
    name        = "Nombre",
    title       = "Título",
    faction     = "Facción",
    summary     = "Resumen corto",
    description = "Descripción completa del lore",
    tags        = {"tag1", "tag2"},
    expansions  = {"Vanilla", "TBC", ...},
    related     = {"id_relacionado1", "id_relacionado2"},
    sources     = {"Novela X", "Juego Y"},
}
```

## 📜 Licencia

Este addon es un proyecto comunitario sin ánimo de lucro. El lore de Warcraft es propiedad de Blizzard Entertainment. Las descripciones son resúmenes originales que citan las fuentes oficiales.

## ⚖️ Compatibilidad

- **World of Warcraft: Retail** (The War Within, 11.0+)
- API Interface: 10.2.0
- Sin dependencias externas (standalone)

---

Hecho con ❤️ para la comunidad de WoW
