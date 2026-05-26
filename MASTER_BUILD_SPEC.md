# MASTER BUILD SPEC — SalsaWuppertal.com
**Vollständiger Schritt-für-Schritt Bauplan für GitHub Copilot**

> Lies zuerst `.github/copilot-instructions.md` und alle Dateien in `/docs/` bevor du anfängst.

---

## SCHRITT 1 — Plugins & Theme installieren

Navigiere zu http://localhost:8881/wp-admin/

### 1a — Astra Theme installieren
```
Design > Themes > Neu hinzufügen
Suche: "Astra"
Installieren → Aktivieren
```

### 1b — Plugins installieren
```
Plugins > Installieren
Installiere und aktiviere folgende Plugins (in dieser Reihenfolge):

1. "Elementor"               (von Elementor.com)
2. "The Events Calendar"     (von The Events Calendar)
3. "Contact Form 7"          (von Takayuki Miyoshi)
4. "Duplicator"              (von Snap Creek) ← für späteres Deployment
```

---

## SCHRITT 2 — Child Theme erstellen

Erstelle diese Dateistruktur. Die Dateien müssen auf dem Realsystem (nicht im Playground UI) erstellt und dann hochgeladen werden:

### 2a — Ordnerstruktur
```
wp-content/themes/astra-child/
├── style.css
├── functions.php
└── screenshot.png
```

