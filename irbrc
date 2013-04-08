require "rubygems"
require "irb/completion"

begin
  require "awesome_print"
  AwesomePrint.irb!
rescue LoadError => err
  warn "Could notload awesome_print: #{err}"
end

IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")
