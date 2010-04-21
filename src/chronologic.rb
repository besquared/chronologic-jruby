require "java"
require File.join(File.dirname(__FILE__), '..', 'lib', 'lucene-core-3.0.1.jar')

require File.join(File.dirname(__FILE__), 'chronologic', 'configuration')

require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'base_index')
require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'event_index')

require File.join(File.dirname(__FILE__), 'chronologic', 'adapters', 'base_adapter')
require File.join(File.dirname(__FILE__), 'chronologic', 'adapters', 'memory_adapter')

require File.join(File.dirname(__FILE__), 'chronologic', 'functions', 'cohorts')