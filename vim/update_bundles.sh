#!/usr/bin/env ruby

git_bundles = [
  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/vim-scripts/Color-Sampler-Pack.git",
  "http://conque.googlecode.com/files/conque_1.1.tar.gz",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/michaeljsmith/vim-indent-object.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/hallettj/jslint.vim.git",
  "git://github.com/robgleeson/vim-markdown-preview.git",
  "git://github.com/wycats/nerdtree.git",
  "git://github.com/ddollar/nerdcommenter.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/vim-scripts/taglist.vim.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/ervandew/supertab.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/taq/vim-rspec.git",
  "git://github.com/vim-scripts/ZoomWin.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tpope/vim-unimpaired.git",
  "git://github.com/vim-scripts/searchfold.vim.git",
  "git://github.com/tpope/vim-endwise.git",
  "git://github.com/wgibbs/vim-irblack.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/ajf/puppet-vim.git",
  "git://github.com/bdd/vim-scala.git",
  "git://github.com/mattn/gist-vim.git",
  "git://github.com/vim-scripts/VimClojure.git",
  "git://github.com/wincent/Command-T.git"
]

# vim_org_scripts = [
#   ["IndexedSearch", "7062",  "plugin"],
#   ["gist",          "12732", "plugin"],
#   ["jquery",        "12107", "syntax"],
# ]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")
FileUtils.mkdir(bundles_dir) unless File.exist?(bundles_dir)

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

# vim_org_scripts.each do |name, script_id, script_type|
#   puts "  Downloading #{name}"
#   local_file = File.join(name, script_type, "#{name}.vim")
#   FileUtils.mkdir_p(File.dirname(local_file))
#   File.open(local_file, "w") do |file|
#     file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
#   end
# end