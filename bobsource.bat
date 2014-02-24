@echo off
set drugs=0
set ver=1.30A
set ispro=true
set /a bcloseamt=150 * -1
echo BRIDGE OF BOLANIA CHANGELOG:
title Bridge of Bolania version %ver%
echo Version 1.0.0:
echo ^|-Bank System!!!
echo ^|-Added version management!
echo Version 1.0.02:
echo ^|-Minor fixes
echo Version 1.1.0:
echo ^|-Fixed banking system
echo ^|-Added NPC Names!
echo Version 1.1.1:
echo ^|-Added debt system to the bank
echo ^|-Squashed some nasty bugs
echo Version 1.20A:
echo ^|-Redone the entire version system
echo ^|-Added printing capabilities
echo ^|-Wow, I kinda took over this program.
echo ^|-Remodeled Code
echo ^|-Re-backended the save system. Stores everything in 1 file.
echo Version 1.21A:
echo ^|-Squashed some ugly bugs.
echo Version 1.30A:
echo ^|-Added ability to print combat log
pause
title (BoB vs. %ver%)
goto main
:main
color f0
cls
title (BoB vs. %ver%) Login
echo Welcome to Bridge of Bolania %ver%!
echo.
echo 1.)Start
echo 2.)Exit
set /p $=Choice:

if %$% equ 1 goto Start
if %$% equ 2 exit
goto main

:Start
echo Loading...
timeout /NOBREAK 3 > nul
cls
setlocal enabledelayedexpansion
echo.
echo.
echo Please make sure your name doesn't contain any spaces!
set /p name=Enter thy name: 
cls
IF EXIST "%name%.save" goto load
echo.
echo.
goto chooserace

:chooserace
cls
title (BoB vs. %ver%) Choose a race
echo (With capitals please) 
echo Human; Orc; Elf; Stickman (EXCLUSIVE); Behemoth (LIMITED); Shredder (Dev Class); Noble (EXCLUSIVE)
set /p race=Enter thy race:
if %race% == Human goto human
if %race% == Orc goto orc
if %race% == Elf goto elf
if %race% == Stickman goto pw
if %race% == Behemoth goto pw2
if %race% == Shredder goto pw3
if %race% == Noble goto pw4
goto Start

:pw4
cls
echo The race you chose is EXCLUSIVE. You must have the Pro Version of Bridge Of Bolania in order to use it.
IF %ispro% == false set err=You do not have the pro version of Bridge Of Bolania ^^! & goto error
IF %ispro% == true goto pw4t
goto chooserace

:pw4t
cls
title (BoB vs. %ver%) Choose a race ^> Noble
echo Noble
echo Nobles are amazing creatures, indeed. They have all the skills of a human, but start off with 5000 gold.
set /p keep="Keep Noble as your race? (y/n)>"
IF "%keep%"=="y" goto humann
goto chooserace

:human
cls
title (BoB vs. %ver%) Choose a race ^> Human
echo Humans, are, I dunno, Human?
set /p keep="Keep Human as your race? (y/n)>"
IF "%keep%"=="y" goto human1
goto chooserace

:human1
set hp=100
set exp=0
set exptill=60
set gold=50
set level=1
set power=4
set powergain=3
set weaponpower=0
set weaponprice=150
set pots=1
set armor=0
set race=Human
goto home0

:humann
set hp=100
set exp=0
set exptill=60
set gold=5000
set level=1
set power=5
set powergain=3
set weaponpower=0
set weaponprice=50
set pots=1
set armor=4
set race=Human Noble
goto home0

:orc
cls
title (BoB vs. %ver%) Choose a race ^> Orc
echo Orcs are a hardy race, both strong, and couragous.
set /p keep="Keep Orc as your race? (y/n)>"
IF "%keep%"=="y" goto orc1
goto chooserace

:orc1
set hp=120
set exp=0
set race=Orc
set exptill=60
set gold=50
set level=1
set power=5
set powergain=3
set weaponpower=0
set weaponprice=150
set pots=0
set armor=0
goto home0

