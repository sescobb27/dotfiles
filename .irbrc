require 'rubygems' unless defined? Gem
require 'rb-readline'
require 'hirb'
require 'interactive_editor'
require 'fancy_irb'
require 'awesome_print'

IRB.conf[:AUTO_INDENT] = true
FancyIrb.start :colorize => {
    :rocket_prompt => [:blue],
    :result_prompt => [:blue],
    :input_prompt => nil,
    :irb_errors => [:red],
    :stderr => [:red, :bright],
    :stdout => [:white],
    :input => nil,
    :output => true,
}

Hirb.enable
AwesomePrint.irb!
#RubyGems installed the following executables:
#    /home/simon/.rvm/rubies/ruby-2.0.0-p247/bin/gem
#
#Ruby Interactive (ri) documentation was installed. ri is kind of like man 
#pages for ruby libraries. You may access it like this:
#    ri Classname
#  ri Classname.class_method
#    ri Classname#instance_method

def own_methods var
  var.class.instance_methods false
end

def location hsh
  obj, func = hsh[:obj], hsh[:func].to_sym
  obj.method(func).source_location || "Location not found"
end
