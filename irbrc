# use bond for better completion
#require "irb"
#require "irb/completion"
require 'bond'
Bond.start

require "wirble"
Wirble.init
Wirble.colorize

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:IRB_NAME]="hackrole_irb"
IRB.conf[:DEBUG_LEVEL]=0
IRB.conf[:SAVE_HISTORY]= 1000