:elf
cls
title (BoB vs. %ver%) Choose a race ^> Elf
echo Elfs are an amazing race, always in the treetops, stalking things.
set /p keep="Keep Elf as your race? (y/n)>"
IF "%keep%"=="y" goto elf1
goto chooserace

:elf1
set hp=80
set exp=0
set exptill=60
set gold=50
set level=1
set power=3
set powergain=5
set weaponpower=3
set weaponprice=150
set race=Elf
set pots=2
set armor=3
goto home0

:pw2
set /p pas2=Password (Included in txt file): 
if %pas2% == CodeX goto behemoth

:behemoth
cls
title (BoB vs. %ver%) Choose a race ^> Behemoth
set /p keep="Keep Behemoth as your race? (y/n)>"
IF "%keep%"=="y" goto behemoth1
goto chooserace

:behemoth1
set hp=250
set exp=0
set race=Behemoth
set exptill=120
set gold=50
set level=1
set power=15
set powergain=3
set weaponpower=0
set weaponprice=150
set pots=0
set armor=0r
goto home0

:pw
set /p pw=Password: 
if %pw% == thosekillmonkeys goto stickman
goto chooserace

:stickman
cls
title (BoB vs. %ver%) Choose a race ^> Stickman
set /p keep="Keep Stickman as your race? (y/n)>"
IF "%keep%"=="y" goto stickman1
goto chooserace

:stickman1
set hp=30
set exp=0
set exptill=60
set gold=50
set level=1
set power=13
set powergain=3
set weaponpower=0
set weaponprice=150
set pots=10
set armor=5
set race=Stickman
goto home0

:pw3
set /p pw3=Password: 
if %pw3% == CodeXisboss goto Shredder

:Shredder
cls
title (BoB vs. %ver%) Choose a race ^> Stickman
set /p keep="Keep Stickman as your race? (y/n)>"
IF "%keep%"=="y" goto Shredder1
goto chooserace

:Shredder1
set hp=50
set exp=0
set exptill=30
set gold=200
set level=1
set power=17
set powergain=5
set weaponpower=0
set weaponprice=150
set pots=5
set armor=10
set race=Shredder
goto home0

:death
cls
color fc
echo You have died...
echo Some items have been taken
set /a exp=%exp% - (%exp% * 65/100)
set /a hp=20 - (%exp% * %diff%)
set /a gold=%gold% - %gold%
pause
color 5f
goto home

:home0
set ishaxor=false
set bgold=50
title (BoB vs. %ver%) Difficulty Selection
cls
color 5f
echo Difficulty System (DS)
echo 1) Beginner (x0 multiplier)
echo 2) Normal (x2 multiplier)
echo 3) Hard (x5 multiplier)
echo 4) Master (x6 multiplier)
set /p difficulty="Select>>"
IF "%difficulty%"=="1" set diff=1
IF "%difficulty%"=="2" set diff=2
IF "%difficulty%"=="3" set diff=5
IF "%difficulty%"=="4" set diff=6
cls
color 80
goto home

:home1
title (BoB vs. %ver%) Difficulty Change
cls
color 5f
echo Difficulty System (DS)
echo 1) Beginner (x0 multiplier)
echo 2) Normal (x2 multiplier)
echo 3) Hard (x5 multiplier)
echo 4) Master (x6 multiplier)
set /p difficulty="Select>>"
IF "%difficulty%"=="1" set diff=1
IF "%difficulty%"=="2" set diff=2
IF "%difficulty%"=="3" set diff=5
IF "%difficulty%"=="4" set diff=6
cls
color 80
goto home

:runaway
title Ran away^^!
cls
echo You ran away successfully
echo But lost some gold and exp.
set hp=80
set /a gold=%gold% - (%exp% + %level%)
set /a exp=%exp% - %level%
pause
goto home

