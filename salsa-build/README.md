# SalsaWuppertal.com — Build Files

## Struktur

```
salsa-build/
├── setup.sh                          ← WP-CLI Script (einmal ausführen)
├── astra-child/
│   ├── style.css                     ← Child Theme Styles
│   └── functions.php                 ← Child Theme Functions
└── elementor-templates/
    ├── startseite.json               ← Elementor Template: Startseite
    ├── events.json                   ← Elementor Template: Events
    ├── ueber-mich.json               ← Elementor Template: Über mich
    └── kontakt.json                  ← Elementor Template: Kontakt
```

## Schritt-für-Schritt

### 1. Plugins & Theme installieren (manuell in WP-Admin)
- Astra Theme
- Elementor
- The Events Calendar
- Contact Form 7
- Duplicator

### 2. WP-CLI Script ausführen
```bash
# Im LocalWP Site Shell (Rechtsklick auf Site → Open Site Shell):
bash setup.sh
```

### 3. Child Theme hochladen
Kopiere den Ordner `astra-child/` nach:
`wp-content/themes/astra-child/`

Dann: Design > Themes > Astra Child → Aktivieren

### 4. Elementor Templates importieren
Für jede Seite:
1. Seite öffnen → Mit Elementor bearbeiten
2. Klick auf das Ordner-Icon (unten Mitte)
3. "Meine Templates" → Import Template
4. JSON-Datei wählen → In Seite einfügen
5. Speichern & Veröffentlichen

### 5. Deployment (Hostinger)
1. Duplicator: Pakete → Neu erstellen → Download
2. FTP: installer.php + .zip → public_html/
3. salsawuppertal.com/installer.php aufrufen
4. Wizard: Old URL → New URL anpassen

---
Erstellt für SalsaWuppertal.com | Daniel Wuppertal
