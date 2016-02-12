all: installer

installer: fainstall/make.sh
	./fx-meta-installer/scripts/make_installer.sh "FxDemoInstaller" "addon1" "addon2"

fainstall/make.sh:
	git submodule update --init
