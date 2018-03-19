PACKAGE_NAME = script-loader

all: xpi

xpi:
	rm -f *.xpi
	zip -r -0 $(PACKAGE_NAME)@clear-code.com.xpi install.rdf *.js >/dev/null 2>/dev/null

