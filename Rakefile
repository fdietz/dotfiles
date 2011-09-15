require 'rake'
require 'erb'
require 'fileutils'
require 'open-uri'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile update_bundles.sh README.rdoc LICENSE].include? file

    filename = file.sub('.erb', '')
    path = File.join(ENV['HOME'], ".#{filename}")
    if File.exist?(path)
      if File.identical?(file, path)
        puts "identical ~/.#{filename}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{filename}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{filename}"
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


