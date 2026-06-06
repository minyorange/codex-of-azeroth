# 🤝 Guía de Contribución

¡Gracias por tu interés en mejorar **Codex of Azeroth**! Toda ayuda es bienvenida.

## 📋 Formas de Contribuir

- 🐛 **Reportar bugs** abriendo un [Issue](../../issues)
- 💡 **Sugerir funcionalidades** nuevas
- 📝 **Añadir entradas de lore** nuevas o mejorar las existentes
- 🌍 **Traducir** a otros idiomas
- 💻 **Mejorar el código** del addon
- 📚 **Corregir imprecisiones** en las descripciones

## 📝 Cómo Añadir Nuevas Entradas

### 1. Encuentra el archivo correcto

| Categoría | Archivo |
|-----------|---------|
| NPCs (Personajes) | `Data/NPCs.lua` |
| Lugares | `Data/Locations.lua` |
| Facciones | `Data/Factions.lua` |
| Eventos Históricos | `Data/Events.lua` |
| Conceptos del Lore | `Data/Concepts.lua` |

### 2. Sigue el formato establecido

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

### 3. Reglas de Estilo

#### ✅ Lo que SÍ debes hacer:
- Escribir descripciones **originales** con tus propias palabras
- **Citar las fuentes** (juegos, novelas, comics)
- Mantener el mismo nivel de detalle que las entradas existentes
- Usar IDs en minúsculas y sin espacios (usar guiones bajos)
- Añadir tags relevantes para facilitar la búsqueda
- Vincular entradas relacionadas con sus IDs

#### ❌ Lo que NO debes hacer:
- ❌ Copiar texto verbatim de novelas o scripts del juego
- ❌ Incluir spoilers de expansiones muy recientes sin marcar
- ❌ Usar IDs duplicados (cada uno debe ser único)
- ❌ Añadir imágenes externas (solo iconos del juego: `Interface\Icons\...`)
- ❌ Incluir información sin fuente verificable

## 🐛 Reportar Bugs

Al reportar un bug, incluye:

1. **Versión del addon** (visible con `/coa version`)
2. **Versión del juego** (ej: 11.0.5 - The War Within)
3. **Pasos para reproducir** el bug
4. **Comportamiento esperado** vs **comportamiento actual**
5. **Capturas de pantalla** si es posible
6. **Mensajes de error** de la consola (abre con `/console` o presiona `~`)

## 💡 Sugerir Funcionalidades

Abre un Issue con la etiqueta `enhancement` describiendo:
- **Qué quieres** que haga el addon
- **Por qué** sería útil
- **Cómo** lo implementarías (opcional)

## 🌍 Traducción

Para añadir un nuevo idioma:

1. Crea un archivo `Locale/<codigo>.lua` (ej: `frFR.lua`)
2. Copia la estructura de `Locale/esES.lua`
3. Traduce los valores (NO las claves)
4. Añade el código a la línea `## X-Localizations:` en el `.toc`
5. Actualiza el sistema de selección de idioma en `Locale/<codigo>.lua`

## 🔄 Proceso de Pull Request

1. **Fork** el repositorio
2. Crea una **rama** con un nombre descriptivo:
   ```bash
   git checkout -b feature/anadir-entradas-bfa
   ```
3. Realiza tus cambios
4. **Commitea** con mensajes descriptivos:
   ```bash
   git commit -m "Añade 5 entradas nuevas de la Cuarta Guerra"
   ```
5. **Push** a tu fork:
   ```bash
   git push origin feature/anadir-entradas-bfa
   ```
6. Abre un **Pull Request** describiendo tus cambios

## 📜 Código de Conducta

- Sé respetuoso con otros contribuidores
- Acepta críticas constructivas
- Enfócate en lo que es mejor para la comunidad
- No uses lenguaje ofensivo ni ataques personales

## ❓ ¿Dudas?

Si tienes alguna pregunta, abre un Issue con la etiqueta `question`.

---

¡Gracias por hacer de Codex of Azeroth un mejor recurso para la comunidad! 🎉
