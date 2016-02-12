all: installer

installer: fainstall/make.sh
	./fx-meta-installer/scripts/make_installer.sh "FxDemoInstaller" "disableaddons" "autopermission"

fainstall/make.sh:
	git submodule update --init
