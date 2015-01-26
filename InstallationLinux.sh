#!/bin/sh

clear
############################################################
echo Script de lancement pour installation CPS pour Linux.
echo Copyright ASIP SANTE 2012.
############################################################

if test "$HOME" = "/root"
then
  if [ -f /usr/local/lib/libpcsclite.so ]
  then
    if [ ! -f /usr/local/lib/libpcsclite.so.0 ]
    then
      ln -s /usr/local/lib/libpcsclite.so /usr/local/lib/libpcsclite.so.0 2> /tmp/nul
    fi
  fi
  mkdir /usr/local/galss 2> /tmp/nul
  chmod 777 /usr/local/galss 2> /tmp/nul
  SV_PATH=$PATH
  SV_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
  PATH=.:/usr/local/galss:$PATH
  export PATH
  LD_LIBRARY_PATH=.:/usr/local/galss:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH
  if [ ! -d ./linux ]
  then
    echo "Veuillez vous placer a la racine du cdrom pour lancer l'installation"
  else
    cd ./linux
    ./insplux
    cd ..
    chmod 777 /usr/local/galsssrv 2> /tmp/nul
    chmod 777 /usr/local/cryptolibCPS 2> /tmp/nul
    chmod 777 /usr/local/cryptolibCPS/certificats 2> /tmp/nul
    chmod 777 /usr/local/cryptolibCPS/traces 2> /tmp/nul
    mkdir -p /var/opt/santesocial/ 2> /tmp/nul 
    chmod 777 /var/opt/santesocial/ 2> /tmp/nul
##    echo
##    echo "Veuillez redemarrer le systeme avant d'utiliser les composants CPS."
  fi

  PATH=$SV_PATH
  export PATH
  LD_LIBRARY_PATH=$SV_LD_LIBRARY_PATH
  export LD_LIBRARY_PATH
else
  echo
  echo  Vous devez etre utilisateur "root" pour lancer cette installation.
  echo  Installation interrompue.
  echo
fi