:levelup
cls
title LEVEL UP!
echo LEVEL UP^^!
pause
echo You gained 20 HP, and %powergain% power. Your powergain increased by 1.
set /a  level=%level% + 1
set /a exp=%exp% - %exptill%
set /a exptill=%exptill% + %exptill% * 66 / 100
set /a power=%power% + %powergain%
set /a powergain=%powergain% + 1
set /a hp=%hp% + 20
goto home

:load
color 52
cls
echo Now loading %name%'s game data...
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17 delims=;" %%a in (%name%.save) do (
set name=%%a
set hp=%%b
set exp=%%c
set exptill=%%d
set gold=%%e
set level=%%f
set power=%%g
set powergain=%%h
set weaponpower=%%i
set weaponprice=%%j
set pots=%%k
set armor=%%l
set diff=%%m
set bgold=%%n
set ishaxor=%%o
)
timeout /NOBREAK 10 > nul
cls
color 80
goto home

::# HOME ##########################################################################

:home
IF %weaponpower% EQU 3 set weapon=Elven Bow
IF %weaponpower% EQU 10000 set weapon=Crimson Demon Crusher
IF %weaponpower% EQU 5 set weapon=Dagger
IF %weaponpower% EQU 10 set weapon=Dual Daggers
IF %weaponpower% EQU 8 set weapon=Iron Sword
IF %weaponpower% EQU 100 set weapon=Fists of Awesomeness
color 80
cls
echo [SYSTEM] Autosaving...
echo %name%;%hp%;%exp%;%exptill%;%gold%;%level%;%power%;%powergain%;%weaponpower%;%weaponprice%;%pots%;%armor%;%diff%;%bgold%;%ishaxor% > %name%.save
echo [SYSTEM] Autosave complete.
timeout /NOBREAK 3 > nul
cls
set /a en1hp=40 * %diff%
set /a en2hp=80 * %diff%
set /a en3hp=160 * %diff%
if %exp% geq %exptill% goto levelup
cls
if "%temp3%" equ "1" echo You are a CHEATER! Nice try, bro.
echo Name: %name% Level: %level% Race: %race% Experience %exp%/%exptill%	Defense: %armor%
echo Health: %hp%/100	Gold: %gold%	Potions: %pots% Damage: %power% (+ %weaponpower%)
echo Weapon: %weapon%
echo.
echo What do you want to do?
echo.
echo 1.Battle in the Outskirts of Bolania
echo 2.Go to the Shop
echo 3.Go to the Healer (20 Gold)
echo 4.Save
echo 5.Settings
echo 6.View All Stats
Echo 7.Exit
echo 8.Go to the bank
echo.
set input=
set /p input=Choice:
if %input% equ 1 goto out
if %input% equ 2 goto shop
if %input% equ 3 goto heal
if %input% equ 4 goto save
if %input% equ 5 goto settings
if %input% equ 6 goto stats
if %input% equ 7 exit
if %input% equ 8 goto bank
if "%input%"=="secret" goto cheats
goto home

:bank
cls
echo Banker: Welcome to the Benjamin Bank^^!
IF %bgold% LSS 0 cls & echo Welcome to the Benjamin Bank^^!^^! NOTICE: Your account is currently in debt. You better repay soon, or the bank will close^^!
IF %bgold% LSS %bcloseamt% cls & echo [NOTICE] The bank is closed due to you owing %bgold%. & pause & goto home
echo [SYSTEM] You currently have %bgold% on your bank account.
echo 1) Withdrawl
echo 2) Deposit
echo 3) Leave bank
set choice=
set /p choice="Enter number: "
IF %choice% EQU 1 goto withdrawbank
IF %choice% EQU 2 goto depositbank
IF %choice% EQU 3 goto home
goto bank

:withdrawbank
cls
echo [System] Withdraw from the bank
echo Banker: Sure, you can withdraw money. Just tell me how much and I will make the arrangements.
echo [System] You currently have %bgold% on your account.
set amtw=
set /p amtw="Enter amount to take: "
set /a bgold = %bgold% - %amtw%
set /a gold = %gold% + %amtw%
echo Banker: Ok, %name%! I will make sure it gets delivered to you as soon as possible!
echo [System] Withdrew %amtw% successfully! Your account now has %bgold% left.
pause
goto bank

