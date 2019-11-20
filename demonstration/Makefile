all: zip
#all: password-zip

installer: fainstall/make.sh
	./fx-meta-installer/scripts/make_installer.sh "FxMMetaInstaller" # "addon1" "addon2"

fainstall/make.sh:
	git submodule update --init

zip: installer
	rm -f ./dist/FxMMetaInstaller-source.zip
	cd ./dist && zip -r -9 ./FxMMetaInstaller-source.zip ./FxMMetaInstaller-source

password-zip: installer dist/password.txt
	rm -f ./dist/FxMMetaInstaller-source.zip
	cd ./dist && zip -P "$$(cat ./password.txt | tr -d '\n')" -r -9 ./FxMMetaInstaller-source.zip ./FxMMetaInstaller-source

dist/password.txt:
	pwgen 12 1 > ./dist/password.txt

