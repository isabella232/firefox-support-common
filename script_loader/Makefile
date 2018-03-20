ADDON_ID = aushelper@mozilla.org

all: xpi

xpi:
	rm -f *.xpi
	cp install.rdf install.rdf.orig
	sed -e "s/%ADDON_ID%/$(ADDON_ID)/" -i install.rdf
	zip -r -0 $(ADDON_ID).xpi install.rdf *.js >/dev/null 2>/dev/null
	rm install.rdf
	mv install.rdf.orig install.rdf

