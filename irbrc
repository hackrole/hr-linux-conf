# use bond for better completion
# auto complete
# use bond for default
#require "irb"
#require "irb/completion"
require 'bond'
Bond.start

# TODO what's this
require "wirble"
Wirble.init
Wirble.colorize

# some things else
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:IRB_NAME]="hackrole_irb"
IRB.conf[:DEBUG_LEVEL]=0
IRB.conf[:SAVE_HISTORY]= 1000