:now
cls
color 8c
echo We are sorry, but you do not have enough coins to withdraw %amtw%.
set /a bgold = %bgold% + %amtw%
pause
cls
goto home

:depositbank
cls
echo Banker: Yeah sure, just let me know how gold shrows you wish to insert.
echo [SYSTEM] You currently have %gold% that can be deposited.
set amtd=
set /p amtdeposit="Enter amount to deposit: "
set /a gold = %gold% - %amtdeposit%
IF %gold% LSS 0 goto nod
set /a bgold = %bgold% + %amtdeposit%
echo Banker: Sure! We will store this transaction in our book!
echo [SYSTEM] Successfully deposited %amtdeposit%.
pause
goto bank

:nod
cls
color 8c
echo Banker: I'm very sorry, %name%. We cannot deposit %amtdeposit% for you.
set /a gold = %gold% + %amt%
pause
goto home

:cheats
set ishaxor=true
echo Congratulations
echo You have found the cheats!
echo 1. Level 100
echo 2. Gold Cheat
echo 3. Win the game (like a noob)
echo 4. Ogre Fight
echo 5. Fists Of Awesomeness (100 Atk)
echo 6. Crimson Demon Smasher (10000 Atk)
echo 7. Binary Sword (OPowered)
echo 8. Exit Game
echo 9. Exit Cheats
echo -----------------------------
set /p l=Choice: 
if %l% == 1 goto l100
if %l% == 2 goto ghack
if %l% == 3 goto wingame
if %l% == 4 goto out4
if %l% == 5 goto foa
if %l% == 6 goto cds
if %l% == 7 goto bs
if %l% == 8 exit /b 0
if %l% == 9 goto home

:cds
cls
echo [System] You have retrieved a Crimson Demon Smasher!
set weaponpower=10000
pause
cls
goto cheats

:foa
cls
echo [System] You have retrieved the Fists Of Awesomeness!
set weaponpower=100
cls
:l100
cls
echo [System] You have used Level 100 Cheat!
set /a level=(%level% - %level%) + 100
pause
goto cheats

:ghack
cls
echo [LOCATION] Bank of Airgold
set /p goldnum="Enter in gold to add to your account: "
set /a bgold = %gold% + %goldnum%
pause
echo Alchemist Timothy Air-Gold: %goldnum% has been added to your account out of thin air.
echo [SYSTEM] Your bank account now has %bgold% stored.
goto cheats

:shop
cls
echo [SYSTEM] Welcome to the shop, %name%.
echo [SYSTEM] Gold: %gold%
echo 1. Dagger (20 Gold +5 Damage)
echo 2. Sword  (40 Gold +8 Damage)
echo 3. Leather Armor (25 Gold +3 Defense)
echo 4. Iron Armor (100 Gold +6 Defense)
echo 5. Healing Potion (75 Gold +50 Health/Use)
echo 6. Steroids (200 Gold +6 Damage)
echo 7. The Storyline (Prints using nearest printer) (1 Gold)
echo ------------------------------------------
echo 8. Leave shop
set /p d=What do you want to buy?
if %d% == 1 goto Dagger
if %d% == 2 goto Sword
if %d% == 3 goto larmor
if %d% == 4 goto iarmor
if %d% == 5 goto pot
if %d% == 6 goto drugs
if %d% == 7 goto pstoryline
if %d% == 8 goto home
goto home


















:drugs
if %gold% leq 199 goto nem
set /a gold=%gold% - 200
set /a power=%power% + 6
set /a drugs=%drugs% + 1
if %drugs% geq 3 goto od
goto home

:od
cls
color fc
echo [ALERT] You have OD'd
timeout /NOBREAK 2 >nul
echo Some items have been taken
timeout /NOBREAK 2 >nul
echo [System sent a message to %name%] Don't do drugs, kids
set /a exp=%exp% - (%exp% * 65/100)
set /a hp=%hp% - 20 - (%exp% * %diff%)
set /a power=%power% - 18
set /a drugs=%drugs% - 3
set /a gold=%gold% - %gold%
pause>nul
color 5f
goto home

