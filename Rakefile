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