### 2b — style.css (vollständig)
```css
/*
 Theme Name:   Astra Child — SalsaWuppertal
 Theme URI:    https://salsawuppertal.com
 Description:  Child Theme für SalsaWuppertal.com
 Author:       Custom
 Template:     astra
 Version:      1.0.0
 Text Domain:  astra-child
*/

@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,700;1,400&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500&display=swap');

/* ── CUSTOM PROPERTIES ── */
:root {
  --sw-red:       #C8102E;
  --sw-red-light: #e8213f;
  --sw-black:     #0e0e0e;
  --sw-gray:      #666666;
  --sw-light:     #f6f4f1;
  --sw-white:     #ffffff;
  --sw-rose:      #ff8fa3;
}

/* ── GLOBAL ── */
body {
  font-family: 'DM Sans', sans-serif !important;
  color: var(--sw-black);
  -webkit-font-smoothing: antialiased;
}

/* ── HEADINGS ── */
h1, h2, h3, h4, h5, h6,
.entry-title,
.elementor-heading-title {
  font-family: 'Playfair Display', serif !important;
  letter-spacing: -0.02em;
}

/* ── NAVIGATION ── */
.site-header,
#masthead {
  background: rgba(255,255,255,0.95) !important;
  backdrop-filter: blur(16px);
  border-bottom: 1px solid rgba(0,0,0,0.07) !important;
  position: sticky !important;
  top: 0 !important;
  z-index: 999 !important;
}

.ast-site-identity .site-title a,
.ast-site-identity .site-title {
  font-family: 'Playfair Display', serif !important;
  color: var(--sw-black) !important;
  font-size: 1.2rem !important;
  text-decoration: none !important;
}

.main-navigation .menu-item > a,
.ast-flex-last-item a,
.main-header-menu .menu-item > a {
  font-size: 0.82rem !important;
  font-weight: 500 !important;
  letter-spacing: 0.05em !important;
  text-transform: uppercase !important;
  color: var(--sw-gray) !important;
  transition: color 0.2s !important;
}

.main-navigation .menu-item > a:hover,
.main-header-menu .menu-item > a:hover {
  color: var(--sw-red) !important;
}

/* Header CTA Button */
.ast-header-button-1 .ast-custom-button,
.ast-header-custom-item .ast-custom-button {
  background: var(--sw-red) !important;
  color: white !important;
  border-radius: 2px !important;
  padding: 0.55rem 1.2rem !important;
  font-size: 0.8rem !important;
  font-weight: 500 !important;
  letter-spacing: 0.04em !important;
  text-transform: uppercase !important;
  transition: background 0.2s !important;
  border: none !important;
}

.ast-header-button-1 .ast-custom-button:hover {
  background: var(--sw-red-light) !important;
}

/* ── BUTTONS (Global) ── */
.ast-btn,
.elementor-button,
.wp-block-button__link,
input[type="submit"],
button[type="submit"] {
  background: var(--sw-red) !important;
  color: white !important;
  border-radius: 2px !important;
  letter-spacing: 0.05em !important;
  text-transform: uppercase !important;
  font-size: 0.85rem !important;
  font-weight: 500 !important;
  font-family: 'DM Sans', sans-serif !important;
  transition: background 0.2s, transform 0.2s !important;
  border: none !important;
  cursor: pointer !important;
}

.ast-btn:hover,
.elementor-button:hover {
  background: var(--sw-red-light) !important;
  transform: translateY(-2px);
}

/* ── ELEMENTOR OVERRIDES ── */
.elementor-widget-text-editor p {
  font-family: 'DM Sans', sans-serif;
  line-height: 1.8;
  color: var(--sw-gray);
}

/* Section Tags (kleine Oberschriften in Rot) */
.sw-section-tag {
  display: block;
  font-size: 0.72rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--sw-red);
  margin-bottom: 0.8rem;
  font-family: 'DM Sans', sans-serif;
}

/* ── EVENTS CALENDAR OVERRIDES ── */
.tribe-events-calendar th {
  background: var(--sw-black);
  color: white;
  border-color: rgba(255,255,255,0.1);
}

.tribe-events-calendar td.tribe-has-events {
  background: rgba(200,16,46,0.05);
}

.tribe-events-calendar td.tribe-has-events a {
  color: var(--sw-red);
}

.tribe-events-list .tribe-event-schedule-details {
  color: var(--sw-gray);
  font-size: 0.85rem;
}

.tribe-events-list article {
  border-bottom: 1px solid rgba(0,0,0,0.08) !important;
  padding-bottom: 1.5rem;
  margin-bottom: 1.5rem;
}

.tribe-events-list .tribe-event-url,
.tribe-events-list .tribe-event-schedule-details a {
  color: var(--sw-red) !important;
}

/* ── CONTACT FORM 7 ── */
.wpcf7-form input[type="text"],
.wpcf7-form input[type="email"],
.wpcf7-form textarea {
  width: 100%;
  padding: 0.8rem 1rem;
  border: 1.5px solid #e0e0e0;
  border-radius: 2px;
  font-family: 'DM Sans', sans-serif;
  font-size: 0.95rem;
  transition: border-color 0.2s;
  background: white;
}

.wpcf7-form input:focus,
.wpcf7-form textarea:focus {
  outline: none;
  border-color: var(--sw-red);
}

.wpcf7-form textarea {
  min-height: 140px;
  resize: vertical;
}

.wpcf7-form input[type="submit"] {
  background: var(--sw-red) !important;
  color: white !important;
  padding: 0.9rem 2.5rem;
  border: none;
  border-radius: 2px;
  cursor: pointer;
  font-size: 0.85rem;
  font-weight: 500;
  letter-spacing: 0.05em;
  text-transform: uppercase;
  transition: background 0.2s, transform 0.2s;
  width: 100%;
  margin-top: 0.5rem;
}

.wpcf7-form input[type="submit"]:hover {
  background: var(--sw-red-light) !important;
  transform: translateY(-2px);
}

/* ── FOOTER ── */
.site-footer,
#colophon {
  background: var(--sw-black) !important;
  color: rgba(255,255,255,0.35) !important;
}

.site-footer a,
#colophon a {
  color: rgba(255,255,255,0.35) !important;
  transition: color 0.2s;
}

.site-footer a:hover,
#colophon a:hover {
  color: white !important;
}

.ast-footer-copyright {
  color: rgba(255,255,255,0.35) !important;
}

/* ── SCROLL REVEAL ── */
.elementor-widget-wrap > .elementor-widget {
  opacity: 0;
  transform: translateY(28px);
  transition: opacity 0.7s ease, transform 0.7s ease;
}

.elementor-widget-wrap > .elementor-widget.sw-revealed {
  opacity: 1;
  transform: none;
}

/* ── MOBILE ── */
@media (max-width: 768px) {
  .ast-mobile-menu-trigger svg {
    fill: var(--sw-red);
  }

  .ast-site-identity .site-title a {
    font-size: 1rem !important;
  }

  .elementor-column {
    width: 100% !important;
  }

  .wpcf7-form input[type="submit"] {
    max-width: 100%;
  }
}

@media (max-width: 480px) {
  body { font-size: 0.95rem; }
}
```

