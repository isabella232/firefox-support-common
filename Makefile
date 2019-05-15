all: configurations.xlsx

configurations.xlsx: build-xlsx esr60/*
	./build-xlsx

fetch-policies-schema:
	rm -f policies-schema.json
	wget https://hg.mozilla.org/mozilla-central/raw-file/tip/browser/components/enterprisepolicies/schemas/policies-schema.json

clean:
	rm -f configurations.xlsx

.PHONY: fetch-policies-schema clean all
