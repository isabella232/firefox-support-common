#!/usr/bin/env ruby

md = File.read(ARGV[0])
md = md.gsub(/^(\d+\.\d+[^\n]*)\n-{10,}\n/, "## \\1\n")
md = md.gsub(/^(\d+[^\n]*)\n={10,}\n/, "# \\1\n")
#md = md.gsub(/^(\d+\.\d+)([^ \d]+)$/, "\\1 \\2")
puts md
