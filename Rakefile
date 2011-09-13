require 'rake'
require 'erb'
require 'fileutils'
require 'open-uri'

git_bundles = [
  "git://github.com/tpope/vim-rake.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-bundler.git",

  "git://github.com/tomtom/tcomment_vim.git",

   # "git://github.com/Townk/vim-autoclose.git",
  "https://github.com/Raimondi/delimitMate.git",

  "git://github.com/msanders/snipmate.vim.git",
   # "git://github.com/ervandew/supertab.git",

  "git://github.com/scrooloose/syntastic.git",

  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/wincent/Command-T.git",

  "git://github.com/tpope/vim-surround.git",

  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-ragtag.git",
  "git://github.com/hallettj/jslint.vim.git",

  "git://github.com/docunext/closetag.vim.git",
  "git://github.com/majutsushi/tagbar.git",

  # not sure about this one
  #"git://github.com/vim-scripts/taglist.vim.git",
  #"git://github.com/wgibbs/vim-irblack.git",

  # "git://github.com/vim-scripts/Color-Sampler-Pack.git",
  # "http://conque.googlecode.com/files/conque_1.1.tar.gz",
  # "git://github.com/tpope/vim-haml.git",
  # "git://github.com/michaeljsmith/vim-indent-object.git",
  # "git://github.com/pangloss/vim-javascript.git",
  # "git://github.com/ddollar/nerdcommenter.git",
  # "git://github.com/tpope/vim-surround.git",

  # "git://github.com/ervandew/supertab.git",
  # "git://github.com/timcharper/textile.vim.git",
  # "git://github.com/taq/vim-rspec.git",
  # "git://github.com/msanders/snipmate.vim.git",
  # "git://github.com/tsaleh/vim-align.git",
  # "git://github.com/tpope/vim-unimpaired.git",
  # "git://github.com/vim-scripts/searchfold.vim.git",
  # "git://github.com/tpope/vim-endwise.git",

  # "git://github.com/kchmck/vim-coffee-script.git",

  # "git://github.com/bdd/vim-scala.git",
  # "git://github.com/mattn/gist-vim.git",
  # "git://github.com/vim-scripts/VimClojure.git",

  # "git://github.com/corntrace/bufexplorer.git",
  # "git://github.com/janx/vim-rubytest.git",
  # "git://github.com/greyblake/vim-preview.git",
  # "git://github.com/altercation/vim-colors-solarized.git"
]

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile update_bundles.sh README.rdoc LICENSE].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

namespace :vim do
  desc "upate vim bundles"
  task :update_bundles do
    system "git pull"
    system "git submodule sync"
    system "git submodule update --init --recursive"

  #   cd_bundle_dir

  #   puts "Trashing everything (lookout!)"
  #   Dir["*"].each {|d| FileUtils.rm_rf d }

  #   git_bundles.each do |url|
  #     dir = url.split('/').last.sub(/\.git$/, '')
  #     puts "  Unpacking #{url} into #{dir}"
  #     `git clone #{url} #{dir}`
  #     FileUtils.rm_rf(File.join(dir, ".git"))
  #   end
  end

  desc "build vim bundles"
  task :build_bundles do
    cd_bundle_dir

    puts "build command-t bundle"
    Dir.chdir "Command-T/ruby/command-t" do
      if File.exists?("/usr/bin/ruby1.8") # prefer 1.8 on *.deb systems
        system "/usr/bin/ruby1.8 extconf.rb"
      elsif File.exists?("/usr/bin/ruby") # prefer system rubies
        system "/usr/bin/ruby extconf.rb"
      elsif `rvm > /dev/null 2>&1` && $?.exitstatus == 0
        system "rvm system ruby extconf.rb"
      end
      system "make clean && make"
    end
  end
end

def cd_bundle_dir
  bundles_dir = File.join(File.dirname(__FILE__), "vim/bundle")
  FileUtils.mkdir(bundles_dir) unless File.exist?(bundles_dir)
  FileUtils.cd(bundles_dir)
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end


