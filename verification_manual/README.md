# README

## Requirements

* TeX
* Pandoc
* Ruby
* Rake
* [Mustache](https://mustache.github.io/)

## Install tools (Debian GNU/Linux)

    sudo apt-get install -y pandoc ruby ruby-bundler rake texlive-luatex texlive-lang-japanese texlive-latex-extra gnumeric

And any running X server is required for `ssconvert` (a part of `gnumeric`). If you are using WSL, install VcXsrv, Xmig, or something, and add a line `export DIPSPLAY=:0` to `~/.bashrc`.

## Install gems

    bundle install

## Generate PDF

    rake

## References

* [Markdownで書いたテキストをPDFに変換して納品用ドキュメントを作成する方法 - ククログ(2015-04-27)](http://www.clear-code.com/blog/2015/4/27.html)
