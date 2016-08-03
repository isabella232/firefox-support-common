#!/usr/bin/env ruby

class Markdown
  def initialize(path)
    @text = File.read(path)
  end

  def format!
    format_header!
    format_space!
    format_list!
    remove_garbage!
    remove_needless_linefeed!
  end

  def format_header!
    @text.gsub!(/^(\d+\.\d+[^\n]*)\n-{10,}\n/, "## \\1\n")
    @text.gsub!(/^(\d+[^\n]*)\n={10,}\n/, "# \\1\n")
  end

  def format_space!
    @text.gsub!(/^(\d+\.\d+)([^ \d]+)$/, "\\1 \\2")
    @text.gsub!(/^(#+)(\d+)$/, "\\1 \\2")
    @text.gsub!(/^(#+ \d+(?:\.\d+)*)[[:space:]]*([^ \.\d])/, "\\1 \\2")
  end

  def format_list!
    @text.gsub!(/^(\d+\.)([^ ])/, "\\1 \\2")
  end

  def remove_garbage!
    @text.gsub!(/^(#.*) +{.*}$/, "\\1")
    @text.gsub!(/^1.  - /, "    - ")
    @text.gsub!(/^\d+\. *(\d+\.) */, "\\1 ")
  end

  def remove_needless_linefeed!
    @text.gsub!(/UI\n\s+Text/, "UI Text")
    @text.gsub!(/Disable\n\s+about:config/, "Disable about:config")
    @text.gsub!(/Disable\n\s+addons/, "Disable addons")
    @text.gsub!(/Fx\n\s+Meta Installer/, "Fx Meta Installer")
    @text.gsub!(/Mozilla\n\s+Firefox/, "Mozilla Firefox")
    @text.gsub!(/Mozilla\n\s+ Maintenance Service/, "Mozilla Maintenance Service")
    @text.gsub!(/Program\n\s+Files/, "Program Files")
    @text.gsub!(/set\n\s+NSPR/, "set NSPR")
    @text.gsub!(/Program\n?\s+Data/, "ProgramData")
  end

  def to_s
    @text
  end
end

md = Markdown.new(ARGV[0])
md.format!
puts md.to_s
