all: configurations.xlsx

configurations.xlsx: build-xlsx esr60/*
	./build-xlsx

clean:
	rm -f configurations.xlsx

.PHONY: clean all
