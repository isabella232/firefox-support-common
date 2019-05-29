"""
HOW TO USE
----------

>>> import adlib
>>> adlib.load('esr60/Install')

DATA SCHEMA
-----------

  {
    'item_id': 'Privacy-2',
    'item_title': 'フォームの入力履歴の保存の可否',
    'opts': [{'conf': '"DisableFormHistory": true',
              'opt_id': 'Privacy-2-3',
              'opt_no': '3',
              'opt_title': '保存しない（ポリシーで設定）'}]
  }
"""

import re
import textwrap

class Loader:

    def __init__(self):
        self.data = []
        self.conf = ''
        self.re_item = re.compile('^(\S+): (.+)')
        self.re_opt = re.compile('^ +:(\d+): (.+)')

    def feed(self, line):
        line = line.rstrip()

        m = re.match(self.re_item, line)
        if m:
            return self.new_item(m.group(1), m.group(2))

        m = re.match(self.re_opt, line)
        if m:
            return self.new_opt(m.group(1), m.group(2))

        self.conf += line[4:] + '\n'

    def new_item(self, item_id, item_title):
        self.flush()

        item = {'item_id': item_id,
                'item_title': item_title,
                'opts': []}
        self.data.append(item)

    def new_opt(self, opt_no, opt_title):
        self.flush()

        opt_id =  '%s-%s' % (self.data[-1]['item_id'], opt_no)
        opt = {'opt_id': opt_id,
               'opt_no': opt_no,
               'opt_title': opt_title,
               'conf': ''}
        self.data[-1]['opts'].append(opt)

    def flush(self):
        if not self.data or not self.data[-1]['opts']:
            return

        self.data[-1]['opts'][-1]['conf'] = self.conf.strip()
        self.conf = ''

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

    res = {}
    for item in data:
        for opt in item['opts']:
            res[opt['opt_id']] = opt['conf']
    return res
