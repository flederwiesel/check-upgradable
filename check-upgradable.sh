#!/bin/bash

apps=(
	"7+ Taskbar Tweaker,09d31d22178238a329aa6832d492fd6e,https://rammichael.com/downloads/7tt_setup.exe?changelog"
	"Adobe Reader,7fab855641eee46ef4d03b0d386dd741,https://admdownload.adobe.com/bin/live/readerdc64_en_xa_install.exe"
	"Apple iTunes,8802d0f56f34154cbd970ccec27dd24d,https://secure-appldnld.apple.com/itunes12/002-06911-20210923-55ADFFE8-1CC3-11EC-8F53-336B1236DAE3/iTunes64Setup.exe"
	"Beyond Compare,d780b8acb18ffe05b1c6e0492f6c3295,https://scootersoftware.com/download.php"
	"fra-airtraffic,05c530eefc4e5c7652daacca2f4bfe3d,https://api.github.com/repos/flederwiesel/fra-airtraffic/releases/latest"
	"GIMP,4b0b919cd49fe2aac5469ec14d8fd9eb,https://www.gimp.org/downloads/"
	"Go Compiler,3f79343284324e8be42f22a63d1aba07,https://golang.org/dl/"
	"Google Chrome,dfbb1c61381a1bdd6575b3948309abb7,https://latestversionof.com/chrome/"
	"gtk2-runtime,bf989de4faf29a08b39ae207dd6c9c49,https://api.github.com/repos/tschoonj/GTK-for-Windows-Runtime-Environment-Installer/releases/latest| jq -r .published_at"
	"Inno Setup,2e741d0274316d73a6fda5edeff22bed,https://jrsoftware.org/download.php/is.exe,innosetup-6.2.0.exe"
	"KeePass,b013b88d2d5b9a15b9fc9d4462260b49,https://keepass.info/download.html"
	"Mozilla Firefox,eb93daf279690f11923017890071a3de,https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US,Firefox-Setup.exe"
	"Notepad++,a7e341e898ab2b9692c9183892c7185c,https://notepad-plus-plus.org/downloads/"
	"Paint.NET,01708a41ab0942be865b941603e15e08,https://www.getpaint.net/download.html"
	"PCANView,4ee7a82877375a3b41afa2b0e16487ab,https://www.peak-system.com/fileadmin/media/files/pcanview.zip"
	"PuTTY,6eb151692238dd71515a388c7e9522c9,https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html"
	"Python,5e521cb602e9656317099c3c9bcfa5c9,https://www.python.org/downloads/"
	"Qt5 Creator,35d38343536f4afe429dd0fbb6700a6f,https://www.qt.io/offline-installers"
	"SamsungDeX,29f5c4d25f13663eacd10f83803176d7,https://www.samsung.com/global/download/SamsungDeXWin,SamsungDeXSetupWin.exe"
	"SciTE,d1dbbb48f22fc09ea3ac54dd74fe6a29,https://www.scintilla.org/ScintillaDownload.html"
	"TigerVNC,9dd0eba6293fa6b4bc9743ec31db347c,https://api.github.com/repos/TigerVNC/tigervnc/releases/latest| jq -r .published_at"
	"TortoiseGit,f9ae1232e9487183f22ea43277834e8a,https://tortoisegit.org/download/"
	"TortoiseSVN,2f7477e50e164bb95b655b0024f460ed,https://tortoisesvn.net/downloads.html"
	"Unison,4832ba2e4c1ae1f093c0d65c450b4f66,https://api.github.com/repos/bcpierce00/unison/releases/latest| jq -r .published_at"
	"VeraCrypt,fcb084a4a8940fceb45a13a9947bee99,https://www.veracrypt.fr/en/Downloads.html"
	"VirtualBox,e6c06433dcb7bcf561969566b4e85b98,https://www.virtualbox.org/wiki/Downloads"
	"VirtuaWin,7b8395abcd47ee2bc71ab08ccad02308,https://virtuawin.sourceforge.io/?page_id=2"
	"VLC Media Player,770ab3b4a6dd0ba206ebf5b884009578,https://api.github.com/repos/videolan/vlc/tags"
	"Wireshark,d45b60f31e6163246e143df9b00bfba8,https://1.eu.dl.wireshark.org/win64/"
	"XAMPP,095b45ecdb0e46971ab716348082bc73,https://www.apachefriends.org/download.html"
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
