#!/bin/bash
#Installation des drivers et librairies
apt-get update && apt-get install -y libccid pcscd libpcsclite-dev
#execution de l' installeur (mode galss - mais galss non utilisé)
./InstallationLinux.sh
#Copie de la librairie "pcsc" dans le repertoire galss
cp apicps/Custom/Linux/libcps_pkcs11_pcsc_lux.so /usr/local/galss/
#création des liens symboliques dans /usr/lib
ln -s /usr/local/galss/libcps_pkcs11_pcsc_lux.so /usr/lib/libcps_pkcs11_pcsc_lux.so
ln -s /usr/local/galss/libsscaslux.so /usr/lib/libsscaslux.so
ln -s /usr/local/galss/libgalcllux.so /usr/lib/libgalcllux.so
ln -s /usr/local/galss/libgalinlux.so /usr/lib/libgalinlux.so
ln -s /usr/local/galss/libcptablux.so /usr/lib/libcptablux.so
ln -s /usr/local/galss/libcpslux.so /usr/lib/libcpslux.so
#Création des liens symbolique dans /usr/bin
ln -s /usr/local/galss/cpgeslux /usr/bin/cpgeslux
echo "Contrairement a ce qui est annoncé, il n'est pas nécessaire de rebooter la machine."
echo "Par contre, il faut charger la librairie comme peripherique de securité dans votre navigateur (fonctionne avec Firefox/Iceweasel)"
echo "La librairie se situe ici : /usr/local/galss/libcps_pkcs11_lux.so"
echo "Attention : fonctionne avec debian x32 uniquement !"
echo "Fin du script !"