### 2c — functions.php (vollständig)
```php
<?php
/**
 * Astra Child Theme — SalsaWuppertal.com
 */

// 1. Parent + Child Styles laden
add_action('wp_enqueue_scripts', function() {
    wp_enqueue_style(
        'astra-parent-style',
        get_template_directory_uri() . '/style.css'
    );
    wp_enqueue_style(
        'astra-child-style',
        get_stylesheet_uri(),
        ['astra-parent-style'],
        '1.0.0'
    );
});

// 2. Scroll-Reveal Script
add_action('wp_footer', function() { ?>
<script>
(function() {
    'use strict';
    var observer = new IntersectionObserver(function(entries) {
        entries.forEach(function(entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('sw-revealed');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

    // Alle Elementor-Widgets beobachten
    function initReveal() {
        document.querySelectorAll('.elementor-widget-wrap > .elementor-widget')
            .forEach(function(el) {
                observer.observe(el);
            });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initReveal);
    } else {
        initReveal();
    }
})();
</script>
<?php });

// 3. Navigationsmenüs registrieren
add_action('init', function() {
    register_nav_menus([
        'primary' => __('Hauptmenü', 'astra-child'),
        'footer'  => __('Footer-Menü', 'astra-child'),
    ]);
});

// 4. Kommentare global deaktivieren
add_action('init', function() {
    remove_post_type_support('post', 'comments');
    remove_post_type_support('page', 'comments');
});
add_filter('comments_open', '__return_false', 20, 2);
add_filter('pings_open', '__return_false', 20, 2);

// 5. Excerpt-Länge
add_filter('excerpt_length', function() { return 20; });

// 6. Elementor Widget Kategorien erweitern (optional)
add_action('elementor/widgets/register', function($manager) {
    // Hier können später Custom Widgets registriert werden
});
```

### 2d — Child Theme aktivieren
```
Design > Themes > "Astra Child — SalsaWuppertal" > Aktivieren
```

---

## SCHRITT 3 — WordPress Grundeinstellungen

```
Einstellungen > Allgemein:
  Websitetitel: SalsaWuppertal.com
  Tagline: Salsa, Bachata & mehr in Wuppertal
  E-Mail-Adresse: info@salsawuppertal.com
  
Einstellungen > Lesen:
  Startseite anzeigen: Statische Seite
  (wird nach Schritt 4 gesetzt)
  
Einstellungen > Permalinks:
  Gemeinsame Einstellungen: Beitragsname
  Speichern
  
Einstellungen > Diskussion:
  Kommentarfunktion: Alle Häkchen entfernen
```

---

## SCHRITT 4 — Seiten erstellen

Seiten > Neu hinzufügen — erstelle folgende Seiten:

| Titel | Slug | Template |
|---|---|---|
| Startseite | startseite | Elementor Canvas |
| Events & Parties | events | Elementor Full Width |
| Über mich | ueber-mich | Elementor Full Width |
| Workshops | workshops | Elementor Full Width |
| Kontakt | kontakt | Elementor Full Width |
| Impressum | impressum | Standard WordPress |
| Datenschutz | datenschutz | Standard WordPress |
| Disclaimer | disclaimer | Standard WordPress |

Danach:
```
Einstellungen > Lesen:
  Startseite: "Startseite"
  Blogseite: (keine)
```

---

