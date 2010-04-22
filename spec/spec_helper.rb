require 'rubygems'

require File.join(File.dirname(__FILE__), '..', 'src', 'chronologic.rb')

def recreate_index!(name)
  Chronologic::Indices::EventIndex.new(name).recreate!
end