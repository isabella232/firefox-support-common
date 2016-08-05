#!/usr/bin/env ruby

tools_dir = File.expand_path(File.dirname(__FILE__))
base_dir = File.dirname(tools_dir)
source_name = "verification_manual.md"
source_path = File.join(base_dir, source_name)
tool_path = File.join(tools_dir, "mdformat.rb")

system("git", "checkout", source_path)
system("inplace", "#{tool_path} #{source_path}", source_path)
system("git", "diff", base_dir)