## SCHRITT 5 — Navigation aufbauen

### 5a — Hauptmenü
```
Design > Menüs > Neues Menü erstellen
Name: "Hauptmenü"
Anzeige-Position: Primary Menu ✓

Menüpunkte hinzufügen:
1. Seite: "Events & Parties"    → Label: "Events"
2. Seite: "Über mich"           → Label: "Über Daniel"
3. Benutzerdefiniert URL:
   URL: #tanzstile
   Label: Tanzstile
4. Seite: "Kontakt"
```

### 5b — Footer-Menü
```
Neues Menü: "Footer-Menü"
Anzeige-Position: Footer Menu ✓

Menüpunkte:
1. Seite: "Impressum"
2. Seite: "Datenschutz"
3. Seite: "Disclaimer"
```

---

## SCHRITT 6 — Astra Customizer

Design > Customizer:

### 6a — Global
```
Global > Farben:
  Primärfarbe: #C8102E
  Link-Farbe: #C8102E
  Link-Hover: #e8213f

Global > Schriften:
  Body Font: DM Sans, Größe: 16px
  Heading Font: Playfair Display
```

### 6b — Header
```
Header > Primary Header:
  Layout: Logo links, Menü rechts
  
Header > Site Identity:
  Site Title: SalsaWuppertal.com
  (Logo: kann Daniel später selbst hochladen)
  
Header > Primary Menu:
  (Schrift wird via Child Theme CSS geregelt)
  
Header > Button:
  Text: Nächste Party
  URL: /events/
  Hintergrundfarbe: #C8102E
  Text: #ffffff
  Hover BG: #e8213f
  Border Radius: 2px
```

### 6c — Footer
```
Footer > Footer Bar:
  Layout: Links: Copyright | Rechts: Footer-Menü
  Copyright Text: © 2025 SalsaWuppertal.com · Mit ❤ aus Wuppertal
  Hintergrundfarbe: #0e0e0e
  Text: rgba(255,255,255,0.35)
```

---

## SCHRITT 7 — Elementor: STARTSEITE

Seiten > Startseite > Mit Elementor bearbeiten

### SEKTION A: HERO (Vollbild)

```
Neue Sektion hinzufügen → 1 Spalte
Sektion Einstellungen:
  Layout > Min. Höhe: 100vh
  Hintergrund > Klassisch:
    Bild-URL: https://images.unsplash.com/photo-1504609813442-a8924e83f76e?w=1400&q=80
    Größe: Cover
    Position: Center 30%
  Hintergrundüberlagerung:
    Farbe: #000000
    Deckkraft: 0 (oben) → 0.78 (unten) via Gradient
    Typ: Gradient
    Von: rgba(0,0,0,0.20) Position: 0%
    Zu: rgba(0,0,0,0.78) Position: 100%
    Winkel: 180°
  Inhalt > Vertikal ausrichten: Flex Ende

Spalten-Einstellungen:
  Padding: 4rem oben, 8% links, 5rem unten

Widgets in der Spalte:

Widget 1 — Überschrift:
  Text: "Wuppertal · Karibische Tänze"
  Tag: p
  Stil: Farbe rgba(255,255,255,0.65), Größe 0.72rem, 
        Uppercase, Letter Spacing 0.14em
        
Widget 2 — Überschrift:
  Text: Erlebe die <em>Leidenschaft</em> des Tanzes.
  Tag: H1
  HTML: Erlebe die<br><em style="color:#ff8fa3;font-style:italic">Leidenschaft</em><br>des Tanzes.
  Stil: Playfair Display, clamp(2.6rem, 7vw, 5rem), Farbe #ffffff
  
Widget 3 — Text:
  "Salsa, Bachata, Merengue, Chachachá und Kizomba – mitten in Wuppertal.
   Workshops, Parties und mehr für alle Levels."
  Stil: Farbe rgba(255,255,255,0.72), 1rem, Font Weight 300
  Max-Breite: 460px
  
Widget 4 — Schaltflächen (2 Buttons nebeneinander):
  Button 1:
    Text: Zu den Events
    Link: /events/
    Stil: Gefüllt, BG #C8102E, Text weiß, Radius 2px
    
  Button 2:
    Text: Über Daniel
    Link: /ueber-mich/
    Stil: Outline, Rahmen weiß, Text weiß, BG transparent
```

