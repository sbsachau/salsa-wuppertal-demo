# ACCEPTANCE CRITERIA — SalsaWuppertal.com

Dieses Dokument definiert die vollständige "Definition of Done". Jeder Punkt muss manuell geprüft und abgehakt werden bevor das Projekt als fertig gilt.

---

## 1. INSTALLATION & SETUP

- [ ] WordPress läuft auf localhost:8881
- [ ] Astra Theme installiert und aktiv
- [ ] Astra Child Theme erstellt, installiert, aktiv
- [ ] Elementor Free installiert und aktiv
- [ ] The Events Calendar installiert und aktiv
- [ ] Contact Form 7 installiert und aktiv
- [ ] Permalink-Struktur: "Beitragsname" eingestellt
- [ ] Startseite: Statische Seite auf "Startseite" gesetzt
- [ ] Kommentare global deaktiviert

---

## 2. DESIGN & THEME

- [ ] Google Fonts laden korrekt (Playfair Display + DM Sans)
- [ ] CSS-Variablen greifen im Browser (DevTools > Computed)
- [ ] Primärfarbe #C8102E überall konsistent
- [ ] Kein Flash of Unstyled Content beim Laden
- [ ] Child Theme style.css aktiv (nicht Parent Theme)
- [ ] Scroll-Reveal Animationen funktionieren (Elemente faden ein)

---

## 3. NAVIGATION

- [ ] Hauptmenü zeigt: Tanzstile | Events | Über Daniel | Kontakt
- [ ] CTA-Button "Nächste Party" im Header sichtbar und klickbar
- [ ] Header ist sticky (bleibt oben beim Scrollen)
- [ ] Header-Hintergrund: weiß mit blur (nicht transparent)
- [ ] Alle Menü-Links führen zur richtigen Seite
- [ ] Aktiver Menüpunkt ist visuell hervorgehoben
- [ ] Footer-Menü zeigt: Impressum | Datenschutz | Disclaimer
- [ ] Footer-Links funktionieren

---

## 4. STARTSEITE

