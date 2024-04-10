;;
;;  slovenian.nsh
;;
;;  Default language strings for the Windows Dia NSIS installer.
;;  Windows Code page: 1250
;;
;;  Version 2
;;  Note: If translating this file, replace "!insertmacro "
;;  with "!define".

; Make sure to update the DIA_MACRO_LANGUAGEFILE_END macro in
; langmacros.nsh when updating this file

; GTK+ was not found
!define  DIA_NO_GTK			"GTK+ ni name��en. Prosimo, uporabiti polno namestitev. Na voljo je na naslovu http://dia-installer.de"

; Don't install over pre 0.95 versions
!define  DIA_NO_INSTALL_OVER		"Prosimo, odstranite starej�e namestitve programa Dia v celoti ali namestite Dia na drugo mesto."

; License Page
!define  DIA_LICENSE_BUTTON		"Naprej >"
!define  DIA_LICENSE_BOTTOM_TEXT	"$(^Name) je izdan pod licenco GPL. Ta licenca je namenjena le za namen informiranja. $_CLICK"

; Components Page
!define  DIA_SECTION_TITLE		"Diashapes"
!define  TRANSLATIONS_SECTION_TITLE	"Prevodi"
!define  TRANSLATIONS_SECTION_DESCRIPTION  "Prevodi uporabni�kega vmesnika programa Dia"
!define  DIA_SECTION_DESCRIPTION	"Diashapes - datoteke in dll-ji"
!define  PYTHON_SECTION_TITLE		"Vti�nik za Python"
!define  PYTHON_SECTION_DESCRIPTION	"Podpora za skriptni jezik Python 2.3. Ne izberite, �e nimate name��enega okolja Python."

; Installer Finish Page
!define  DIA_FINISH_VISIT_WEB_SITE	"Obi��ite spletno stran Dia for Windows"

; DIA Section Prompts and Texts
!define  DIA_UNINSTALL_DESC		"Diashapes (samo odstrani)"
!define  DIA_PROMPT_WIPEOUT		"Va�a stara mapa Dia bo izbrisana. �elite nadaljevati?$\r$\rOpomba: Vsi nestandardni vti�niki, ki ste jih morda namestili, bodo izbrisani.$\rUporabni�ke nastavitve Dia ne bodo prizadete."
!define  DIA_PROMPT_DIR_EXISTS		"Mapa za namestitev, ki ste jo navedli, �e obstaja.$\rVsebina bo izbrisana. �elite nadaljevati?"

; Uninstall Section Prompts
!define  un.DIA_UNINSTALL_ERROR_1	"Program za odstranitev ne najde registrskih vnosov za Diashapes.$\rMo�no je, da je ta program namestil drug uporabnik."
!define  un.DIA_UNINSTALL_ERROR_2	"Nimate ustreznih pravic za odstranitev tega programa."
!define  un.DIA_UNINSTALLATION_WARNING	"S tem boste v celoti izbrisali $INSTDIR in vse podmape. �elite nadaljevati?"
!define  un.DIA_DOTDIA_WARNING		"S tem boste v celoti izbrisali $PROFILE\.dia in vse podmape. �elite nadaljevati?"
