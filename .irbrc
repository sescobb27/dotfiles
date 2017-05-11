require 'rubygems' unless defined? Gem
require 'rb-readline'
require 'hirb'
require 'awesome_print'
require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true

Hirb.enable
extend Hirb::Console
AwesomePrint.irb!

def own_methods var
    var.class.instance_methods false
end

def location hsh
    obj, func = hsh[:obj], hsh[:func].to_sym
      obj.method(func).source_location || "Location not found"
end
