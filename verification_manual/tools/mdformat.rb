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
  end

  def to_s
    @text
  end
end

md = Markdown.new(ARGV[0])
md.format!
puts md.to_s
