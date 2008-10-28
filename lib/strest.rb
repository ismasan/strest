$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Strest
  
end

require 'rubygems'
require 'active_support'

Dir.glob('lib/strest/*.rb').each do |file|
  require file
end
