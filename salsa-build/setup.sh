#!/bin/bash
# SalsaWuppertal.com — WP-CLI Setup Script
# Ausfuehren im LocalWP Site Shell: bash setup.sh
# ----------------------------------------------------

echo "🎵 SalsaWuppertal Setup startet..."

# 1. Grundeinstellungen
wp option update blogname "SalsaWuppertal.com"
wp option update blogdescription "Salsa, Bachata & mehr in Wuppertal"
wp option update admin_email "info@salsawuppertal.com"
wp option update permalink_structure "/%postname%/"
wp rewrite flush
wp option update default_comment_status "closed"
wp option update default_ping_status "closed"
echo "✅ Grundeinstellungen gesetzt"

# 2. Seiten anlegen
wp post create --post_type=page --post_status=publish --post_title="Startseite" --post_name="startseite" --meta_input='{"_wp_page_template":"elementor_canvas"}'
wp post create --post_type=page --post_status=publish --post_title="Events & Parties" --post_name="events" --meta_input='{"_wp_page_template":"elementor_header_footer"}'
wp post create --post_type=page --post_status=publish --post_title="Ueber mich" --post_name="ueber-mich" --meta_input='{"_wp_page_template":"elementor_header_footer"}'
wp post create --post_type=page --post_status=publish --post_title="Workshops" --post_name="workshops" --meta_input='{"_wp_page_template":"elementor_header_footer"}'
wp post create --post_type=page --post_status=publish --post_title="Kontakt" --post_name="kontakt" --meta_input='{"_wp_page_template":"elementor_header_footer"}'
wp post create --post_type=page --post_status=publish --post_title="Impressum" --post_name="impressum"
wp post create --post_type=page --post_status=publish --post_title="Datenschutz" --post_name="datenschutz"
wp post create --post_type=page --post_status=publish --post_title="Disclaimer" --post_name="disclaimer"
echo "✅ Seiten erstellt"

# 3. Startseite als Frontpage
STARTSEITE_ID=$(wp post list --post_type=page --name=startseite --field=ID)
wp option update show_on_front "page"
wp option update page_on_front "$STARTSEITE_ID"
echo "✅ Startseite als Frontpage gesetzt (ID: $STARTSEITE_ID)"

# 4. Hauptmenue
wp menu create "Hauptmenue"
EVENTS_ID=$(wp post list --post_type=page --name=events --field=ID)
UEBER_ID=$(wp post list --post_type=page --name=ueber-mich --field=ID)
KONTAKT_ID=$(wp post list --post_type=page --name=kontakt --field=ID)
wp menu item add-post "Hauptmenue" $EVENTS_ID --title="Events"
wp menu item add-post "Hauptmenue" $UEBER_ID --title="Ueber Daniel"
wp menu item add-custom "Hauptmenue" "Tanzstile" "#tanzstile"
wp menu item add-post "Hauptmenue" $KONTAKT_ID --title="Kontakt"
wp menu location assign "Hauptmenue" primary
echo "✅ Hauptmenue erstellt"

# 5. Footer-Menue
wp menu create "Footer-Menue"
IMPRESSUM_ID=$(wp post list --post_type=page --name=impressum --field=ID)
DATENSCHUTZ_ID=$(wp post list --post_type=page --name=datenschutz --field=ID)
DISCLAIMER_ID=$(wp post list --post_type=page --name=disclaimer --field=ID)
wp menu item add-post "Footer-Menue" $IMPRESSUM_ID
wp menu item add-post "Footer-Menue" $DATENSCHUTZ_ID
wp menu item add-post "Footer-Menue" $DISCLAIMER_ID
wp menu location assign "Footer-Menue" footer
echo "✅ Footer-Menue erstellt"

# 6. Platzhalter-Events
NEXT_SAT=$(date -d "next Saturday" +%Y-%m-%d 2>/dev/null || date -v+Sat +%Y-%m-%d)
SAT2=$(date -d "next Saturday +7 days" +%Y-%m-%d 2>/dev/null || date -v+14d -v+Sat +%Y-%m-%d)
SAT3=$(date -d "next Saturday +14 days" +%Y-%m-%d 2>/dev/null || date -v+21d -v+Sat +%Y-%m-%d)
SUN1=$(date -d "next Sunday +7 days" +%Y-%m-%d 2>/dev/null || date -v+8d -v+Sun +%Y-%m-%d)

wp post create --post_type=tribe_events --post_status=publish \
  --post_title="Salsaparty Wuppertal" \
  --post_content="Salsa und Bachata Party in Wuppertal. Alle Levels willkommen!" \
  --meta_input="{\"_EventStartDate\":\"$NEXT_SAT 20:00:00\",\"_EventEndDate\":\"$NEXT_SAT 23:59:00\"}"

wp post create --post_type=tribe_events --post_status=publish \
  --post_title="Bachataparty Wuppertal" \
  --post_content="Bachata Party mit DJ. Fuer Anfaenger und Fortgeschrittene." \
  --meta_input="{\"_EventStartDate\":\"$SAT2 20:00:00\",\"_EventEndDate\":\"$SAT2 23:59:00\"}"

wp post create --post_type=tribe_events --post_status=publish \
  --post_title="Bachataparty Bochum" \
  --post_content="Bachata Party in Bochum." \
  --meta_input="{\"_EventStartDate\":\"$SAT3 20:00:00\",\"_EventEndDate\":\"$SAT3 23:59:00\"}"

wp post create --post_type=tribe_events --post_status=publish \
  --post_title="Bachataworkshop Wuppertal" \
  --post_content="Workshop fuer Anfaenger und Fortgeschrittene." \
  --meta_input="{\"_EventStartDate\":\"$SUN1 15:00:00\",\"_EventEndDate\":\"$SUN1 18:00:00\"}"

echo "✅ 4 Platzhalter-Events angelegt"

# 7. Impressum
IMPRESSUM_ID=$(wp post list --post_type=page --name=impressum --field=ID)
wp post update $IMPRESSUM_ID --post_content="<h1>Impressum</h1><p>Angaben gemaess § 5 TMG:</p><p>[Vollstaendiger Name]<br>[Strasse, Nr.]<br>[PLZ Wuppertal]</p><p>Kontakt:<br>E-Mail: info@salsawuppertal.com</p><p><em>Hinweis: Daniel muss seinen vollstaendigen Namen und Adresse eintragen.</em></p>"
echo "✅ Impressum Platzhalter gesetzt"

echo ""
echo "🎉 Setup abgeschlossen!"
echo ""
echo "NAECHSTE SCHRITTE:"
echo "1. astra-child/ Ordner nach wp-content/themes/ kopieren"
echo "2. Design > Themes > Astra Child aktivieren"
echo "3. Elementor Templates importieren (Ordner-Icon in Elementor)"
echo "   startseite.json → Startseite"
echo "   events.json     → Events & Parties"
echo "   ueber-mich.json → Ueber mich"
echo "   kontakt.json    → Kontakt"
echo ""
echo "Fertig! 🎵"