- [ ] Hero-Bild lädt korrekt (Unsplash oder eigenes)
- [ ] Hero-Overlay (dunkler Gradient) sichtbar
- [ ] H1-Headline sichtbar und lesbar (weiß auf Bild)
- [ ] "Leidenschaft" ist kursiv und rosa (#ff8fa3) formatiert
- [ ] Subtext unterhalb der Headline sichtbar
- [ ] Button "Zu den Events" → führt zu /events/
- [ ] Button "Über Daniel" → führt zu /ueber-mich/
- [ ] Tanzstile-Grid: 5 Karten sichtbar (01-05)
- [ ] Events-Vorschau: mindestens 1 Event angezeigt
- [ ] Über-Daniel-Sektion: Foto + Text + Zitat korrekt
- [ ] Kontakt-CTA-Sektion am Ende der Seite
- [ ] Alle Sektionen haben korrekten Abstand (kein Layout-Bruch)

---

## 5. EVENTS-SEITE (/events/)

- [ ] Seite erreichbar unter /events/
- [ ] Page-Hero mit Titel "Events & Parties." sichtbar
- [ ] Eventkalender / Eventliste wird angezeigt
- [ ] Mindestens 4 Platzhalter-Events eingetragen
- [ ] Events zeigen: Titel, Datum, Ort
- [ ] "Zurück"-Navigation funktioniert

---

## 6. ÜBER-MICH-SEITE (/ueber-mich/)

- [ ] Seite erreichbar unter /ueber-mich/
- [ ] Foto sichtbar (Platzhalter oder echt)
- [ ] Headline "Hallo, ich bin Daniel." sichtbar
- [ ] Platzhaltertext vorhanden (kein leerer Bereich)
- [ ] CTA-Button "Zu den Events" funktioniert

---

## 7. WORKSHOPS-SEITE (/workshops/)

- [ ] Seite erreichbar unter /workshops/
- [ ] Inhalt vorhanden (kein leerer Bereich)
- [ ] CTA-Button funktioniert

---

## 8. KONTAKT-SEITE (/kontakt/)

- [ ] Seite erreichbar unter /kontakt/
- [ ] Contact Form 7 Formular sichtbar
- [ ] Felder vorhanden: Name, E-Mail, Nachricht, Absenden
- [ ] Formular sendet ohne Fehler ab
- [ ] Erfolgsmeldung nach dem Absenden sichtbar
- [ ] E-Mail-Empfang getestet (Testmail gesendet)
- [ ] Direkte Kontaktinfos rechts neben Formular sichtbar

---

## 9. RECHTLICHE SEITEN

- [ ] /impressum/ erreichbar, Inhalt vorhanden
- [ ] /datenschutz/ erreichbar, Inhalt vorhanden
- [ ] /disclaimer/ erreichbar, Inhalt vorhanden
- [ ] Alle drei nur im Footer-Menü, NICHT im Hauptmenü

---

## 10. MOBILE (390px — iPhone 14 Standard)

Teste mit Chrome DevTools → Toggle Device Toolbar → iPhone 14

- [ ] Hamburger-Menü sichtbar (Nav-Links ausgeblendet)
- [ ] Hamburger-Menü öffnet und schließt korrekt
- [ ] Hero-Bild lädt und füllt den Screen
- [ ] Hero-Text lesbar (nicht zu groß, nicht abgeschnitten)
- [ ] Kein horizontales Scrollen auf keiner Seite
- [ ] Tanzstile-Grid: 1 oder 2 Spalten (nicht 5)
- [ ] Events-Liste: korrekt gestapelt
- [ ] Über-mich: Foto oben, Text unten (nicht nebeneinander)
- [ ] Buttons: Full-width oder zentriert
- [ ] Kontaktformular: alle Felder voll ausgedehnt
- [ ] Footer: korrekt gestapelt (nicht nebeneinander gequetscht)
- [ ] Alle Touch-Targets mindestens 44x44px groß

---

## 11. TABLET (768px — iPad Standard)

- [ ] Layout korrekt auf 768px (2-spaltige Layouts funktionieren)
- [ ] Navigation korrekt (Hamburger oder Desktop-Nav)
- [ ] Kein Layout-Bruch

---

## 12. BROWSER-KOMPATIBILITÄT

- [ ] Chrome (neueste Version) ✓
- [ ] Safari (neueste Version) ✓
- [ ] Firefox (neueste Version) ✓
- [ ] Chrome Mobile (Android) ✓
- [ ] Safari Mobile (iOS) ✓

---

## 13. PERFORMANCE (nach Deployment auf Hostinger)

Teste mit https://pagespeed.web.dev/

- [ ] Mobile Score: > 70
- [ ] Desktop Score: > 85
- [ ] Keine broken Images (404 auf Bildern)
- [ ] Keine JavaScript-Fehler in der Konsole (DevTools > Console)
- [ ] Alle Links funktionieren (kein 404)

---

## 14. DANIEL KANN SELBST BEARBEITEN

Manuelle Tests — führe diese selbst durch:

- [ ] Als Daniel in WP-Admin einloggen können (Editor-Rolle)
- [ ] Text auf der Startseite über Elementor ändern können
- [ ] Bild auf der Über-mich-Seite über Elementor austauschen können
- [ ] Neues Event über Events > Neu hinzufügen anlegen können
- [ ] Event erscheint danach auf der Events-Seite

---

## 15. DEPLOYMENT-BEREITSCHAFT

- [ ] Duplicator Plugin installiert
- [ ] Lokales Paket erfolgreich erstellt (zip + installer.php)
- [ ] FTP-Zugangsdaten von Daniel vorhanden
- [ ] Hostinger-Datenbank leer und bereit
- [ ] Deployment-Anleitung aus MASTER_BUILD_SPEC.md (Schritt 12) bereit

---

## GESAMTSTATUS

| Bereich | Status |
|---|---|
| Installation & Setup | ⬜ Ausstehend |
| Design & Theme | ⬜ Ausstehend |
| Navigation | ⬜ Ausstehend |
| Startseite | ⬜ Ausstehend |
| Events-Seite | ⬜ Ausstehend |
| Über-mich-Seite | ⬜ Ausstehend |
| Workshops-Seite | ⬜ Ausstehend |
| Kontakt-Seite | ⬜ Ausstehend |
| Rechtliche Seiten | ⬜ Ausstehend |
| Mobile | ⬜ Ausstehend |
| Tablet | ⬜ Ausstehend |
| Browser | ⬜ Ausstehend |
| Performance | ⬜ Ausstehend |
| Daniel kann bearbeiten | ⬜ Ausstehend |
| Deployment-Bereit | ⬜ Ausstehend |

**→ Ersetze ⬜ mit ✅ wenn erledigt.**

MVP gilt als abgeschlossen wenn alle Punkte ✅ sind.