---

### SEKTION B: TANZSTILE

```
Neue Sektion → 1 Spalte
Einstellungen:
  BG: #ffffff
  Padding: 7rem 8%
  
Zeile 1: Section Header
  Widget — Text (Klasse: sw-section-tag):
    "WAS WIR TANZEN"
    
  Widget — Überschrift H2:
    "Fünf Stile. Eine Leidenschaft."

Zeile 2: 5-spaltige Sektion (5 × 20%)
  Jede Spalte erhält ein Inner Section Widget mit:
  
  Karte 01 — Salsa:
    Text groß: "01" (Playfair Display, 2rem, Farbe rgba(200,16,46,0.12))
    Überschrift H3: "Salsa"
    Text: "Rhythmisch, feurig, lebendig – der klassische karibische Tanz."
    Spalten-BG on hover: #f6f4f1 (via CSS Klasse)
    
  Karte 02 — Bachata:
    "02" / "Bachata" / "Sinnlich und ausdrucksstark. Aus der Dominikanischen Republik."
    
  Karte 03 — Merengue:
    "03" / "Merengue" / "Einfach zu lernen, schwer zu vergessen."
    
  Karte 04 — Chachachá:
    "04" / "Chachachá" / "Spielerisch, verspielt – mit dem unverkennbaren Cha-Cha-Schritt."
    
  Karte 05 — Kizomba:
    "05" / "Kizomba" / "Sanft und verbunden. Angolanisch, modern, hypnotisierend."

CSS für die Karten-Grid-Linie (in Elementor > Erweitert > Benutzerdefiniertes CSS):
.elementor-column { border-right: 1px solid #e5e5e5; }
.elementor-column:last-child { border-right: none; }
```

---

### SEKTION C: EVENTS VORSCHAU (Dark)

```
Neue Sektion → 1 Spalte
Einstellungen:
  BG: #0e0e0e
  Padding: 7rem 8%
  
Widgets:
  Text (sw-section-tag, Farbe rgba(255,100,120,0.8)): "WAS KOMMT"
  Überschrift H2 (Farbe weiß): "Nächste Events & Parties."
  
  Widget — The Events Calendar (wenn verfügbar):
    Ansicht: Liste
    Anzahl: 4
    
  (Falls Widget nicht in Elementor Free verfügbar:
   Widget — Shortcode: [tribe_events_list limit="4"]
   Dann Custom CSS für Dark Mode anpassen)
   
  Button: "Alle Events anzeigen"
    Link: /events/
    Stil: Outline weiß
    Ausrichtung: Zentriert
    Margin-Top: 2rem
```

---

### SEKTION D: ÜBER DANIEL

```
Neue Sektion → 2 Spalten (50% / 50%)
Einstellungen:
  BG: #ffffff
  Padding: 7rem 8%
  Vertikal ausrichten: Mitte
  
Spalte Links:
  Widget — Bild:
    URL: https://images.unsplash.com/photo-1545959570-a94084071b5d?w=600&q=80
    Alt: Paartanz Salsa
    Größe: Voll
    Custom CSS: object-fit: cover; aspect-ratio: 4/5; border-radius: 2px;
    
Spalte Rechts:
  Text (sw-section-tag): "ÜBER MICH"
  Überschrift H2: "Hallo,⏎ich bin Daniel."
  Text: 
    "Seit Jahren bringe ich die Energie und Leidenschaft karibischer Tänze
     nach Wuppertal und Umgebung. Bei mir lernst du nicht nur Schritte –
     du entdeckst eine ganze Welt voller Rhythmus, Verbindung und Freude."
  
  Text mit Zitatstil (Custom CSS: border-left:3px solid #C8102E; padding:1rem 1.5rem; background:#f6f4f1;):
    "„Wir lieben Salsa, Bachata, Merengue, Chachachá und Kizomba – 
     und möchten diese Leidenschaft mit euch teilen.""
     
  Button: "Kontakt aufnehmen" → /kontakt/
```

