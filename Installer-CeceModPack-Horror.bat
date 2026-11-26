@echo off
title Installation CeceModPack Horror
echo Telechargement des mods en cours (environ 110 fichiers), ne ferme pas cette fenetre...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p = Join-Path $env:TEMP cmh_install.ps1; Invoke-WebRequest https://github.com/nini17800/cecemodpack-horror/raw/main/install.ps1 -OutFile $p -UseBasicParsing; & $p"
pause
