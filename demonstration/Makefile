all: installer

installer: fainstall/make.sh
	./fx-meta-installer/scripts/make_installer.sh "FxDemoInstaller" "disableaddons" "autopermission" "disableaboutconfig" "globalchromecss" "disablesync"

fainstall/make.sh:
	git submodule update --init
