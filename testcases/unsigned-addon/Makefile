PACKAGE_NAME = unsigned-sample-addon

.PHONY: all xpi clean

all: xpi

xpi: clean
	zip -r -9 $(PACKAGE_NAME)@clear-code.com.xpi manifest.json -x '*/.*'

clean:
	rm -f *.xpi