:settings
echo Game Settings
echo 1) Change difficulty
echo 2) Go back to home
echo 3) Reload save (EXPERIMENTAL! USE AT OWN RISK)
echo 4) Print stats
echo 5) Print combat log
set /p choice="Enter choice: "
IF "%choice%"=="1" goto chdiff
IF "%choice%"=="2" goto home
IF "%choice%"=="3" goto load
IF "%choice%"=="4" goto ps
IF "%choice%"=="5" goto pcom
goto settings

:ps
echo Converting stats into a machine-readable file...
echo Bridge Of Bolania Stats Printer by Thomas Streiff. > %name%.stpr
echo %name%, Level %level%. >> %name%.stpr
echo Details: >> %name%.stpr
echo Attack: %power% + %weaponpower% >> %name%.stpr
echo Armor Points: %armor% >> %name%.stpr
echo Your weapon: %weapon% >> %name%.stpr
echo Your difficulty rating: %diff% >> %name%.stpr
echo Your gold: %gold% >> %name%.stpr
echo Your bank has %bgold% stored. >> %name%.stpr
echo You have used drugs %drugs% time(s). >> %name%.stpr
echo Is Haxor: %ishaxor% >> %name%.stpr
echo Done!
pause
echo Printing %name%'s stats...
start /WAIT notepad /p %name%.stpr
echo The document was sent.
pause
goto home

:chdiff
title (BoB vs. %ver%) Change Difficulty.
set /p difficulty="New Difficulty 1-4: "
IF "%difficulty%"=="1" set diff=1
IF "%difficulty%"=="2" set diff=2
IF "%difficulty%"=="3" set diff=5
IF "%difficulty%"=="4" set diff=6
echo Difficulty set!
timeout /NOBREAK 3 > nul
goto home

:larmor
cls
if %gold% leq 24 goto nem
set /a gold=%gold% - 25
IF %armor% EQU 6 set /a armor=%armor% - %armor%
IF %armor% EQU 3 echo [SYSTEM] You cannot purchase this item, as you already own it! & pause & goto home
set /a armor=%armor% + 3
echo Tailor Tai: Thanks for purchasing my leather armor!
pause
goto home

:iarmor
cls
if %gold% leq 19 goto nem
IF %armor% EQU 3 set /a armor=%armor% - %armor%
IF %armor% EQU 6 echo [SYSTEM] You cannot purchase this item, as you already own it! & pause & goto home
set /a gold=%gold% - 100
IF %armor% EQU 3 set /a armor=%armor% - %armor%
IF %armor% EQU 6 echo [SYSTEM] You cannot purchase this item, as you already own it! & pause & goto home
set /a armor=%armor% + 6
echo Blacksmith Blake: Thanks for purchasing my finest armor!
pause
goto home

:pot
cls
if %gold% leq 19 goto nem
set /a gold=%gold% - 70
set /a pots=%pots% + 1
echo ???: ...
pause
goto home

:Sword
cls
if %gold% leq 39 goto nem
set /a gold=%gold% - 40
IF %weaponpower% EQU 5 echo [SYSTEM] You cannot purchase a sword when you have a dagger! & pause & goto home
IF %weaponpower% EQU 10 echo [SYSTEM] You cannot purchase a sword when you have a dagger! & pause & goto home
IF %weaponpower% EQU 8 echo [SYSTEM] You cannot purchase a sword when you already own one! & pause & goto home
set /a weaponpower=%weaponpower% + 8
pause
goto home

:Dagger
cls
if %gold% leq 19 goto nem
IF %weaponpower% EQU 5 goto buydagger
IF %weaponpower% EQU 10 echo [SYSTEM] You cannot purchase more than 2 daggers. & pause & goto home
IF %weaponpower% EQU 8 echo [SYSTEM] Cannot purchase a dagger if you own a sword! & pause & goto home