---

### SEKTION E: KONTAKT CTA

```
Neue Sektion → 1 Spalte
Einstellungen:
  BG: #f6f4f1
  Padding: 7rem 8%
  Text-align: Center
  
Widgets:
  Text (sw-section-tag): "MELD DICH"
  Überschrift H2: "Bereit zu tanzen?"
  Text:
    "Fragen zu Workshops, Parties oder einfach neugierig?
     Schreib Daniel direkt an – er freut sich auf dich."
  
  Buttons:
    Button 1: "E-Mail schreiben" → mailto:info@salsawuppertal.com
    Button 2: "Alle Events" → /events/ (Outline dark)
```

**Startseite speichern und veröffentlichen.**

---

## SCHRITT 8 — Elementor: EVENTS-SEITE

Seiten > Events & Parties > Mit Elementor bearbeiten

```
Sektion 1 — Page Hero:
  BG: #0e0e0e, Padding: 10rem 8% 4rem
  Überschrift H1 (weiß): "Events & Parties."
  Text (weiß/60%): "Alle Veranstaltungen von Daniel in Wuppertal und Umgebung."

Sektion 2 — Kalender:
  BG: weiß, Padding: 4rem 8%
  Shortcode-Widget: [tribe_events]
  (Das zeigt den vollen Events Calendar)
```

---

## SCHRITT 9 — Elementor: ÜBER-MICH-SEITE

```
Sektion 1 — Hero (2 Spalten):
  Links: Bild (gleicher Unsplash-Link)
  Rechts:
    Text (sw-section-tag): "ÜBER MICH"
    H1: "Leidenschaft für karibische Tänze."
    Text: [Platzhaltertext — Daniel füllt selbst aus]
    Button: "Zu den Events" → /events/

Sektion 2 — Tanzstile (gleich wie Startseite, kopieren)

Sektion 3 — CTA:
  BG: #f6f4f1
  H2: "Tanz mit uns."
  Button: "Jetzt anmelden" → /kontakt/
```

---

## SCHRITT 10 — Elementor: KONTAKT-SEITE

```
Sektion 1 — Header:
  BG: #0e0e0e, Padding: 8rem 8% 4rem
  H1 (weiß): "Schreib mir."
  Text (weiß/60%): "Fragen zu Kursen, Workshops oder Parties? Ich freue mich von dir zu hören."

Sektion 2 — Formular + Kontakt (2 Spalten):
  BG: weiß, Padding: 5rem 8%
  
  Spalte Links (60%):
    Contact Form 7 Widget:
      Formular auswählen: "Kontaktformular 1"
      
  Spalte Rechts (40%):
    Abstand-Widget: 2rem
    Text: "Direkt erreichen"
    Icon + Text: E-Mail → info@salsawuppertal.com
    Icon + Text: Instagram → # (Platzhalter)
    Icon + Text: Facebook → # (Platzhalter)
    Text (klein, grau): "Antwort meist innerhalb von 24 Stunden."
```

### Contact Form 7 Formular anpassen
```
Kontakt > Kontaktformulare > Kontaktformular 1 > Bearbeiten

Formular-Tab:
[text* your-name placeholder "Dein Name"]
[email* your-email placeholder "deine@email.de"]
[textarea your-message placeholder "Deine Nachricht an Daniel..."]
[submit "Nachricht senden"]

Mail-Tab:
An: info@salsawuppertal.com
Betreff: Neue Anfrage via SalsaWuppertal.com
Nachricht:
Von: [your-name] <[your-email]>
Nachricht: [your-message]
```

---

## SCHRITT 11 — Events eintragen

Events > Neu hinzufügen — trage 4 Platzhalter-Events ein:

