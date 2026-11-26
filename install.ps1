# Installateur client - CeceModPack Horror - Forge 1.20.1-47.4.28
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$repo = 'https://github.com/nini17800/cecemodpack-horror/raw/main'
$mc   = Join-Path $env:APPDATA '.minecraft'
$ua   = @{ 'User-Agent' = 'Mozilla/5.0' }

$files = @(
    @('908741','5681725','embeddium-0.3.31+mc1.20.1.jar','mods'),
    @('331936','7476570','citadel-2.6.3-1.20.1.jar','mods'),
    @('1001614','8095554','lionfishapi-3.0.jar','mods'),
    @('1590584','9446673','emotecraft-borrow-their-emote-1.0.2-1.20.1-forge.jar','mods'),
    @('309927','6418456','curios-forge-5.14.1+1.20.1.jar','mods'),
    @('422301','9758729','sophisticatedbackpacks-1.20.1-3.26.22.2264.jar','mods'),
    @('455585','4654401','Kambrik-6.1.1+1.20.1-forge.jar','mods'),
    @('1579993','9650417','mcaquests-1.9.0.jar','mods'),
    @('840254','8591693','legendarysurvivaloverhaul-1.20.1-2.4.7.jar','mods'),
    @('1399257','9718505','MossyLib-2.0.0-1.20.1-forge.jar','mods'),
    @('378802','5278429','structure_gel-1.20.1-2.16.2.jar','mods'),
    @('1773750','9773744','1.25-Dominion-Tame-Everything-forge-1.20.1.jar','mods'),
    @('790626','9791665','modernfix-forge-5.28.8-mc1.20.1.jar','mods'),
    @('250498','7815705','mowziesmobs-1.8.2.jar','mods'),
    @('257814','9542632','CreativeCore_FORGE_v2.12.42_mc1.20.1.jar','mods'),
    @('379849','5182632','The_Undergarden-1.20.1-0.8.14.jar','mods'),
    @('1656896','9038864','MRPhone 2 0.9.4 beta.jar','mods'),
    @('681606','4995650','justhammers-forge-2.0.3+mc1.20.1.jar','mods'),
    @('442735','8427046','physics-mod-3.0.20-mc-1.20.1-forge.jar','mods'),
    @('508933','9004753','DistantHorizons-3.3.3-1.20.1-fabric-forge.jar','mods'),
    @('667299','6336646','yet_another_config_lib_v3-3.6.6+1.20.1-forge.jar','mods'),
    @('1216528','8352209','WOC-Remastered-1.5.0-forge-1.20.1.jar','mods'),
    @('531761','8969708','balm-forge-1.20.1-7.3.44.jar','mods'),
    @('252818','8227003','DynamicTrees-1.20.1-1.4.11.jar','mods'),
    @('686437','7917933','born_in_chaos_[Forge]1.20.1_1.7.5.jar','mods'),
    @('421897','9707381','particlerain-4.0.4-1.20.1-forge.jar','mods'),
    @('551586','8246047','L_Enders_Cataclysm-3.31.jar','mods'),
    @('1760357','9293205','dhdisabler-1.0.0.jar','mods'),
    @('419699','5137938','architectury-9.2.14-forge.jar','mods'),
    @('309516','5937417','Bountiful-6.0.4+1.20.1-forge.jar','mods'),
    @('227639','5468648','twilightforest-1.20.1-4.3.2508-universal.jar','mods'),
    @('1184379','7679941','epic-fight-invincible-lib-20.14.8.2-mc1.20.1-forge.jar','mods'),
    @('918614','8632596','WeaponsOfMiracles-2.0.171-mc1.20.1-forge.jar','mods'),
    @('876772','9458713','immersiveores-1.20.1-1.0.3.jar','mods'),
    @('659011','5906086','deeperdarker-forge-1.20.1-1.3.3.jar','mods'),
    @('238222','8778011','jei-1.20.1-forge-15.56.0.205.jar','mods'),
    @('235670','8292749','[1.20.1][Forge] RPG-HUD-3.13.jar','mods'),
    @('291874','8246702','SereneSeasons-forge-1.20.1-9.1.0.3.jar','mods'),
    @('403422','4632460','emotecraft-for-MC1.20.1-2.2.7-b.build.50-forge.jar','mods'),
    @('658587','4587214','player-animation-lib-forge-1.0.2-rc1+1.20.jar','mods'),
    @('312918','5010316','blue_skies-1.20.1-1.3.31.jar','mods'),
    @('433760','9396176','notenoughanimations-forge-1.12.7-mc1.20.1.jar','mods'),
    @('426558','5698791','alexsmobs-1.22.9.jar','mods'),
    @('574913','8685426','crittersandcompanions-forge-1.20.1-2.7.1.jar','mods'),
    @('453763','9394023','FreshAnimations_v1.11.2_1.20.zip','resourcepacks'),
    @('255308','6134920','aether-1.20.1-1.5.2-neoforge.jar','mods'),
    @('351264','9695363','kotlinforforge-4.13.0-all.jar','mods'),
    @('388172','8285794','geckolib-forge-1.20.1-4.8.4.jar','mods'),
    @('248787','4770828','appleskin-forge-mc1.20.1-2.5.1.jar','mods'),
    @('844662','9188522','entity_model_features-3.3.12-1.20.1-forge.jar','mods'),
    @('324717','8479276','Jade-1.20.1-Forge-11.13.3.jar','mods'),
    @('1359282','8520981','Falling leaves 1_20_1-1.0.jar','mods'),
    @('568563','9420328','entity_texture_features-7.2.7-1.20.1-forge.jar','mods'),
    @('955399','5787839','GlitchCore-forge-1.20.1-0.0.1.1.jar','mods'),
    @('263420','9067172','xaerominimap-forge-1.20.1-26.6.0.jar','mods'),
    @('618298','9806985','sophisticatedcore-1.20.1-1.5.41.2500.jar','mods'),
    @('627986','6322818','naturalist-5.0pre2+forge-1.20.1.jar','mods'),
    @('535291','9616432','minecraft-comes-alive-7.7.1-beta.6-1.20.1-universal.jar','mods'),
    @('405076','8049910','epic-fight-20.14.17-mc1.20.1-forge.jar','mods'),
    @('429235','4810975','ferritecore-6.0.1-forge.jar','mods'),
    @('245755','8849482','waystones-forge-1.20.1-14.1.21.jar','mods'),
    @('266890','6048921','PlayerRevive_FORGE_v2.0.31_mc1.20.1.jar','mods'),
    @('627557','9687811','ComplementaryReimagined_r5.10.zip','shaderpacks'),
    @('581495','6020952','oculus-mc1.20.1-1.8.0.jar','mods'),
    @('1814333','9681860','mcaefcompat-1.0.4-mca7.7.1-forge-1.20.1.jar','mods'),
    @('535489','7032235','sound-physics-remastered-forge-1.20.1-1.5.1.jar','mods'),
    @('1103431','6100812','sodiumoptionsapi-forge-1.0.10-1.20.1.jar','mods'),
    @('1546295','8319872','minesis-2.0.2-forge-1.20.1.jar','mods'),
    @('416294','6186971','rhino-forge-2001.2.3-build.10.jar','mods'),
    @('228525','7612389','Bookshelf-Forge-1.20.1-20.2.15.jar','mods'),
    @('416089','8601186','voicechat-forge-1.20.1-2.6.22.jar','mods'),
    @('1029438','8519058','watermedia_binaries-3.0.0.6.jar','mods'),
    @('1395870','7543999','watermedia_youtube_plugin-2.1.2.jar','mods'),
    @('586157','5772681','Necronomicon-Forge-1.6.0+1.20.1.jar','mods'),
    @('1317771','8326949','obfuscated-1.0.0-forge-1.20.1.jar','mods'),
    @('1565164','8199211','random_advancement-forge-1.20.1-1.0.0.jar','mods'),
    @('1289564','9358029','kurolib-0.6-forge-1.20.1.jar','mods'),
    @('1212200','6831233','KeyBindJS-2001-2.3.0.jar','mods'),
    @('342584','9452171','collective-1.20.1-8.80.jar','mods'),
    @('1173633','9046380','Voiceless Survival-forge-1.20.1-2.2.0.jar','mods'),
    @('316582','7018272','corpse-forge-1.20.1-1.0.23.jar','mods'),
    @('897116','7110922','refurbished_furniture-forge-1.20.1-1.0.20.jar','mods'),
    @('869524','8519098','watermedia-3.0.0.23.jar','mods'),
    @('1319210','9405253','oelib-forge-1.20.1-0.3.1.jar','mods'),
    @('551736','6044481','sodiumdynamiclights-forge-1.0.10-1.20.1.jar','mods'),
    @('60089','5338457','MouseTweaks-forge-mc1.20.1-2.25.1.jar','mods'),
    @('250419','7612607','EnchantmentDescriptions-Forge-1.20.1-17.1.21.jar','mods'),
    @('1300195','7862414','smartkeyprompts-forge-1.20.1-1.1.3-hotfix-all.jar','mods'),
    @('1476383','8578694','mimicked-2.0.3-1.20.1+forge.jar','mods'),
    @('1001299','8252116','the_knocker-1.5.2-forge-1.20.1.jar','mods'),
    @('1510648','9237392','door_knocker-forge-1.20.1-1.3.jar','mods'),
    @('1390230','7252390','Cave-Horror-Sounds.jar','mods'),
    @('1457347','7746587','SMSS.jar','mods'),
    @('1769294','9408420','hollow-night-forge-1.20.1-0.2.0.jar','mods'),
    @('256717','5278538','Clumps-forge-1.20.1-12.0.0.4.jar','mods'),
    @('594750','5105472','cavedust-2.0.4-1.20.1-forge.jar','mods'),
    @('1040578','8162208','Hysteria-Shaders-Universal-v1.2.2.zip','shaderpacks'),
    @('1566054','9177575','dontcry-1.0.4.jar','mods'),
    @('467028','8890188','plasmovoice-forge-1.20.1-2.1.17.jar','mods'),
    @('1585258','8731377','the_parallel-1.0.5-forge-1.20.1.jar','mods'),
    @('1164906','6051131','sounds_of_the_forest-1.0.2-forge-1.20.1.jar','mods'),
    @('549225','7573740','framework-forge-1.20.1-0.8.0.jar','mods'),
    @('546670','9408319','Essential_1-5-2_forge_1-20-1.jar','mods'),
    @('1158094','9377164','deimos-1.20.1-forge-2.8.jar','mods'),
    @('238086','8020595','kubejs-forge-2001.6.5-build.26.jar','mods'),
    @('1280263','6615082','Hide_Nameplates-1.0.jar','mods'),
    @('1792840','9518044','HOLLOW_Horror_Shaders_v0.4.2.zip','shaderpacks'),
    @('348521','5729105','cloth-config-11.1.136-forge.jar','mods')
)

