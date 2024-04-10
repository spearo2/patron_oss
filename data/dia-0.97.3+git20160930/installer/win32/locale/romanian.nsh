;;
;;  romanian.nsh
;;
;;  Romanian language strings for the Windows Dia NSIS installer.
;;  Windows Code page: 1250
;;
;;  Author for this translation: Cristian Secar� <cristi AT secarica DOT ro>, 2010.
;;
;;  Version 2

; GTK+ was not found
!define DIA_NO_GTK			"GTK+ nu este instalat. Folosi�i programul complet de instalare, care este disponibil de la http://dia-installer.de."

; Don't install over pre 0.95 versions
!define DIA_NO_INSTALL_OVER		"Elimina�i complet instalarea Dia veche, sau instala�i Dia �ntr-o loca�ie diferit�."

; License Page
!define DIA_LICENSE_BUTTON		"�nainte >"
!define DIA_LICENSE_BOTTOM_TEXT		"$(^Name) este publicat sub licen�a public� general� GNU (GPL). Licen�a este furnizat� aici numai cu scop informativ. $_CLICK"

; Components Page
!define DIA_SECTION_TITLE			"Editorul de diagrame Dia (necesar)"
!define DIA_SECTION_DESCRIPTION		"Fi�iere �i dll-uri principale pentru Dia"
!define TRANSLATIONS_SECTION_TITLE	"Traduceri"
!define TRANSLATIONS_SECTION_DESCRIPTION  "Traduceri op�ionale ale interfe�ei utilizator Dia"
!define PYTHON_SECTION_TITLE              "Plug-in Python"
!define PYTHON_SECTION_DESCRIPTION              "Suport pentru limbajul de scripting Python 2.3. Nu selecta�i aceast� op�iune dac� Python nu este instalat."

; Installer Finish Page
!define DIA_FINISH_VISIT_WEB_SITE		"Visita�i pagina Web Dia pentru Windows"

; DIA Section Prompts and Texts
!define DIA_UNINSTALL_DESC		"Dia (numai eliminare)"
!define DIA_PROMPT_WIPEOUT		"Directorul vechi care con�ine Dia este pe cale de a fi �ters. Dori�i s� continua�i?$\r$\rNot�: orice pluginuri standard pe care poate l-a�i instalat vor fi �terse.$\rConfigur�rile per utilizator nu vor fi afectate."
!define DIA_PROMPT_DIR_EXISTS		"Directorul specificat exist� deja. Tot con�inutul$\rva fi �ters. Dori�i s� continua�i?"

; Uninstall Section Prompts
!define un.DIA_UNINSTALL_ERROR_1		"Programul de dezinstalare nu a putut g�si intr�rile �n registru pentru Dia.$\rEste posibil ca alt utilizator s� fi �ters aceast� aplica�ie."
!define un.DIA_UNINSTALL_ERROR_2		"Nu ave�i permisiunea de a dezinstala aceast� aplica�ie."
!define un.DIA_UNINSTALLATION_WARNING	"Aceasta va �terge complet $INSTDIR �i toate subdirectoarele. Continua�i?"
!define un.DIA_DOTDIA_WARNING		"Aceasta va �terge complet $PROFILE\.dia �i toate subdirectoarele. Continua�i?"
