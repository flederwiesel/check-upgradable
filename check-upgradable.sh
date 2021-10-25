#!/bin/bash

apps=(
	# 7+ Taskbar Tweaker v5.12.1
	"7+ Taskbar Tweaker,c83edb24e5c6c4f6a4793f198bf1d7a5,https://rammichael.com/downloads/7tt_setup.exe?changelog"
	# Adobe Reader 2021.007.20099
	"Adobe Reader,7fab855641eee46ef4d03b0d386dd741,https://admdownload.adobe.com/bin/live/readerdc64_en_xa_install.exe"
	# Apple Mobile Device Support 15.0.0.16
	# Apple Software Update 2.6.3.1
	# Bonjour 3.1.0.1
	# iTunes 12.12.1.1
	"Apple iTunes,8802d0f56f34154cbd970ccec27dd24d,https://secure-appldnld.apple.com/itunes12/002-06911-20210923-55ADFFE8-1CC3-11EC-8F53-336B1236DAE3/iTunes64Setup.exe"
	# Beyond Compare 4.4.0, build 25886, released Aug. 13, 2021
	"Beyond Compare,72b9fe0bae1e234a8e07cd7a36832c2c,https://scootersoftware.com/download.php| grep 'Current Version:'"
	# fra-airtraffic 1.0.0.0
	"fra-airtraffic,05c530eefc4e5c7652daacca2f4bfe3d,https://api.github.com/repos/flederwiesel/fra-airtraffic/releases/latest"
	# GIMP 2.10.28
	"GIMP,614e8738c77d13ddaf5dca43b874161c,https://www.gimp.org/downloads/| grep 'The current stable release of GIMP is'"
	# Go 1.17.2
	"Go Compiler,3f79343284324e8be42f22a63d1aba07,https://golang.org/dl/"
	# 96.0.4664.18 (Oct. 21, 2021)
	"Google Chrome,36498a6337566c0d82b8125be77d16c8,https://latestversionof.com/chrome/"
	# 2.24.33-2021-01-30
	# 3.24.24-2021-01-30
	"gtk2-runtime,bf989de4faf29a08b39ae207dd6c9c49,https://api.github.com/repos/tschoonj/GTK-for-Windows-Runtime-Environment-Installer/releases/latest| jq -r .published_at"
	# Inno Setup 6.2.0
	"Inno Setup,12f65953903f0f4c87a4bcdbddf66e9b,https://jrsoftware.org/"
	# KeePass 2.49
	"KeePass,b013b88d2d5b9a15b9fc9d4462260b49,https://keepass.info/download.html"
	# Firefox 3.0
	"Mozilla Firefox,eb93daf279690f11923017890071a3de,https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US,Firefox-Setup.exe"
	# Notepad++ 8.1.9
	"Notepad++,1c364b3b3ca764d748d1b88799bb965b,https://notepad-plus-plus.org/downloads/"
	# Paint.NET 4.3.2
	"Paint.NET,01708a41ab0942be865b941603e15e08,https://www.getpaint.net/download.html"
	# PCANView 4.3.4.615
	"PCANView,4ee7a82877375a3b41afa2b0e16487ab,https://www.peak-system.com/fileadmin/media/files/pcanview.zip"
	# PuTTY 0.76
	"PuTTY,6eb151692238dd71515a388c7e9522c9,https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html"
	# Python 3.10.0
	"Python,63eb318dc73ea7b474871dabc52e87f3,https://www.python.org/downloads/| grep -m 1 'href=\"/downloads/release/python-'"
	# Qt 5.12.11
	"Qt5 LTS,57785f912bd3da663b721b7240ef4c77,https://www.qt.io/offline-installers| sed -rn '/qt\\\\/5\\.12/ { s:.*(<a.*qt/5\\.12.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	# Qt 5.15.x
	"Qt5,5c9ddd5fa18b70342d7d1b26a17ee4aa,https://www.qt.io/offline-installers| sed -rn '/qt\\\\/5\\.15/ { s:.*(<a.*qt/5\\.15.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	# Qt Creator 5.0.2
	"Qt5 Creator,d850f688dd13fd025f7738774e6588e9,https://www.qt.io/offline-installers| sed -rn '/qtcreator\\\\/5/ { s:.*(<a.*qtcreator/5.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	# Qt 6.2.0
	"Qt6,e355971a30765deb782dc0e806b2ed24,https://www.qt.io/offline-installers| sed -rn '/qt\\\\/6/ { s:.*(<a.*qt/6.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	# SamsungDeX 2.0.1.2
	"SamsungDeX,29f5c4d25f13663eacd10f83803176d7,https://www.samsung.com/global/download/SamsungDeXWin,SamsungDeXSetupWin.exe"
	# SciTE 5.1.3
	"SciTE,d1dbbb48f22fc09ea3ac54dd74fe6a29,https://www.scintilla.org/ScintillaDownload.html"
	# TigerVNC 1.11.0
	"TigerVNC,9dd0eba6293fa6b4bc9743ec31db347c,https://api.github.com/repos/TigerVNC/tigervnc/releases/latest| jq -r .published_at"
	# TortoiseGit 2.12.0
	"TortoiseGit,f9ae1232e9487183f22ea43277834e8a,https://tortoisegit.org/download/"
	# TortoiseSVN 1.14.1
	"TortoiseSVN,2f7477e50e164bb95b655b0024f460ed,https://tortoisesvn.net/downloads.html"
	# Unison v2.51.4
	"Unison,4832ba2e4c1ae1f093c0d65c450b4f66,https://api.github.com/repos/bcpierce00/unison/releases/latest| jq -r .published_at"
	# 1.24-Update7 (Friday August 7, 2020)
	"VeraCrypt,6f6bd6953c25802b77c8ae496fd9fda7,https://www.veracrypt.fr/en/Downloads.html"
	# VirtualBox 6.1.28
	"VirtualBox,0adaa84fa5ee6f9c0b38631ec5b62fe7,https://www.virtualbox.org/wiki/Downloads"
	# VirtuaWin 4.5
	"VirtuaWin,7b8395abcd47ee2bc71ab08ccad02308,https://virtuawin.sourceforge.io/?page_id=2"
	# VLC Media Player 3.0.16
	"VLC Media Player,770ab3b4a6dd0ba206ebf5b884009578,https://api.github.com/repos/videolan/vlc/tags"
	# Wireshark 3.4.9
	"Wireshark,d45b60f31e6163246e143df9b00bfba8,https://1.eu.dl.wireshark.org/win64/"
	# XAMPP 8.0.12
	"XAMPP,7dd42f4ef0c65fc7f81b57cd05600eab,https://www.apachefriends.org/download.html"
	# yEd 3.21.1
	"yEd,9688eb8ba62cecb318a1059b0b87ad37,https://www.yworks.com/products/yed/download%23download"
)

DLDIR=/tmp

set -o pipefail

IFS=$'\n' upgradable=($(
for check in "${apps[@]}"
do
	IFS=, read name md5 url filename <<< "$check"

	filter="${url#*|}"

	if [[ $filter = $url ]]; then
		filter=cat
	else
		url="${url%%|*}"
	fi

	if [[ $filename ]]; then
		filename="$DLDIR/$filename"
		wget -q -O "$filename" "$url"
		md5sum -c <(echo "$md5 $filename")
	else
		wget -q -O - "$url" |
		eval $filter |
		md5sum -c <(echo "$md5 -")
	fi &>/dev/null || echo "$check"
done
))

if [[ ${upgradable[@]} ]]; then
	[[ ${#upgradable[@]} -gt 1 ]] && plural=s

	echo "Detected ${#upgradable[@]} upgradable app${plural}:"

	for app in "${upgradable[@]}"
	do
		IFS=, read name md5 url <<< "$app"
		echo "$name: ${url%%|*}"
	done
fi
