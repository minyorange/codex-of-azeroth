# 📜 Changelog

*Read this in other languages: [English](#english) | [Español](#español)*

---

## English

All notable changes to Codex of Azeroth will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-06-09

### Added
- Full OOP architecture with metatable-based class system (`Core/Class.lua`)
- English locale (`enUS`/`enGB`) support via automatic client detection
- **3D model viewer** with drag-to-rotate (`UI/ModelView.lua`) — shows NPC models via `PlayerModel:SetDisplayInfo`
- `displayId` field hardcoded for all 15 NPC entries (Retail CreatureDisplayDB IDs)
- Tab system in entry view: Lore / Related / Sources with dynamic content switching
- Dynamic minimap button radius adapting to Minimap size
- Proportional content resizing when window is resized

### Fixed
- **Critical**: `msg:trim()` crash on `/coa` slash commands (Lua 5.1 polyfill in `Helpers.lua`)
- **Critical**: `:trim()` in `Database:NormalizeKey()` causing errors on expansion indexing
- **Critical**: Wrong method syntax on `CoA.Timeline:Debug` (colon used in static assignment)
- Removed dual initialization race condition in `LoreData.lua`
- Removed orphan `SavedVariables` declarations (never persisted)

### Changed
- **Adventure Guide UI**: completely redesigned layout — dark backdrop, gold borders, sidebar nav with category icons
- Complete codebase refactored to OOP with metatables (`Coa.Class:extend()` / `:new()`)
- `Core/Codex.lua` → `Core/Init.lua` (lightweight bootstrap)
- `UI/Categories.lua` → `UI/Sidebar.lua` (class-based, icon buttons, active state)
- `UI/CodeEntry.lua` → `UI/EntryView.lua` (class-based with tabbed content)
- `UI/ModelView.lua` created — rotatable PlayerModel integration
- Search bar moved to **footer** of main frame (Adventure Guide style)
- Event system extracted to `Core/EventManager.lua`
- Color constants centralized in `Core/Colors.lua`
- Utility functions (trim, etc.) in `Core/Helpers.lua`
- `Database:GetAll()` now uses cache to avoid O(n log n) sort on every call
- Hardcoded UI strings moved to localization
- All UI labels properly shown/hidden to prevent overlay artifacts

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

## [0.2.0] - 2026-06-09

### Añadido
- Arquitectura OOP completa con sistema de clases basado en metatables (`Core/Class.lua`)
- Soporte de localización en inglés (`enUS`/`enGB`) con detección automática del cliente
- **Visor de modelos 3D** con rotación por arrastre (`UI/ModelView.lua`) — muestra modelos de PNJs mediante `PlayerModel:SetDisplayInfo`
- Campo `displayId` codificado para las 15 entradas de PNJ (IDs de CreatureDisplayDB Retail)
- Sistema de pestañas en la vista de entrada: Lore / Relacionadas / Fuentes con cambio dinámico de contenido
- Botón de minimapa con radio dinámico adaptado al tamaño del minimapa
- Redimensionamiento proporcional del contenido al escalar la ventana

### Corregido
- **Crítico**: Crash en `msg:trim()` al usar comandos `/coa` (polyfill para Lua 5.1 en `Helpers.lua`)
- **Crítico**: Error en `:trim()` en `Database:NormalizeKey()` al indexar por expansión
- **Crítico**: Sintaxis incorrecta en `CoA.Timeline:Debug` (uso de ':' en asignación estática)
- Eliminada condición de carrera de doble inicialización en `LoreData.lua`
- Eliminadas declaraciones huérfanas de `SavedVariables` (nunca persistidas)

### Cambiado
- **UI estilo Guía de Aventuras**: diseño completamente rediseñado — fondo oscuro, bordes dorados, navegación lateral con iconos de categoría
- Código completamente refactorizado a OOP con metatables (`Coa.Class:extend()` / `:new()`)
- `Core/Codex.lua` → `Core/Init.lua` (bootstrap ligero)
- `UI/Categories.lua` → `UI/Sidebar.lua` (basado en clases, botones con iconos, estado activo)
- `UI/CodeEntry.lua` → `UI/EntryView.lua` (basado en clases con contenido por pestañas)
- `UI/ModelView.lua` creado — integración de PlayerModel rotable
- Barra de búsqueda movida al **pie** de la ventana principal (estilo Guía de Aventuras)
- Sistema de eventos extraído a `Core/EventManager.lua`
- Constantes de color centralizadas en `Core/Colors.lua`
- Utilidades (trim, etc.) en `Core/Helpers.lua`
- `Database:GetAll()` ahora usa caché para evitar sort O(n log n) en cada llamada
- Strings hardcodeados de la UI movidos a localización
- Labels de UI correctamente ocultadas para evitar artefactos visuales

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

[Unreleased]: https://github.com/minyorange/codex-of-azeroth/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/minyorange/codex-of-azeroth/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/minyorange/codex-of-azeroth/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/minyorange/codex-of-azeroth/releases/tag/v0.1.0
