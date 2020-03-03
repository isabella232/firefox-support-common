# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

VERSION = 1.1

all: config.xlsx

config.xlsx: build-xlsx esr60/*
	./build-xlsx

fetch-policies-schema:
	rm -f policies-schema.json
	wget https://hg.mozilla.org/mozilla-central/raw-file/tip/browser/components/enterprisepolicies/schemas/policies-schema.json

list-untracked-policies:
	cat policies-schema.json | jq -r 'select(.. | .properties?).properties | keys[]' | sort | uniq | while read key; do grep -r "\"$${key}\"" esr* >/dev/null 2>&1 || echo "$${key}"; done

list-unverified-configs:
	bash -c 'grep -r -E -v  "^ " esr* | cut -d : -f 2- | sort | cut -d : -f 1 | uniq | grep -v -f <(grep -r -E -v  "^ " esr* | grep 廃止 | cut -d : -f 2 | sort | uniq) | while read key; do grep -E "$${key}[^0-9]" manual.md >/dev/null 2>&1 || echo "$${key}"; done'

clean:
	rm -f config.xlsx

.PHONY: fetch-policies-schema list-untracked-policies clean all
