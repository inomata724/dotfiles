require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'
require 'awesome_print'

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")
IRB.conf[:PROMPT_MODE] = :SIMPLE

AwesomePrint.irb!