**Event 1:**
```
Titel: Salsaparty Wuppertal
Datum: [nächsten Samstag im nächsten Monat]
Ort: Wuppertal, NRW
Beschreibung: Salsa und Bachata Party in Wuppertal. Alle Levels willkommen!
```

**Event 2:**
```
Titel: Bachataparty Wuppertal
Datum: [übernächsten Samstag]
Ort: Wuppertal, NRW
Beschreibung: Bachata Party mit DJ. Für Anfänger und Fortgeschrittene.
```

**Event 3:**
```
Titel: Bachataparty Bochum
Datum: [folgender Samstag]
Ort: Bochum, NRW
```

**Event 4:**
```
Titel: Bachataworkshop Wuppertal
Datum: [Sonntag nach Party]
Ort: Wuppertal, NRW
Beschreibung: Workshop für Anfänger und Fortgeschrittene.
```

---

## SCHRITT 12 — Impressum / Datenschutz / Disclaimer

Seiten > Impressum > Bearbeiten (Standard WordPress Editor)

Füge folgenden Platzhaltertext ein:
```
IMPRESSUM

Angaben gemäß § 5 TMG:

[Vollständiger Name]
[Straße, Nr.]
[PLZ Wuppertal]

Kontakt:
E-Mail: info@salsawuppertal.com

[Hinweis: Daniel muss seinen vollständigen Namen und Adresse eintragen]
```

Gleiches für Datenschutz und Disclaimer (Platzhaltertext).

---

## SCHRITT 13 — Mobile prüfen

In Elementor: Klick auf das Handy-Icon unten in der Toolbar

Prüfe für jede Seite auf 390px:

**Startseite:**
- [ ] Hero-Text lesbar, nicht abgeschnitten
- [ ] Buttons: voll breit oder korrekt gestapelt
- [ ] Tanzstile-Grid: 1 Spalte
- [ ] Events Vorschau: lesbar
- [ ] Über-Daniel: Bild oben, Text unten

**Anpassungen die du in Elementor Mobile-Ansicht vornehmen musst:**
```
Hero H1: Mobile Schriftgröße → 2.2rem
Tanzstile: Spalten auf 100% setzen
Über-Daniel: Spaltenreihenfolge umkehren (Bild erst)
Padding reduzieren: 5rem → 3rem oben/unten
```

---

## SCHRITT 14 — Abnahme-Checkliste durchgehen

Öffne `docs/ACCEPTANCE_CRITERIA.md` und hake jeden Punkt ab.

Das Projekt gilt als **lokal fertig** wenn alle Punkte in ACCEPTANCE_CRITERIA.md mit ✅ markiert sind.

---

## SCHRITT 15 — Deployment auf Hostinger

### 15a — Duplicator Paket erstellen
```
Duplicator > Pakete > Neu erstellen
Name: salsa-wuppertal-v1
Alle Standardeinstellungen → Weiter → Erstellen
Download: installer.php + [paketname].zip
```

### 15b — Auf Hostinger hochladen
```
1. FTP-Client (FileZilla) öffnen
2. Hostinger FTP-Daten eingeben (von Daniel)
3. Beide Dateien hochladen in: public_html/
4. Browser öffnen: salsawuppertal.com/installer.php
5. Wizard durchfolgen:
   - Datenbankname, User, Passwort (von Hostinger)
   - Old URL: http://localhost:8881
   - New URL: https://salsawuppertal.com
6. Fertig stellen
7. installer.php + _old_ Dateien löschen (Sicherheit!)
```

### 15c — Nach Deployment prüfen
```
1. https://salsawuppertal.com aufrufen
2. ACCEPTANCE_CRITERIA.md Punkte 13-15 prüfen
3. Kontaktformular live testen
4. Google PageSpeed testen: https://pagespeed.web.dev/
```

---

*Ende des Master Build Spec. Alle Fragen: Überprüfe zuerst PROJECT_BRIEF.md und ARCHITECTURE.md.*
