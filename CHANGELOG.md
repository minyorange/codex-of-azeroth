# 📜 Changelog

*Read this in other languages: [English](#english) | [Español](#español)*

---

## English

All notable changes to Codex of Azeroth will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Planned
- Persistent favorites system (SavedVariables)
- Personal notes per entry
- Game tooltips for NPCs with lore
- World map pins
- Full English localization
- Interactive visual timeline
- 200+ lore entries (Goal for v1.0)

## [0.1.1] - 2026-06-06

### ⚙️ Improvements and Bug Fixes
- Fixed a critical initialization bug so the addon now loads perfectly.
- Fixed database wiping bug; lore entries are no longer cleared on PLAYER_LOGIN.
- Made the UI fully interactive: search results and category lists are now clickable buttons.
- Improved search UX: the main frame now remains open while performing a search.
- Corrected the minimap button icon, which is now perfectly centered in its circular border.
- Integrated GitHub Actions workflow to automatically package and release the `.zip` upon tag pushes.
- Cleaned up the repository layout, placing all files and folders directly in the root directory.

## [0.1.0] - 2026-06-06

### ✨ Added
- Initial addon release.
- **Lore Database with 46 entries** across 5 categories.
- **Complete Chronological Timeline** from the Titans to Midnight.
- Draggable UI mainframe and minimap button.
- Fuzzy search engine with score relevance.
- Spanish localization.

---

## Español

Todos los cambios notables de Codex of Azeroth serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto sigue [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Planeado
- Sistema de favoritos persistente (SavedVariables)
- Notas personales por entrada
- Tooltips en NPCs del juego
- Pins de lugares en el mapa
- Localización al inglés
- Línea temporal visual interactiva
- 200+ entradas de lore (objetivo v1.0)

## [0.1.1] - 2026-06-06

### ⚙️ Mejoras y Correcciones
- Se solucionó un error crítico de inicialización del addon, ahora carga correctamente.
- Se corrigió la carga de la base de datos, las entradas de lore ya no se borran al iniciar.
- La interfaz de usuario ahora es interactiva: los resultados de búsqueda y categorías se muestran como botones clicables.
- Se mejoró la experiencia de búsqueda, la ventana principal permanece abierta al realizar una búsqueda.
- Se corrigió el posicionamiento del icono del botón del minimapa, ahora está centrado correctamente.
- Se implementó un workflow de GitHub Actions para generar automáticamente el `.zip` del addon al crear un tag.
- Se limpió el diseño del repositorio, colocando todos los archivos y carpetas directamente en el directorio raíz.

## [0.1.0] - 2026-06-06

### ✨ Añadido
- Lanzamiento inicial del addon
- **Base de datos con 46 entradas** del lore de WoW en 5 categorías.
- **Línea temporal completa** desde los Titanes hasta Midnight
- Interfaz gráfica con mainframe y botón de minimapa arrastrables.
- Motor de búsqueda con soporte fuzzy (tolerante a typos) y relevancia.
- Localización en español.

[Unreleased]: https://github.com/minyorange/codex-of-azeroth/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/minyorange/codex-of-azeroth/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/minyorange/codex-of-azeroth/releases/tag/v0.1.0
