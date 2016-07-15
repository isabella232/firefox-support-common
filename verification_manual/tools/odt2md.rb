#!/usr/bin/env ruby
#
# Usage:
#   1. 手動でverification_manual.odtをHTMLにエクスポート
#   2. `./odt2md.rb configuration/verification_manual.html`
#

input_path = ARGV[0]
basename = File.basename(input_path, ".*")

# 以下のコマンドだとフィールドが消えてしまうので、手動でHTMLにエクスポートする。
#system("libreoffice --headless --convert-to html #{input_path}")

#system("pandoc -f html -t markdown #{basename}.html -o #{basename}.md")
system("pandoc -f html -t markdown #{input_path} -o #{basename}.md")

md = File.read("#{basename}.md")
md.gsub!(/<("[^"]*"|'[^']*'|[^'">])*>/m, "")
#md = md.each_line.reject {|line| /^\\?$/ =~ line }.join("\n")
#md.gsub!(/\n\n/m, "\n")
File.write("#{basename}.md", md)
