# MVP SCOPE — SalsaWuppertal.com

## Was ist im MVP enthalten

### Seiten

#### 1. Startseite (/)
- [ ] Hero: Vollbild-Foto, Headline, Subtext, 2 Buttons
- [ ] Tanzstile-Grid: 5 Stile (Salsa, Bachata, Merengue, Chachachá, Kizomba)
- [ ] Events-Vorschau: Nächste 4 Events (via The Events Calendar Widget)
- [ ] Über Daniel: 2-spaltiger Bereich mit Foto + Text + Zitat
- [ ] Kontakt-CTA: Einfacher CTA-Bereich mit Button

#### 2. Events & Parties (/events/)
- [ ] Page-Hero mit Titel
- [ ] Vollständiger Eventkalender (The Events Calendar, Listen-Ansicht)
- [ ] Platzhalter-Events eingetragen (4 Stück)

#### 3. Über mich (/ueber-mich/)
- [ ] Hero mit Foto und Headline
- [ ] Daniels Geschichte (Platzhaltertext — Daniel füllt selbst aus)
- [ ] Tanzstile-Übersicht (kurz)
- [ ] CTA: "Zu den Events"

#### 4. Workshops (/workshops/)
- [ ] Page-Hero
- [ ] Workshop-Beschreibung (Platzhaltertext)
- [ ] CTA: "Kontakt aufnehmen"

#### 5. Kontakt (/kontakt/)
- [ ] Contact Form 7 Formular (Name, E-Mail, Nachricht)
- [ ] Direkte Kontaktinfos rechts daneben (E-Mail, Instagram, Facebook)

#### 6. Rechtliche Seiten
- [ ] Impressum (/impressum/) — WordPress Standard-Editor, Platzhaltertext
- [ ] Datenschutz (/datenschutz/) — Platzhaltertext
- [ ] Disclaimer (/disclaimer/) — Platzhaltertext

### Navigation
- [ ] Hauptmenü: Tanzstile | Events | Über Daniel | Kontakt + CTA-Button "Nächste Party"
- [ ] Footer-Menü: Impressum | Datenschutz | Disclaimer
- [ ] Mobile: Hamburger-Menü (Astra automatisch)

### Design
- [ ] Child Theme mit CSS-Variablen und Google Fonts
- [ ] Scroll-Reveal Animationen (JavaScript, kein Plugin)
- [ ] Mobile-optimiert (390px, 768px Breakpoints)
- [ ] Sticky Header

### Technisch
- [ ] WordPress Playground lokal lauffähig (localhost:8881)
- [ ] Alle Plugins installiert und konfiguriert
- [ ] Kontaktformular sendet E-Mail
- [ ] Saubere Permalink-Struktur (/events/, /kontakt/ etc.)

---

## Was NICHT im MVP ist

Diese Features sind explizit ausgeschlossen — sie können in einer späteren Version kommen:

| Feature | Grund für Ausschluss |
|---|---|
| Blog / News-Bereich | Kein Content von Daniel geplant |
| Online-Buchungssystem | Zu komplex für MVP, kostet Geld |
| Newsletter-Integration | Spätere Phase |
| Mehrsprachigkeit (EN) | Zielgruppe ist deutschsprachig |
| Social Media Auto-Sync | Zu komplex für MVP |
| Mitgliederbereich | Nicht benötigt |
| Shop / Tickets kaufen | Nicht im Scope |
| Kommentarfunktion | Deaktiviert |
| WooCommerce | Nicht benötigt |

---

## Platzhalter-Inhalte (muss Daniel später ersetzen)

| Element | Aktuell | Daniel ersetzt mit |
|---|---|---|
| Hero-Foto | Unsplash Tanzbild | Eigenes Tanzbild |
| Über-mich-Foto | Unsplash Tanzbild | Sein Porträtfoto |
| Daniels Geschichte | Platzhaltertext | Sein eigener Text |
| Event-Daten | "Bald / TBD" | Echte Termine |
| E-Mail im Formular | info@salsawuppertal.com | Seine echte E-Mail |
| Instagram-Link | # | Sein Instagram-Profil |
| Facebook-Link | # | Seine Facebook-Seite |
| Impressum | Platzhalter | Echte Rechtstexte |

---

## Definition of Done (MVP)

Das MVP gilt als fertig wenn:
1. Alle 6 Seiten auf localhost:8881 erreichbar sind
2. Mobile-Ansicht auf 390px korrekt dargestellt wird
3. Kontaktformular sendet E-Mail (getestet)
4. Events Calendar zeigt Platzhalter-Events an
5. Navigation funktioniert (alle Links)
6. Hamburger-Menü auf Mobile funktioniert
7. Abnahme-Checkliste in ACCEPTANCE_CRITERIA.md komplett abgehakt

Danach: Deployment auf Hostinger via Duplicator.
