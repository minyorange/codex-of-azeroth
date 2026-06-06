# 📜 Changelog

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

## [0.1.0] - 2026-06-06

### ✨ Añadido
- Lanzamiento inicial del addon
- **Base de datos con 46 entradas** del lore de WoW:
  - 11 NPCs principales (Thrall, Jaina, Sylvanas, Illidan, Arthas, Anduin, Varian, Varok Saurfang, Malfurion, Tyrande, Garrosh, Uther, Vol'jin, Durotan, Tirion)
  - 11 Lugares (Orgrimmar, Ventormenta, Dalaran, Monte Hyjal, Theramore, Karazhan, Shattrath, Rasganorte, Pandaria, Cementerio de Dragones, Pico de la Nieve Eterna, Luna de Plata, Terrallende)
  - 10 Facciones (Horda, Alianza, Kirin Tor, Mano de Plata, Cenarion, Vuelos Dragón, Legión Ardiente, Titanes, Draenei, Renegados, Cruzada Argenta)
  - 8 Eventos Históricos (Guerra de los Ancestros, Primera, Segunda, Tercera Guerra, Invasión de la Legión, Cuarta Guerra, Crisis de las Almas, Catástrofe)
  - 6 Conceptos (Luz, Vacío, Más Allá, Sueño Esmeralda, Dioses Antiguos, Pozo de la Eternidad)
- **Línea temporal completa** desde los Titanes hasta The War Within
- **Interfaz gráfica** con:
  - Sidebar de categorías navegable
  - Vista de entrada detallada con scroll
  - Ventana principal redimensionable y arrastrable
  - Botón de minimapa arrastrable
- **Motor de búsqueda** con:
  - Búsqueda fuzzy (tolerante a typos)
  - Normalización de acentos
  - Sistema de relevancia con scoring
  - Historial de búsquedas
- **Slash commands**:
  - `/coa` o `/codex` - Abrir/cerrar ventana
  - `/coa <id>` - Abrir entrada específica
  - `/coa buscar` - Enfocar búsqueda
  - `/coa ayuda` - Mostrar ayuda
- **Sistema de eventos** robusto y extensible
- **Localización en español** completa
- **100% offline** - sin dependencias externas
- **Standalone** - sin necesidad de librerías externas

### 📝 Notas
- Las descripciones del lore son **resúmenes originales** que citan las fuentes oficiales
- Compatible con la API 12.0+ (Midnight)
- Probado y verificado para uso en WoW Retail

[Unreleased]: https://github.com/minyorange/codex-of-azeroth/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/minyorange/codex-of-azeroth/releases/tag/v0.1.0
