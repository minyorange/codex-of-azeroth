# Changelog

---

## English

Every version tells a story. Here's what changed, why, and what it means for you.

---

### [0.2.1] — June 2026

Bugfix release — squashed all Lua errors and polished the UI for retail WoW 11.0.7.

**What we fixed**

- Fixed a Lua 5.1 syntax error in `Class.lua` (`obj:constructor` → `obj.constructor`).
- Removed a circular metatable in `Init.lua` that caused infinite "loop in gettable" errors.
- Added compatibility guards for `SetMinResize` / `SetMaxResize` (not available in WoW 11.0.7).
- Exported `SearchBar` class (was missing `CoA.SearchBar = SearchBar` at the end of the file).
- Fixed `ModelView` rotation by tracking rotation locally instead of calling `GetRotation()` (not available in WoW 11.0.7).
- Fixed the sidebar NPCs icon by correcting the texture path to `INV_Misc_Head_Orc_01`.
- Added icons to entry list buttons so every entry shows its icon in search results and category lists.
- Replaced tab button textures with `BackdropTemplate` for pixel-perfect centering of text.
- Fixed scroll frame content overflow by dynamically calculating content height.
- Repositioned the search bar to sit right below the entry view instead of at the window bottom.

---

### [0.2.0] — June 2026

This was the big one. Almost everything was rewritten from the ground up.

**What's new**

- **3D model viewer.** Select an NPC and rotate their model with your mouse. Thrall, Jaina, Illidan, Arthas — all 15 characters have their in-game model attached. You can now see them as they appear in the world, right inside the codex.

- **English language support.** The addon now detects your game language automatically. If you play in English, you'll see everything in English. If you play in Spanish, you'll see it in Spanish. No configuration needed.

- **A proper class system.** The entire codebase was refactored into clean, object-oriented Lua. This means the addon is faster, more stable, and much easier to maintain and extend.

- **Tabbed entries.** Each entry now has three tabs: Lore, Related, and Sources. Click between them instead of scrolling through one long wall of text.

- **Adventure Guide redesign.** The whole interface was redesigned to match the look and feel of WoW's Adventure Guide: dark backgrounds, gold borders, category icons in the sidebar, and the search bar moved to the bottom of the window.

**What we fixed**

- The addon no longer crashes when you type `/coa` commands (a Lua 5.1 compatibility issue).
- The database no longer clears itself when you log in.
- The "All entries" button in the sidebar now properly highlights when selected.
- Removed some orphan code and fixed inconsistent indentation.
- Removed saved variables that were declared but never used.

**What changed**

- The core, search engine, database, and UI were all rewritten as separate class-based modules.
- Event handling, colors, and helper functions were moved to their own files for cleaner organization.
- The search bar now lives at the bottom of the window, like in the Adventure Guide.
- All hardcoded text was moved to language files, making future translations much easier.

---

### [0.1.1] — June 2026

A round of bug fixes and polish.

**What we fixed**

- The addon now loads correctly on startup (critical init bug was squashed).
- Lore entries are no longer wiped when PLAYER_LOGIN fires.
- Search results and category lists are now proper clickable buttons.
- The minimap button icon is now perfectly centered.
- Set up GitHub Actions to automatically package releases.

---

### [0.1.0] — June 2026

The very first release.

**What shipped**

- 46 lore entries across 5 categories: characters, locations, factions, events, and concepts.
- A complete chronological timeline from the Titans to The War Within and Midnight.
- A fuzzy search engine that tolerates typos and accents.
- A draggable main window and minimap button.
- Spanish localization.

---

## Español

Cada versión cuenta una historia. Aquí está lo que cambió, por qué, y qué significa para ti.

---

### [0.2.1] — Junio 2026

Versión de corrección — eliminados todos los errores de Lua y pulida la interfaz para WoW Retail 11.0.7.

**Lo que arreglamos**

