#!/bin/bash

apps=(
	"7+ Taskbar Tweaker	v5.12.2	e175b5552936b9ed53569971bb73eac7	https://rammichael.com/downloads/7tt_setup.exe?changelog"
	"Adobe Reader	2021.007.20099	7fab855641eee46ef4d03b0d386dd741	https://admdownload.adobe.com/bin/live/readerdc64_en_xa_install.exe"
	#	Extract *.msi from *.exe:
	#	    sh 7z e -y iTunes64Setup.exe AppleMobileDeviceSupport64.msi AppleSoftwareUpdate.msi
	"Apple Mobile Device Support	15.0.0.16	8802d0f56f34154cbd970ccec27dd24d	https://secure-appldnld.apple.com/itunes12/002-06911-20210923-55ADFFE8-1CC3-11EC-8F53-336B1236DAE3/iTunes64Setup.exe"
	"Apple Software Update	2.6.3.1	8802d0f56f34154cbd970ccec27dd24d	https://secure-appldnld.apple.com/itunes12/002-06911-20210923-55ADFFE8-1CC3-11EC-8F53-336B1236DAE3/iTunes64Setup.exe"
	"Beyond Compare	4.4.0, build 25886, released Aug. 13, 2021	72b9fe0bae1e234a8e07cd7a36832c2c	https://scootersoftware.com/download.php| grep 'Current Version:'"
	"fra-airtraffic	1.0.0.0	05c530eefc4e5c7652daacca2f4bfe3d	https://api.github.com/repos/flederwiesel/fra-airtraffic/releases/latest"
	"GIMP	2.10.28	614e8738c77d13ddaf5dca43b874161c	https://www.gimp.org/downloads/| grep 'The current stable release of GIMP is'"
	"Go Compiler	1.17.3	c36b82dcc34b57a41d375791eb671ba7	https://golang.org/dl/| sed -n '/toggleVisible/ { p; q }'"
	"Google Chrome	96.0.4664.35 (Nov. 3, 2021)	d594a59e745a97340cca3865e3561cd8	https://latestversionof.com/chrome/"
	"gtk2-runtime	2.24.33-2021-01-30	bf989de4faf29a08b39ae207dd6c9c49	https://api.github.com/repos/tschoonj/GTK-for-Windows-Runtime-Environment-Installer/releases/latest| jq -r .published_at"
#	"gtk2-runtime	3.24.24-2021-01-30	bf989de4faf29a08b39ae207dd6c9c49	https://api.github.com/repos/tschoonj/GTK-for-Windows-Runtime-Environment-Installer/releases/latest| jq -r .published_at"
	"Inno Setup	6.2.0	12f65953903f0f4c87a4bcdbddf66e9b	https://jrsoftware.org/"
	"KeePass	2.49	b013b88d2d5b9a15b9fc9d4462260b49	https://keepass.info/download.html"
	"Mozilla Firefox	94.0.1	65faae12cd5d4803aacbcbb8ce43d0a4	https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US	Firefox-Setup.exe"
	"Notepad++	8.1.9	1c364b3b3ca764d748d1b88799bb965b	https://notepad-plus-plus.org/downloads/"
	"Paint.NET	4.3.2	01708a41ab0942be865b941603e15e08	https://www.getpaint.net/download.html"
	"PCANView	4.3.4.615	4ee7a82877375a3b41afa2b0e16487ab	https://www.peak-system.com/fileadmin/media/files/pcanview.zip"
	"PuTTY	0.76	6eb151692238dd71515a388c7e9522c9	https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html"
	"Python	3.10.0	63eb318dc73ea7b474871dabc52e87f3	https://www.python.org/downloads/| grep -m 1 'href=\"/downloads/release/python-'"
	"Qt5 LTS	5.12.11	57785f912bd3da663b721b7240ef4c77	https://www.qt.io/offline-installers| sed -rn '/qt\\\\/5\\.12/ { s:.*(<a.*qt/5\\.12.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	"Qt5	5.15.x	5c9ddd5fa18b70342d7d1b26a17ee4aa	https://www.qt.io/offline-installers| sed -rn '/qt\\\\/5\\.15/ { s:.*(<a.*qt/5\\.15.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	"Qt5 Creator	5.0.3	69c4afe24e6384abd8f44e2ff2ad1da5	https://www.qt.io/offline-installers| sed -rn '/qtcreator\\\\/5/ { s:.*(<a.*qtcreator/5.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	"Qt6	6.2.1	68f845b8a490ce3a76e7bd71fc381e36	https://www.qt.io/offline-installers| sed -rn '/qt\\\\/6/ { s:.*(<a.*qt/6.*)</a>.*:\\\\1:g; /-rc[0-9]/!p }'"
	"SamsungDeX	2.0.1.2	29f5c4d25f13663eacd10f83803176d7	https://www.samsung.com/global/download/SamsungDeXWin	SamsungDeXSetupWin.exe"
	"SciTE	5.1.4	f50d548d6a7937da3d6b20ae7a585190	https://www.scintilla.org/ScintillaDownload.html"
	"TigerVNC	1.11.0	9dd0eba6293fa6b4bc9743ec31db347c	https://api.github.com/repos/TigerVNC/tigervnc/releases/latest| jq -r .published_at"
	"TortoiseGit	2.12.0	f9ae1232e9487183f22ea43277834e8a	https://tortoisegit.org/download/"
	"TortoiseSVN	1.14.1	2f7477e50e164bb95b655b0024f460ed	https://tortoisesvn.net/downloads.html"
	"Unison	v2.51.4	4832ba2e4c1ae1f093c0d65c450b4f66	https://api.github.com/repos/bcpierce00/unison/releases/latest| jq -r .published_at"
	"VeraCrypt	1.24-Update7 (Friday August 7, 2020)	6fd85f93ead13e105b06c40d7834ce91	https://www.veracrypt.fr/en/Downloads.html"
	"VirtualBox	6.1.30	dc18811ab22e558a3232c6adcbc468a7	https://www.virtualbox.org/wiki/Downloads"
	"VirtuaWin	4.5	7b8395abcd47ee2bc71ab08ccad02308	https://virtuawin.sourceforge.io/?page_id=2"
	"VLC Media Player	3.0.16	770ab3b4a6dd0ba206ebf5b884009578	https://api.github.com/repos/videolan/vlc/tags"
	"VSCode	1.62.3	f7887ed07e03b3e9df56b6f47a0a2104	https://code.visualstudio.com/sha/download?build=stable&os=win32-x64	VSCodeSetup-x64-1.62.3.exe"
	"Wireshark	3.6.0	c725914a3b7ec640b4663be634c47494	https://www.wireshark.org/download/win64/Wireshark-win64-latest.exe"
	"XAMPP	8.0.12	7dd42f4ef0c65fc7f81b57cd05600eab	https://www.apachefriends.org/download.html"
	"yEd	3.21.1	934a24495d4742e7cdfb266e2bb569fb	https://www.yworks.com/products/yed/download%23download| sed 's/</\\\\n&/g' | grep '<h3>Download'"
)

DLDIR=/tmp

set -o pipefail

IFS=$'\n' upgradable=($(
for check in "${apps[@]}"
do
	IFS=$'\t' read name version md5 url filename <<< "$check"

	filter="${url#*|}"

	if [[ $filter = $url ]]; then
		filter=cat
	else
		url="${url%%|*}"
	fi

	if [[ $filename ]]; then
		filename="$DLDIR/$filename"
		wget -q -O "$filename" "$url"
	else
		filename="$DLDIR/$name.html"
		wget -q -O - "$url" | eval $filter > "$filename"
	fi

	md5sum -c <(echo "$md5 $filename") &>/dev/null && rm -f "$filename" || echo "$check"
done
))

if [[ ${upgradable[@]} ]]; then
	[[ ${#upgradable[@]} -gt 1 ]] && plural=s

	echo "Detected ${#upgradable[@]} upgradable app${plural}:"

	for app in "${upgradable[@]}"
	do
		IFS=$'\t' read name version md5 url <<< "$app"
		echo "$name $version: ${url%%|*}"
	done
fi