Write-Host ''
Write-Host "=== CeceModPack Horror - installation (108 fichiers) ===" -ForegroundColor Green
Write-Host "Dossier Minecraft : $mc"
$mods = Join-Path $mc 'mods'
New-Item -ItemType Directory -Force $mc, (Join-Path $mc 'shaderpacks'), (Join-Path $mc 'resourcepacks') | Out-Null

# Sauvegarde des anciens mods
$marker = Join-Path $mods '.cecemodpack-horror'
if ((Test-Path -LiteralPath $mods) -and (-not (Test-Path $marker)) -and (Get-ChildItem -LiteralPath $mods -File -ErrorAction SilentlyContinue)) {
    $bak = Join-Path $mc ('mods_sauvegarde_' + (Get-Date -Format 'yyyyMMdd_HHmmss'))
    Move-Item -LiteralPath $mods $bak
    Write-Host "Anciens mods deplaces dans : $bak" -ForegroundColor Yellow
}
New-Item -ItemType Directory -Force $mods | Out-Null
Set-Content -Path $marker -Value 'installe par install.ps1'

$tmpf = Join-Path $env:TEMP 'cmh_dl.tmp'
$i = 0; $fail = @()
foreach ($f in $files) {
    $i++
    $projId = $f[0]; $fileId = $f[1]; $name = $f[2]
    $dest = Join-Path (Join-Path $mc $f[3]) $name
    Write-Host ("[{0,3}/{1}] {2}" -f $i, $files.Count, $name)
    if (Test-Path -LiteralPath $dest) { continue }
    $url = "https://www.curseforge.com/api/v1/mods/$projId/files/$fileId/download"
    $ok = $false
    for ($try = 1; ($try -le 3) -and (-not $ok); $try++) {
        try {
            Invoke-WebRequest -Uri $url -Headers $ua -OutFile $tmpf -UseBasicParsing
            Move-Item -LiteralPath $tmpf -Destination $dest -Force
            $ok = $true
        } catch { Start-Sleep -Seconds 2 }
    }
    if (-not $ok) { $fail += $name; Write-Host '      ECHEC' -ForegroundColor Red }
}

