# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

VERSION = 1.1

DATE=$(shell date +%Y%m%d)
UPDATES_PDF = "Firefox_$(DATE).pdf"
BASE=$(shell pwd)

VERIFY_MANUAL_OPT= -c assets/esr78.conf -a assets/esr78.var
PANDOC_OPT_PDF= -N --toc-depth=2 --table-of-contents \
                -f markdown \
                --wrap=perserve \
                -V documentclass=ltjsarticle \
                -V classoption=titlepage \
                --latex-engine=lualatex
PANDOC_OPT_DOCX= --toc-depth=2 --table-of-contents \
                 -f markdown+east_asian_line_breaks \
                 -t docx \
                 --reference-doc="$(BASE)/assets/template.docx"


all: configurations-sheet

fetch-policies-schema:
	rm -f assets/policies-schema.json
	wget https://hg.mozilla.org/mozilla-central/raw-file/tip/browser/components/enterprisepolicies/schemas/policies-schema.json
	mv policies-schema.json assets/

list-untracked-policies:
	cat assets/policies-schema.json | jq -r 'select(.. | .properties?).properties | keys[]' | sort | uniq | while read key; do grep -r "\"$${key}\"" esr* >/dev/null 2>&1 || echo "$${key}"; done

list-unverified-configs:
	bash -c 'grep -r -E -v  "^ " esr* | cut -d : -f 2- | sort | cut -d : -f 1 | uniq | grep -v -f <(grep -r -E -v  "^ " esr* | grep 廃止 | cut -d : -f 2 | sort | uniq) | while read key; do grep -E "$${key}[^0-9]" manual.md >/dev/null 2>&1 || echo "$${key}"; done'

verify-targets-to-chapters.csv:
	./cat-verify ${VERIFY_MANUAL_OPT} -i > "$(PWD)/$@"

configurations-sheet: verify-targets-to-chapters.csv
	./build-xlsx -o config-$(DATE).xlsx assets/esr78.conf assets/esr68.conf verify-targets-to-chapters.csv

verification-manual:
	./cat-verify ${VERIFY_MANUAL_OPT} | pandoc ${PANDOC_OPT_DOCX} -o verify-$(DATE).docx
	./cat-verify ${VERIFY_MANUAL_OPT} -l > verify-$(DATE)-checklist.csv

migration-report:
	cd migration && cat esr78.md | pandoc ${PANDOC_OPT_DOCX} -o "migration-report-esr78-$(DATE).docx" && mv *.docx ../
#	cd migration && cat esr78.md | pandoc ${PANDOC_OPT_PDF} -o "migration-report-esr78-$(DATE).pdf" && mv *.pdf ../

clean:
	rm -f config-*.xlsx
	rm -f migration-report-*.docx migration-report-*.pdf
	rm -f verify-*.docx

.PHONY: fetch-policies-schema list-untracked-policies clean all verify-targets-to-chapters.csv configurations-sheet verification-manual migration-report