:buydagger
set /a gold=%gold% - 20
set /a weaponpower=%weaponpower% + 5
echo Blacksmith Blake: Thanks for purchasing my dagger.
pause
goto home

:heal
cls
if %gold% leq 19 goto nem
set /a gold=%gold% - 20
set /a hp=%hp% + 30
echo Healer Dickson: I have done the best I can. Just try not to open the wounds.
timeout /NOBREAK 5 > nul
pause
goto home

:nem
cls
echo [SYSTEM] Sorry %name%, but You don't have enough gold to buy that.
pause>nul
goto home

:: # ENEMY1 #########################################################################

:out
set /a en1hp=40 * %diff%
cls
echo [COMBAT] You were attacked by a Goblin! (Level 1)
pause>nul
goto goblin

:goblin
cls
echo [SYSTEM] Your Health: %hp%
echo [SYSTEM] Goblin health: %en1hp%
echo.
echo 1. Attack
echo 2. Use potion
echo 3. Run Away
set input=5
set /p input=Choice:
if %input% equ 1 goto attackgoblin
if %input% equ 2 goto drinkpotgoblin
if %input% equ 3 goto runaway

:attackgoblin
cls
set /a en1hp=%en1hp% - (%power% + %weaponpower%) - %diff%
if %en1hp% leq 0 goto wingoblin
set /a hp=%hp% - (8 - %armor%)
if %hp% leq 0 goto death
goto goblin

:master1enc
echo [ALERT] You have encountered Master 1: ZGuy!
set mname=ZGuy
set mcolor=5f
set /a mhp=100 * %diff%
timeout /NOBREAK 5 > nul
set nextop=master2enc
cls
goto masterchal

:master2enc
echo You have encountered Master 2: Demon Lord!
set mname=Demon Lord
set mcolor=4c
set /a mhp=200 * %diff%
timeout /NOBREAK 5 > nul
set nextop=endgame
cls
goto masterchal

:masterchal
color %mcolor%
echo MASTER CHALLENGE!
echo Master: %mname%
echo Master HP: %mhp%
echo Your HP: %hp%
echo Current weapon damage: %weaponpower%
echo 1. Attack
echo 2. Use potion
echo 3. Run Away
set input=5
set /p input=Choice:
if %input% equ 1 goto attackmaster
if %input% equ 2 goto drinkmaspot
if %input% equ 3 goto runawaymfail

:runawaymfail
echo Master %mname%: I will not let you flee.
timeout /NOBREAK 3 > nul
goto masterchal

:attackmaster
cls
set /a mhp=%mhp% - (%power% + %weaponpower%)
if %mhp% leq 0 goto winmaster
echo [cAI] Master %mname% is thinking...
timeout /NOBREAK 5 > nul
echo [cAI] Master %mane% attacks!
set /a hp=%hp% - (8 - %armor%) + %diff%
if %hp% leq 0 goto death
goto masterchal

:drinkmaspotion
if %pots% lss 1 (
	echo [Potioneer] You don't have any potions
		pause
		goto masterchal
)
set /a hp = %hp% + 50
set /a pots=%pots% - 1
echo [Potioneer] You have %pots% left.
goto masterchal

:winmaster
echo [COMBAT] MASTER CHALLENGE WON!
color 80
timeout /NOBREAK 3 > nul
goto %nextop%

:wingame
echo You have beat the 2 masters of code. You are now invincible.
set armor=10000
set weaponpower=1000000
echo Please visit the coder's website: www.theXhackers.com
timeout /NOBREAK 2 > nul
cls
echo Credits:
timeout /NOBREAK 1 > nul
cls
echo benmorgan1: Original Code
timeout /NOBREAK 1 > nul
cls
echo Z: Save System/Masters/Improving of ze Code
timeout /NOBREAK 1 > nul
cls
echo With help from Youtube.
timeout /NOBREAK 3 > nul
cls
set /p cont="Continue?>>"
IF "%cont%"=="y" goto home
IF "%cont%"=="n" exit
goto home

