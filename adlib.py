#
# ADLIB - The Arcane Document Library
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (C) Clear Code, Inc. 2019
#
# HOW TO USE
# ----------
#
# >>> import adlib
# >>> adlib.load('esr60/Install')
#
# DATA SCHEMA
# -----------
#
#   {
#     'item_id': 'Privacy-2',
#     'item_title': 'フォームの入力履歴の保存の可否',
#     'opts': [{'conf': '"DisableFormHistory": true',
#               'opt_id': 'Privacy-2-3',
#               'opt_no': '3',
#               'opt_title': '保存しない（ポリシーで設定）'}]
#   }

import re
import textwrap
from collections import OrderedDict

# Our configuration database is just a collection of text files.
# Each text file is written in own custom format, which looks like:
#
# Install-1: インストーラの表示名
#
#    :1: 任意の名前
#
#    !define PRODUCT_FULL_NAME  "（名前）"
#
# PAT_ITEM detects the main title line, and PAT_OPT detects the
# option title.

PAT_ITEM = re.compile('^(\S+): (.+)')
PAT_OPT  = re.compile('^ +:(\d+): ([^:]+)(: (.+))?')

class Loader:

    def __init__(self):
        self.data = []
        self.conf = ''

    def feed(self, line):
        line = line.rstrip()

        if line.startswith("#"):
            return

        m = re.match(PAT_ITEM, line)
        if m:
            return self.new_item(m.group(1), m.group(2))

        m = re.match(PAT_OPT, line)
        if m:
            return self.new_opt(m.group(1), m.group(2), m.group(4))

        self.conf += line[4:] + '\n'

    def new_item(self, item_id, item_title):
        self.flush()

        item = {'item_id': item_id,
                'item_no': item_id.rsplit('-', 1)[1],
                'item_title': item_title,
                'opts': []}
        self.data.append(item)

    def new_opt(self, opt_no, opt_title, opt_title_sub):
        self.flush()
        if not opt_title_sub:
            opt_title_sub = ''

        opt_id =  '%s-%s' % (self.data[-1]['item_id'], opt_no)
        opt = {'opt_id': opt_id,
               'opt_no': opt_no,
               'opt_title': opt_title,
               'opt_title_sub': opt_title_sub,
               'conf': ''}
        self.data[-1]['opts'].append(opt)

    def flush(self):
        if not self.data or not self.data[-1]['opts']:
            return

        self.data[-1]['opts'][-1]['conf'] = self.conf.strip()
        self.conf = ''


class VariableLoader:

    def __init__(self):
        self.data = {}
        self.key = None

    def feed(self, line):
        line = line.rstrip()

        if line.startswith("#"):
            return

        if line.startswith("    "):
            if self.key:
                self.data[self.key] += line[4:] + '\n'
            return

        if ':' in line:
            key, value = line.split(':', maxsplit=1)
            self.key = key.strip()
            self.data[self.key] = value.strip()

        if self.key:
            self.data[self.key] += '\n'

    def flush(self):
        for key in self.data:
            self.data[key] = self.data[key].strip()

#
# API

def load(path):
    loader = Loader()

    with open(path) as fp:
        for line in fp:
            loader.feed(line)

    loader.flush()

    return loader.data

def load_as_dict(path):
    try:
        data = load(path)
    except IOError:
        return {}

    res = OrderedDict()
    for item in data:
        for opt in item['opts']:
            res[opt['opt_id']] = opt['conf']
    return res

def load_variables(path):
    loader = VariableLoader()

    with open(path) as fp:
        for line in fp:
            loader.feed(line)

    loader.flush()

    return loader.data
