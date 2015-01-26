# CPS3
Lecture de la CPS (Carte de Professionnel de Santé) version 3 sous GNU/Linux
* Consultation des droits en ligne (CDR): https://www.sesam-vitale.fr/offre/prestataire-de-soins/hopitaux-cliniques/decouvrir-cdr.asp
* Compatibilité Debian/Ubuntu (Debian 6, Debian 7)
* Utilisation d'un lecteur de carte à puce compatible avec le standard PC/SC (testé avec Gemalto PC Twin Reader)

Il existe deux packages disponibles via ASIP Santé.

Le premier est un installeur utilisant galss.ini

Le second est un package rpm

Nous avons étudié les deux possibilités. Nos tests étaient réalisés sous Debian 6 et Centos 6

La version installeur, avec galss.ini, a fonctionné avec la Centos à condition d'avoir installé le paquet libpcsclite-dev pour la bonne détection du lecteur pcsc. Il faut aussi les liens symboliques de toutes les librairies dans /usr/local/galss/ vers /usr/lib/

A l'origine, aucun succès avec le paquet rpm, que ce soit sous Centos ou sous Debian (converti avec alien). Le logiciel cpgeslux fonctionne correctement (la carte peut être consultée), mais la librairie pkcs11 plante le navigateur quand on la charge comme périphérique de sécurité.

Sous Debian, il nous a fallu mixer les deux solutions, c'est à dire utiliser certaines librairies du packages rpm et les insérer dans l'installeur de la version galss. Le résultat donne une version qui n'utilise pas le galss et qui fonctionne bien avec le navigateur Firefox. Il faut installer sous Debian les paquets "libccid pcscd libpcsclite-dev" pour le lecteur PC/SC. Nous avons utilisé un Gemalto pc twin reader (simple et pas cher).

Il est possible d'installer le paquet libpcsc-tools et d'utiliser le logiciel pcsc_scan pour tester le bon fonctionnement du lecteur et de son driver. Si ça ne fonctionne pas, pas la peine d'aller plus loin.

Nous avons complété l'installeur fourni par l'ASIP Santé avec un script "install.sh" qui réalise une installation complète sous Debian 6 et 7 (fonctionne aussi avec Ubuntu 12.04 et devrait marcher "out of the box" avec Ubuntu 10.04). Le script fourni installe les paquets ci-dessus, utilise les bonnes librairies et crée les liens symboliques associés. Il reste après installation à charger la librairie /usr/local/galss/libcps_pkcs11_lux.so dans le navigateur en tant que périphérique de sécurité.

Le support non officiel est assuré sur le [forum ubuntu-fr (sujet "DMP dossier médical partage CPS carte professionnelle de santé Firefox")](http://forum.ubuntu-fr.org/viewtopic.php?id=667121)