# Configs du modpack
Write-Host 'Installation des configs...'
$tmp = Join-Path $env:TEMP ('cmh_' + [guid]::NewGuid())
New-Item -ItemType Directory -Force $tmp | Out-Null
Invoke-WebRequest -Uri "$repo/CeceModPack-Horror.zip" -OutFile "$tmp\pack.zip" -UseBasicParsing
Expand-Archive "$tmp\pack.zip" -DestinationPath "$tmp\x" -Force
Copy-Item "$tmp\x\overrides\*" $mc -Recurse -Force
Remove-Item $tmp -Recurse -Force

# Forge
$forgeName = 'forge-1.20.1-47.4.28'
if (-not (Test-Path (Join-Path $mc 'versions\1.20.1-forge-47.4.28'))) {
    $jar = Join-Path ([Environment]::GetFolderPath('Desktop')) "$forgeName-installer.jar"
    Write-Host 'Telechargement de Forge 1.20.1-47.4.28...'
    Invoke-WebRequest -Uri "https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.28/$forgeName-installer.jar" -OutFile $jar -UseBasicParsing
    $java = $null
    $cmd = Get-Command java -ErrorAction SilentlyContinue
    if ($cmd) { $java = $cmd.Source } else {
        $j = Get-ChildItem "${env:ProgramFiles(x86)}\Minecraft Launcher\runtime", "$env:LOCALAPPDATA\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime" -Recurse -Filter javaw.exe -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($j) { $java = $j.FullName }
    }
    if ($java) {
        Write-Host '>>> Dans la fenetre Forge : laisse "Install client" coche et clique OK.' -ForegroundColor Cyan
        Start-Process -FilePath $java -ArgumentList "-jar `"$jar`"" -Wait
        Remove-Item $jar -ErrorAction SilentlyContinue
    } else {
        Write-Host "Java introuvable : double-clique sur $jar (sur ton Bureau) pour installer Forge." -ForegroundColor Yellow
    }
} else { Write-Host 'Forge 1.20.1-47.4.28 deja installe.' }

Write-Host ''
if ($fail.Count) {
    Write-Host ("{0} fichier(s) n'ont pas pu etre telecharges :" -f $fail.Count) -ForegroundColor Red
    $fail | ForEach-Object { Write-Host "  - $_" }
    Write-Host 'Relance l''installateur (il reprend la ou il s''est arrete).'
} else {
    Write-Host 'Tout est installe !' -ForegroundColor Green
}
Write-Host 'Lance le launcher Minecraft, choisis le profil "forge" (1.20.1-forge-47.4.28),'
Write-Host 'mets au moins 8 Go de RAM (Installations > Modifier > Plus d''options > -Xmx8G)'
Write-Host 'et rejoins le serveur : dedication-radiation.tun.ply.gg'
