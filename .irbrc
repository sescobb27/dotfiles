require 'rubygems' unless defined? Gem
require 'rb-readline'
require 'hirb'
require 'fancy_irb'
require 'awesome_print'

IRB.conf[:AUTO_INDENT] = true
FancyIrb.start colorize: {
  rocket_prompt:  [:blue],
  result_prompt: [:blue],
  input_prompt: nil,
  irb_errors: [:red],
  stderr: [:red, :bright],
  stdout: [:white],
  input: nil, 
  output: true
}

Hirb.enable
AwesomePrint.irb!

def own_methods var
    var.class.instance_methods false
end

def location hsh
    obj, func = hsh[:obj], hsh[:func].to_sym
      obj.method(func).source_location || "Location not found"
end
