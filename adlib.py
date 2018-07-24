"""A Simple Library for Firefox Setting Definitions.

Usage:

  >>> import adlib
  >>> adlib.load(open('esr60/Install'))
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

def load(path):
    loader = Loader()

    with open(path) as fp:
        for line in fp:
            loader.feed(line)

    loader.flush()

    return loader.data

def dump(data):
    res = ''

    for item in data:
        if all('廃止' in opt['opt_title'] for opt in item['opts']):
            item['item_title'] = '[廃止] ' + item['item_title']

        res += '%s: %s' % (item['item_id'], item['item_title'])

        res += '\n\n'

        for opt in item['opts']:
            res += '    :%s: %s' % (opt['opt_no'], opt['opt_title'])
            res += '\n\n'
            res += textwrap.indent(opt['conf'], '    ')
            res += '\n\n'

    return res
