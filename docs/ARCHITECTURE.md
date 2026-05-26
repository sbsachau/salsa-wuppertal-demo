# ARCHITECTURE — SalsaWuppertal.com

## System-Übersicht

```
┌─────────────────────────────────────────────────────┐
│                   BROWSER (Daniel)                   │
│              Chrome / Safari / Mobile                │
└────────────────────┬────────────────────────────────┘
                     │ HTTPS
┌────────────────────▼────────────────────────────────┐
│                  HOSTINGER                           │
│              (Daniels Hosting)                       │
│  ┌─────────────────────────────────────────────┐    │
│  │              WORDPRESS CORE                  │    │
│  │                                              │    │
│  │  ┌──────────┐  ┌────────────────────────┐   │    │
│  │  │  Astra   │  │     Astra Child Theme  │   │    │
│  │  │  Theme   │  │   (style.css +         │   │    │
│  │  │ (Parent) │  │    functions.php)       │   │    │
│  │  └──────────┘  └────────────────────────┘   │    │
│  │                                              │    │
│  │  ┌──────────────────────────────────────┐   │    │
│  │  │            ELEMENTOR FREE             │   │    │
│  │  │         (Page Builder / Editor)       │   │    │
│  │  └──────────────────────────────────────┘   │    │
│  │                                              │    │
│  │  PLUGINS:                                    │    │
│  │  ┌──────────────┐  ┌──────────────────┐     │    │
│  │  │ The Events   │  │  Contact Form 7  │     │    │
│  │  │  Calendar    │  │  (Kontaktform.)  │     │    │
│  │  └──────────────┘  └──────────────────┘     │    │
│  │                                              │    │
│  │  DATENBANK: MySQL (via Hostinger)            │    │
│  └─────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────┘
```

## Theme-Architektur

```
astra (Parent Theme — NICHT bearbeiten)
└── astra-child (Child Theme — hier wird gearbeitet)
    ├── style.css        ← Alle Custom CSS Variablen & Overrides
    ├── functions.php    ← Enqueue Styles, Scroll-Animation Script, Nav Menus
    └── screenshot.png   ← Theme-Vorschaubild
```

**Warum Child Theme?**
Wenn Astra ein Update bekommt, bleiben alle Custom-Änderungen im Child Theme erhalten. Direktes Bearbeiten des Parent Themes würde bei jedem Update überschrieben.

## Plugin-Architektur

### Elementor Free
- **Rolle:** Visueller Page Builder für alle Hauptseiten
- **Warum:** Daniel kann danach Texte/Bilder per Klick ändern ohne Code
- **Einschränkung:** Einige Widgets nur in Pro — wir nutzen nur Free-Widgets

### The Events Calendar
- **Rolle:** Events und Parties verwalten und anzeigen
- **Warum:** Daniel kann neue Events selbst über WP-Admin eintragen
- **Ansicht:** Listen-View auf Startseite (nächste 4 Events), Vollansicht auf /events

### Contact Form 7
- **Rolle:** Kontaktformular auf /kontakt
- **Warum:** Bewährtes, leichtgewichtiges Plugin, keine Abhängigkeiten
- **E-Mail:** Formular sendet an info@salsawuppertal.com (Platzhalter, Daniel ändert selbst)

## Seitenstruktur (URL-Schema)

```
salsawuppertal.com/              → Startseite (Elementor Canvas)
salsawuppertal.com/events/       → Events & Parties (Elementor Full Width)
salsawuppertal.com/ueber-mich/   → Über Daniel (Elementor Full Width)
salsawuppertal.com/workshops/    → Workshops (Elementor Full Width)
salsawuppertal.com/kontakt/      → Kontakt (Elementor Full Width)
salsawuppertal.com/impressum/    → Impressum (WordPress Standard)
salsawuppertal.com/datenschutz/  → Datenschutz (WordPress Standard)
salsawuppertal.com/disclaimer/   → Disclaimer (WordPress Standard)
```

## CSS-Architektur

```css
/* Ebene 1: CSS Custom Properties (Root-Variablen) */
:root {
  --sw-red: #C8102E;
  /* ... alle Farben als Variablen */
}

/* Ebene 2: Global Resets & Base Styles */
body, h1, h2, ... { }

/* Ebene 3: Component Overrides */
/* Astra-spezifische Selektoren überschreiben */
.site-header { }
.main-header-menu { }

/* Ebene 4: Elementor Overrides */
/* Elementor-Klassen überschreiben */
.elementor-button { }

/* Ebene 5: Plugin Overrides */
/* The Events Calendar, CF7 */
.tribe-events-calendar { }

/* Ebene 6: Utilities */
.reveal { }

/* Ebene 7: Media Queries (Mobile) */
@media (max-width: 768px) { }
@media (max-width: 480px) { }
```

## Daten-Architektur

### WordPress Custom Post Types
- `post` → Blog (optional, nicht im MVP)
- `page` → Alle Hauptseiten
- `tribe_events` → Events (via The Events Calendar)

### Wichtige WordPress-Einstellungen
```
Einstellungen > Allgemein:
  Websitetitel: SalsaWuppertal.com
  Tagline: Salsa, Bachata & mehr in Wuppertal
  
Einstellungen > Lesen:
  Startseite: Statische Seite → "Startseite"
  
Einstellungen > Permalinks:
  Struktur: Beitragsname (/events/, /kontakt/ etc.)
  
Einstellungen > Diskussion:
  Kommentare: Deaktiviert (kein Blog)
```

## Deployment-Architektur

```
Lokale Entwicklung          →          Hostinger Production
(localhost:8881)                       (salsawuppertal.com)

WordPress Playground        →    Duplicator Plugin Export
     (dev)                              (zip + installer.php)
                                              │
                                    FTP Upload auf Hostinger
                                              │
                                    installer.php ausführen
                                              │
                                    URL anpassen (localhost → domain)
                                              │
                                         ✅ Live
```

## Performance-Ziele

| Metrik | Ziel |
|---|---|
| Google PageSpeed Mobile | > 70 |
| First Contentful Paint | < 2.5s |
| Largest Contentful Paint | < 4s |
| Cumulative Layout Shift | < 0.1 |

**Maßnahmen:**
- Unsplash-Bilder mit `?w=1400&q=80` komprimiert
- Google Fonts: nur 2 Familien, subset=latin
- Elementor: Überflüssige CSS-Assets deaktivieren (Elementor > Einstellungen > Avanciert)
- Lazy Loading für alle Bilder unterhalb des Folds
