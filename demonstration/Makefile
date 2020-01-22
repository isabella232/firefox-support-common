all: zip
#all: password-zip

installer: fainstall/make.sh
	./fx-meta-installer/scripts/make_installer.sh "FxMetaInstaller" # "addon1" "addon2"

fainstall/make.sh:
	git submodule update --init

zip: installer
	rm -f ./dist/FxMetaInstaller-source.zip
	cd ./dist && zip -r -9 ./FxMetaInstaller-source.zip ./FxMetaInstaller-source

password-zip: installer dist/password.txt
	rm -f ./dist/FxMetaInstaller-source.zip
	cd ./dist && zip -P "$$(cat ./password.txt | tr -d '\n')" -r -9 ./FxMetaInstaller-source.zip ./FxMetaInstaller-source

dist/password.txt:
	pwgen 12 1 > ./dist/password.txt