- Corregido un error de sintaxis en Lua 5.1 en `Class.lua` (`obj:constructor` → `obj.constructor`).
- Eliminada una metatabla circular en `Init.lua` que causaba errores infinitos de "loop in gettable".
- Añadidas comprobaciones de compatibilidad para `SetMinResize` / `SetMaxResize` (no disponibles en WoW 11.0.7).
- Exportada la clase `SearchBar` (faltaba `CoA.SearchBar = SearchBar` al final del archivo).
- Corregida la rotación de `ModelView` usando una variable local en lugar de `GetRotation()` (no disponible en WoW 11.0.7).
- Corregido el icono de PNJs en la barra lateral usando la ruta correcta `INV_Misc_Head_Orc_01`.
- Añadidos iconos a los botones de lista de entradas para que cada entrada muestre su icono.
- Reemplazadas las texturas de las pestañas por `BackdropTemplate` para un centrado perfecto del texto.
- Corregido el desbordamiento del contenido del scroll calculando la altura dinámicamente.
- Reposicionada la barra de búsqueda justo debajo de la vista de entrada en lugar de en la parte inferior de la ventana.

---

### [0.2.0] — Junio 2026

Esta fue la grande. Casi todo se reescribió desde cero.

**Lo nuevo**

- **Visor de modelos 3D.** Selecciona un PNJ y gira su modelo con el ratón. Thrall, Jaina, Illidan, Arthas — los 15 personajes tienen su modelo del juego adjunto. Ahora puedes verlos tal como aparecen en el mundo, dentro del códice.

- **Soporte de inglés.** El addon ahora detecta el idioma de tu juego automáticamente. Si juegas en inglés, verás todo en inglés. Si juegas en español, lo verás en español. Sin configuración.

- **Un sistema de clases limpio.** Todo el código fue refactorizado a Lua orientado a objetos. El addon es más rápido, más estable y mucho más fácil de mantener y ampliar.

- **Entradas con pestañas.** Cada entrada tiene ahora tres pestañas: Lore, Relaciones y Fuentes. Cambia entre ellas con un clic en lugar de desplazarte por un muro de texto.

- **Rediseño estilo Guía de Aventuras.** Toda la interfaz fue rediseñada para parecerse a la Guía de Aventuras de WoW: fondos oscuros, bordes dorados, iconos de categoría en la barra lateral y la búsqueda en la parte inferior.

**Lo que arreglamos**

- El addon ya no se rompe al escribir comandos `/coa` (problema de compatibilidad con Lua 5.1).
- La base de datos ya no se borra sola al iniciar sesión.
- El botón "Todas las entradas" ahora se resalta correctamente al seleccionarlo.
- Eliminamos código huérfano y corregimos indentaciones inconsistentes.
- Eliminamos variables guardadas que estaban declaradas pero nunca se usaban.

**Lo que cambió**

- El núcleo, el buscador, la base de datos y la interfaz se reescribieron como módulos independientes basados en clases.
- El manejo de eventos, los colores y las funciones auxiliares se movieron a sus propios archivos.
- La barra de búsqueda ahora está en la parte inferior de la ventana, como en la Guía de Aventuras.
- Todo el texto hardcodeado se movió a archivos de idioma, facilitando traducciones futuras.

---

### [0.1.1] — Junio 2026

Una ronda de correcciones y pulido.

**Lo que arreglamos**

- El addon ahora carga correctamente al iniciar el juego (error crítico de inicialización resuelto).
- Las entradas de lore ya no se borran cuando se dispara PLAYER_LOGIN.
- Los resultados de búsqueda y las listas de categorías ahora son botones cliqueables.
- El icono del botón del minimapa está perfectamente centrado.
- Configuramos GitHub Actions para empaquetar lanzamientos automáticamente.

---

### [0.1.0] — Junio 2026

El primer lanzamiento.

**Lo que incluía**

- 46 entradas de lore en 5 categorías: personajes, lugares, facciones, eventos y conceptos.
- Una línea temporal cronológica completa desde los Titanes hasta The War Within y Midnight.
- Un motor de búsqueda difusa que tolera errores tipográficos y acentos.
- Una ventana principal arrastrable y un botón de minimapa.
- Localización en español.

---

*Made with love for the WoW community — Hecho con amor para la comunidad de WoW*