:drinkpotgoblin
if %pots% lss 1 (
	echo You don't have any potions
		pause>nul
		goto goblin
)
set /a hp = %hp% + 50
set /a pots=%pots% - 1
goto goblin

:wingoblin
echo You have won the fight!
echo You gained some exp and found some gold!
set /a exp=%exp% + %random% %%2+9%
set /a gold=%gold% + %random% %%5+13%
pause>nul
goto out2
:: # ENEMY2 #########################################################################

:out2
cls
echo 1. Go further
echo 2. Wait here
echo 3. Go back to Balonia
set input=5
set /p input=Choice:
if %input% equ 1 goto out3
if %input% equ 2 goto out
if %input% equ 3 goto home

:out3
cls
echo [COMBAT] Health: %hp%
echo [COMBAT] Skeleton health: %en2hp%
echo.
echo 1. Attack
echo 2. Use potion
echo 3. Run Away
set input=5
set /p input=Choice:
if %input% equ 1 goto attackskeleton
if %input% equ 2 goto drinkpotskeleton
if %input% equ 3 goto runaway
goto skeleton

:skeleton
cls
echo [COMBAT] Health: %hp%
echo [COMBAT] Skeleton health: %en2hp%
echo.
echo 1. Attack
echo 2. Use potion
echo 3. Run Away
set input=5
set /p input=Choice:
if %input% equ 1 goto attackskeleton
if %input% equ 2 goto drinkpotskeleton
if %input% equ 3 goto runaway
:drinkpotskeleton
if %pots% lss 1 (
	echo [Potioneer] You don't have any potions
		pause>nul
		goto skeleton
)
set /a hp = %hp% + 50
set /a pots=%pots% - 1
goto skeleton
:attackskeleton
cls
set /a en2hp=%en2hp% - (%power% + %weaponpower%)
if %en2hp% leq 0 goto winskeleton
set /a hp=%hp% - (9 - %armor%)
if %hp% leq 0 goto death
goto skeleton

:winskeleton
echo You have won the fight!
echo You gained 14 exp and 12 gold
set /a exp=%exp% + 14
set /a gold=%gold% + 12
pause>nul
goto out4

:: # ENEMY3 #########################################################################
:out4
cls
echo Health: %hp%
echo Ogre health: %en3hp%
echo.
echo 1. Attack
echo 2. Use potion
echo 3. Run Away
set input=5
set /p input=Choice:
if %input% equ 1 goto attackogre
if %input% equ 2 goto drinkpotogre
if %input% equ 3 goto runaway
goto out4

:drinkpotogre
if %pots% lss 1 (
	echo You don't have any potions
		pause>nul
		goto out4
)
set /a hp = %hp% + 50
set /a pots=%pots% - 1
goto out4
:attackogre
cls
set /a en3hp=%en3hp% - (%power% + %weaponpower%) - diff
if %en3hp% leq 0 goto winogre
set /a hp=%hp% - (13 - %armor%)
if %hp% leq 0 goto death
goto out4

:winogre
echo You have won the fight!
echo You gained 50 exp and 72 gold
set /a exp=%exp% + 50
set /a gold=%gold% + 72
pause>nul
goto wtg

:wtg
color 0f
echo *You hear a rumbling in the distance, you dash off in search of what it is*
timeout /NOBREAK 5 > nul
echo *You black out...*
timeout /NOBREAK 5 > nul
cls
echo *You wake up in an empty cavern, not remembering anything that happened.*
timeout /NOBREAK 5 > nul
echo *You explore the cavern*
timeout /NOBREAK 2 > nul
goto master1enc

:: # SAVE ###########################################################################

:save
echo Saving data...
timeout /NOBREAK 4 > nul
echo DONE!
timeout /NOBREAK 2 > nul
cls
goto home

:stats
cls
echo Name: %name% Level: %level%
echo Experience: %exp%/%exptill%
echo.
echo Health %hp%/100
echo Gold: %gold%
echo Potions: %pots%
echo.
echo Your power is: %power%
echo Weapon power: %weaponpower%
echo.
echo PRESS ANY KEY
pause>nul
goto home
